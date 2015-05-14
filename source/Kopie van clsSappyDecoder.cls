VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsSappyDecoder"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "All routines for the processing of Sappy code"
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'#Const XDebug = True

Private Declare Function DeleteFile Lib "kernel32" Alias "DeleteFileA" (ByVal lpFileName As String) As Long
Private Declare Function GetTickCount Lib "kernel32.dll" () As Long

Private Const ErrorChecking = False
Private Const GBSquareMulti = 0.5
Private Const GBWaveMulti = 0.5
Private Const GBNoiseMulti = 0.5
Private lasttempo As Long

Public SappyChannels As New SChannels
Attribute SappyChannels.VB_VarDescription = "Collection of channels."
Public NoteQueue As New NoteInfos
Private NoteArray(0 To 32) As New NoteInfo

Public WithEvents EventProcessor As CTimerMM
Attribute EventProcessor.VB_VarHelpID = -1
Public WithEvents NoteProcessor As CTimerMM
Attribute NoteProcessor.VB_VarHelpID = -1

Public TotalTicks As Long 'by Kawa
Public TotalMSecs As Long 'by Kawa
Public Beats As Long 'by Kawa
Public Event SongLoop() 'by Kawa
Public Event SongFinish()
Attribute SongFinish.VB_Description = "Raised when the song finishes playing."
Public Event UpdateDisplay()
Attribute UpdateDisplay.VB_Description = "Raised when there's new tracking info to display."
Public Event ChangedTempo(ByVal newtempo As Long)
Attribute ChangedTempo.VB_Description = "Raised when a Tempo command is found in the song data"
Public Event PlayedANote(ByVal channelid As Byte, ByVal notenum As Byte, ByVal lenno As Byte)
Public Event Loading(ByVal status As Integer)
Public Event Beat(ByVal Beats As Long)

Public SamplePool As New SSamples
Public Directs As New SDirects
Public DrumKits As New SDrumKits
Public Instruments As New SInstruments

'local variable(s) to hold property value(s)
Private mvarNoteFrameCounter As Double
Private mvarTickCounter As Double
Private mvarLastTick As Double
Private mvarFileName As String
Private mvarTranspose As Integer
Private mvarSongListPointer As Long
Private mvarSongPointer As Long
Private mvarSongNumber As Long
Private mvarLayer As Long
Private mvarInstrumentTablePointer As Long
Private mvarCurrentSong As Long
Private incr As Long
Private incr2 As Long
Private mvarGB1Chan As Byte
Private mvarGB2Chan As Byte
Private mvarGB3Chan As Byte
Private mvarGB4Chan As Byte
Private mvarPlaying As Boolean
Private mvarTempo As Long
Private InstrumentTable As Long

Public Enum SongOutputTypes
  sotNull = 0
  sotWave = 1
  sotMIDI = 2
End Enum

Private mvarOutputType As SongOutputTypes
Private mvarGlobalVolume As Integer  'by Kawa

Private Const GBWaveBaseFreq = 880
Private Const SappyPPQN = 24

Private MidiPatchMap(127) As Integer 'by Kawa
Private MidiPatchTrans(127) As Integer
Private MidiDrumMap(127) As Integer
Private EarPiercers(127) As Integer
Private EarPiercerCnt As Integer

Private PlayingNow As Boolean

Private Type tBufferRawMidiEvent
  RawDelta As Long
  Ticks As Long
  EventCode As String
End Type
'Private Type tBufferTrack
'  Length As Long
'  Events(-1 To 5000) As tBufferRawMidiEvent
'End Type
'Private BufferTrack(32) As tBufferTrack
Private PreviousEvent As tBufferRawMidiEvent
Private Recording As Boolean
Private midifile As Integer

Private Sub BufferEvent(EventCode As String, ByVal Ticks As Long)
  On Error GoTo hell
  If Recording = False Then Exit Sub
  If midifile <> 42 Then Exit Sub
  Dim newevent As tBufferRawMidiEvent
  'Ticks = Ticks * (mvarTempo / 60) '/ (60000000 / SappyPPQN) 'MATH!
  newevent.Ticks = Ticks
  newevent.RawDelta = Ticks - PreviousEvent.Ticks
  newevent.EventCode = EventCode
  WriteVarLen midifile, newevent.RawDelta
  Put #midifile, , newevent.EventCode
  PreviousEvent = newevent
  Exit Sub
hell:
  Debug.Print "fucked up: eventcode: " & EventCode & ", ticks: " & Ticks
End Sub

Public Property Get GlobalVolume() As Integer  'by Kawa
  GlobalVolume = mvarGlobalVolume
End Property
Public Property Let GlobalVolume(ByVal n As Integer) 'by Kawa
  mvarGlobalVolume = n
  'If PlayingNow = True Then
  FSOUND_SetSFXMasterVolume n
End Property

'Public Property Get MidiMap(ByVal o As Integer) As Integer  'by Kawa
'  MidiMap = MidiPatchMap(o)
'End Property
'Public Property Let MidiMap(ByVal o As Integer, ByVal n As Integer) 'by Kawa
'  MidiPatchMap(o) = n
'End Property
Public Sub SetMidiPatchMap(Index As Integer, instrument As Integer, Transpose As Integer)
  MidiPatchMap(Index) = instrument
  MidiPatchTrans(Index) = Transpose
End Sub
Public Sub SetMidiDrumMap(Index As Integer, NewDrum As Integer)
  MidiDrumMap(Index) = NewDrum
End Sub
Public Sub AddEarPiercer(InstrumentID As Integer)
  EarPiercers(EarPiercerCnt) = InstrumentID
  EarPiercerCnt = EarPiercerCnt + 1
End Sub
Public Sub ClearMidiPatchMap() 'by Kawa
  For i = 0 To 127
    MidiPatchMap(i) = i
    MidiDrumMap(i) = i
    EarPiercers(i) = -1
  Next i
  EarPiercerCnt = 0
End Sub

'//------------------------------------------------------------------------------------------------------//

Public Property Set SetNoteInfo(ByVal NoteID As Byte, NewNoteInfo As NoteInfo)
  Set NoteArray(NoteID) = NewNoteInfo
End Property
Public Property Get GetNoteInfo(ByVal NoteID As Byte) As NoteInfo
Attribute GetNoteInfo.VB_Description = "Returns information about a given note in play."
  Set GetNoteInfo = NoteArray(NoteID)
End Property

Public Property Let outputtype(ByVal vData As SongOutputTypes)
  Let mvarOutputType = vData
End Property
Public Property Get outputtype() As SongOutputTypes
  Let outputtype = mvarOutputType
End Property

Public Property Let Playing(ByVal vData As Boolean)
  mvarPlaying = vData
End Property
Public Property Get Playing() As Boolean
  Playing = mvarPlaying
End Property

Public Property Let CurrentSong(ByVal vData As Long)
  mvarCurrentSong = vData
End Property
Public Property Get CurrentSong() As Long
  CurrentSong = mvarCurrentSong
End Property

Public Property Let TickCounter(ByVal vData As Double)
  mvarTickCounter = vData
End Property
Public Property Get TickCounter() As Double
  TickCounter = mvarTickCounter
End Property

Public Property Let Transpose(ByVal vData As Long)
  mvarTranspose = vData
End Property
Public Property Get Transpose() As Long
  Transpose = mvarTranspose
End Property

Public Property Let Tempo(ByVal vData As Long)
  mvarTempo = vData
End Property
Public Property Get Tempo() As Long
  Tempo = mvarTempo
End Property

Public Property Let Layer(ByVal vData As Long)
  mvarLayer = vData
End Property
Public Property Get Layer() As Long
  Layer = mvarLayer
End Property

Public Property Let SongNumber(ByVal vData As Long)
  mvarSongNumber = vData
End Property
Public Property Get SongNumber() As Long
  SongNumber = mvarSongNumber
End Property

Public Property Let SongPointer(ByVal vData As Long)
  mvarSongPointer = vData
End Property
Public Property Get SongPointer() As Long
  SongPointer = mvarSongPointer
End Property

Public Property Let SongListPointer(ByVal vData As Long)
  mvarSongListPointer = vData
End Property
Public Property Get SongListPointer() As Long
  SongListPointer = mvarSongListPointer
End Property

Public Property Let InstrumentTablePointer(ByVal vData As Long)
  mvarInstrumentTablePointer = vData
End Property
Public Property Get InstrumentTablePointer() As Long
  InstrumentTablePointer = mvarInstrumentTablePointer
End Property

Public Property Let Filename(ByVal vData As String)
  mvarFileName = vData
End Property
Public Property Get Filename() As String
  Filename = mvarFileName
End Property

Public Function NoteBelongsToChannel(ByVal NoteID As Byte, ByVal channelid As Long) As Boolean
  NoteBelongsToChannel = (NoteArray(NoteID).ParentChannel = channelid)
End Function

Public Sub StopSong()
  On Error Resume Next
  Debug.Print "StopSong()"
  CloseFile 1
  CloseFile 2
  EventProcessor.Enabled = False
  FSOUND_Close
  MidiClose
  
  If Recording Then
    Debug.Print "StopSong(): Recording stops..."
    Recording = False
    midifile = 42
    Dim tlen As Long
    tlen = LOF(midifile) - 12
    Debug.Print "StopSong(): Track length is " & tlen & ", total ticks " & Me.TotalTicks
    'BufferEvent Chr$(&HFF) & Chr$(&H2F) & Chr(0), Me.TotalTicks
    Put #midifile, , CByte(10)
    Put #midifile, , CByte(&HFF)
    Put #midifile, , CByte(&H2F)
    Put #midifile, , CByte(0)
    
    Put #midifile, , CLng(0)
    Put #midifile, , CLng(0)
    Put #midifile, &H13, FlipLong(tlen) 'FlipLong(&H12345678)
    Close midifile
  End If
  
  RaiseEvent SongFinish
  
End Sub

Public Sub PlaySong(ByVal Filename As String, ByVal SongNumber As Long, Optional ByVal SongListPointer As String, Optional WantToRecord As Boolean = False, Optional RecordTo As String = "midiout.mid")
Attribute PlaySong.VB_Description = "Loads, decodes and plays a song."
  If ErrorChecking = True Then On Error GoTo hell
  
  mvarFileName = Filename
  mvarSongListPointer = SongListPointer
  mvarSongNumber = SongNumber
  
  If mvarPlaying = True Then StopSong
  
  Dim inshead As SappyInstrumentHeader
  Dim drmhead As SappyDrumKitHeader
  Dim dirhead As SappyDirectHeader
  Dim smphead As SappySampleHeader
  Dim mulhead As SappyMultiHeader
  Dim gbhead As SappyNoiseHeader
  
  'MsgBox "Clear..."
  SappyChannels.Clear
  DrumKits.Clear
  SamplePool.Clear
  Instruments.Clear
  Directs.Clear
  NoteQueue.Clear
  For i = 0 To 31
    NoteArray(i).Enabled = False
  Next i
 
  'MsgBox "Load..."
  OpenFile 1, mvarFileName
  a = ReadGBAROMPointer(1, mvarSongListPointer + SongNumber * 8)
  mvarSongPointer = a
  mvarLayer = ReadLittleEndian(1, 4)
  b = ReadByte(1, a)
  mvarInstrumentTablePointer = ReadGBAROMPointer(1, a + 4)
  
  'MsgBox "Analyze..."
  RaiseEvent Loading(0)
  Dim xta As New SSubroutines
  For i = 1 To b
    'MsgBox "Track " & i & "..."
    loopoffset = -1
    SappyChannels.Add
    pc = ReadGBAROMPointer(1, a + 4 + i * 4)
    SappyChannels(i).TrackPointer = pc
    xta.Clear
    Do
      ReadOffset 1, pc
      c = ReadByte(1)
      If c >= 0 And c <= &HB0 Or c = &HCE Or c = &HCF Or c = &HB4 Then
        pc = pc + 1
      ElseIf c = &HB9 Then
        pc = pc + 4
      ElseIf c >= &HB5 And c <= &HCD Then
        pc = pc + 2
      ElseIf c = &HB2 Then
        loopoffset = ReadGBAROMPointer(1)
        pc = pc + 5
        Exit Do
      ElseIf c = &HB3 Then
        xta.Add ReadGBAROMPointer(1)
        pc = pc + 5
      ElseIf c >= &HD0 And c <= &HFF Then
        pc = pc + 1
        While ReadByte(1) < &H80
          pc = pc + 1
        Wend
      End If
    Loop Until c = &HB1
    SappyChannels(i).TrackLengthInBytes = pc - SappyChannels(i).TrackPointer
    pc = ReadGBAROMPointer(1, a + 4 + i * 4)

    'MsgBox "Mark 1..."
    cticks = 0
    cEI = 0
    lc = &HBE
    Dim lln(0 To 65)
    Dim llv(0 To 65)
    Dim lla(0 To 65)
    lp = 0
    src2 = 1
    insub = 0
    tR = 0
    SappyChannels(i).LoopPointer = -1
    Do
      ReadOffset 1, pc
      If pc >= loopoffset And SappyChannels(i).LoopPointer = -1 And loopoffset <> -1 Then
        SappyChannels(i).LoopPointer = SappyChannels(i).EventQueue.count + 1
      End If
      c = ReadByte(1)
      If (c <> &HB9 And c >= &HB5 And c < &HC5) Or c = &HCD Then
        D = ReadByte(1)
        If c = &HBC Then tR = SignedByteToInteger(D)
        If c = &HBD Then lp = D
        If c = &HBE Or c = &HBF Or c = &HC0 Or c = &HC4 Or c = &HCD Then lc = c
        SappyChannels(i).EventQueue.Add cticks, c, D, 0, 0
        pc = pc + 2
      ElseIf c > &HC4 And c < &HCF Then
        SappyChannels(i).EventQueue.Add cticks, c, 0, 0, 0
        pc = pc + 1
      ElseIf c = &HB9 Then
        D = ReadByte(1)
        e = ReadByte(1)
        F = ReadByte(1)
        SappyChannels(i).EventQueue.Add cticks, c, D, e, F
        pc = pc + 4
      ElseIf c = &HB4 Then
        If insub = 1 Then
          pc = rpc
          insub = 0
        Else
          pc = pc + 1
        End If
      ElseIf c = &HB3 Then
        rpc = pc + 5
        insub = 1
        pc = ReadGBAROMPointer(1)
      ElseIf c >= &HCF And c <= &HFF Then
        pc = pc + 1
        lc = c
        g = False
        nc = 0
        While g = False
          D = ReadByte(1)
          If D >= &H80 Then
            If nc = 0 Then
              pn = lln(nc) + tR
              SappyChannels(i).EventQueue.Add cticks, c, pn, llv(nc), lla(nc)
            End If
            g = True
          Else
            'On Error GoTo hell
            lln(nc) = D
            pc = pc + 1
            e = ReadByte(1)
            If e < &H80 Then
              llv(nc) = e
              pc = pc + 1
              F = ReadByte(1)
              If F >= &H80 Then
                F = lla(nc)
                g = True
              Else
                lla(nc) = F
                pc = pc + 1
                nc = nc + 1
              End If
            Else
              e = llv(nc)
              F = lla(nc)
              g = True
            End If
            pn = D + tR
            SappyChannels(i).EventQueue.Add cticks, c, pn, e, F
          End If
                  
          On Error Resume Next
            
          If PatchExists(lp) = False Then
            inshead = ReadInstrumentHead(1, mvarInstrumentTablePointer + CLng(lp) * CLng(12))
              
            If (inshead.bChannel And &H80) = &H80 Then
              drmhead = ReadDrumKitHead(1)
              inshead = ReadInstrumentHead(1, GBAROMPointerToOffset(drmhead.pDirectTable + CLng(pn) * CLng(12)))
              dirhead = ReadDirectHead(1)
              gbhead = ReadNoiseHead(1, GBAROMPointerToOffset(drmhead.pDirectTable + CLng(pn) * CLng(12)) + 2)
              DrumKits.Add Str(lp)
              DrumKits(Str(lp)).Directs.Add Str(pn)
              SetStuff DrumKits(Str(lp)).Directs(Str(pn)), inshead, dirhead, gbhead
              If Instruments(Str(lp)).Directs(Str(cdr)).outputtype = dotDirect Or Instruments(Str(lp)).Directs(Str(cdr)).outputtype = dotWave Then GetSample DrumKits(Str(lp)).Directs(Str(pn)), dirhead, smphead, False
        
            ElseIf (inshead.bChannel And &H40) = &H40 Then 'multi
              mulhead = ReadMultiHead(1)
              Instruments.Add Str(lp)
              Instruments(Str(lp)).KeyMaps.Add 0, Str(pn)
              Instruments(Str(lp)).KeyMaps(Str(pn)).AssignDirect = ReadByte(1, GBAROMPointerToOffset(mulhead.pKeyMap) + pn)
              cdr = Instruments(Str(lp)).KeyMaps(Str(pn)).AssignDirect
              inshead = ReadInstrumentHead(1, GBAROMPointerToOffset(mulhead.pDirectTable + CLng(cdr) * CLng(12)))
              dirhead = ReadDirectHead(1)
              gbhead = ReadNoiseHead(1, GBAROMPointerToOffset(mulhead.pDirectTable + CLng(cdr) * CLng(12)) + 2)
              Instruments(Str(lp)).Directs.Add Str(cdr)
              SetStuff Instruments(Str(lp)).Directs(Str(cdr)), inshead, dirhead, gbhead
              If Instruments(Str(lp)).Directs(Str(cdr)).outputtype = dotDirect Or Instruments(Str(lp)).Directs(Str(cdr)).outputtype = dotWave Then GetSample Instruments(Str(lp)).Directs(Str(cdr)), dirhead, smphead, False
          
            Else 'direct or gb sample
                
              dirhead = ReadDirectHead(1)
              gbhead = ReadNoiseHead(1, mvarInstrumentTablePointer + CLng(lp) * CLng(12) + 2)
              Directs.Add Str(lp)
              SetStuff Directs(Str(lp)), inshead, dirhead, gbhead
              If Directs(Str(lp)).outputtype = dotDirect Or Directs(Str(lp)).outputtype = dotWave Then GetSample Directs(Str(lp)), dirhead, smphead, True
              
            End If
            
          Else 'patch already exists
        
            inshead = ReadInstrumentHead(1, mvarInstrumentTablePointer + CLng(lp) * CLng(12))
            If (inshead.bChannel And &H80) = &H80 Then
              drmhead = ReadDrumKitHead(1)
              inshead = ReadInstrumentHead(1, GBAROMPointerToOffset(drmhead.pDirectTable + CLng(pn) * CLng(12)))
              dirhead = ReadDirectHead(1)
              gbhead = ReadNoiseHead(1, GBAROMPointerToOffset(drmhead.pDirectTable + CLng(pn) * CLng(12)) + 2)
              If DirectExists(DrumKits(Str(lp)).Directs, pn) = False Then
                DrumKits(Str(lp)).Directs.Add Str(pn)
                SetStuff DrumKits(Str(lp)).Directs(Str(pn)), inshead, dirhead, gbhead
                If DrumKits(Str(lp)).Directs(Str(pn)).outputtype = dotDirect Or DrumKits(Str(lp)).Directs(Str(pn)).outputtype = dotWave Then GetSampleWithMulti DrumKits(Str(lp)).Directs(Str(pn)), dirhead, smphead, False
              End If
            
            ElseIf (inshead.bChannel And &H40) = &H40 Then 'multi
              mulhead = ReadMultiHead(1)
              If KeyMapExists(Instruments(Str(lp)).KeyMaps, pn) = False Then Instruments(Str(lp)).KeyMaps.Add ReadByte(1, GBAROMPointerToOffset(mulhead.pKeyMap) + pn), Str(pn)
              cdr = Instruments(Str(lp)).KeyMaps(Str(pn)).AssignDirect
              inshead = ReadInstrumentHead(1, GBAROMPointerToOffset(mulhead.pDirectTable + CLng(cdr) * CLng(12)))
              dirhead = ReadDirectHead(1)
              gbhead = ReadNoiseHead(1, GBAROMPointerToOffset(mulhead.pDirectTable + CLng(cdr) * CLng(12)) + 2)
              If DirectExists(Instruments(Str(lp)).Directs, cdr) = False Then
                Instruments(Str(lp)).Directs.Add Str(cdr)
                SetStuff Instruments(Str(lp)).Directs(Str(cdr)), inshead, dirhead, gbhead
                If Instruments(Str(lp)).Directs(Str(cdr)).outputtype = dotDirect Or Instruments(Str(lp)).Directs(Str(cdr)).outputtype = dotWave Then GetSampleWithMulti Instruments(Str(lp)).Directs(Str(cdr)), dirhead, smphead, False
              End If
            End If
          End If
            
          On Error GoTo 0
        
        Wend
    
      ElseIf c >= &H0 And c < &H80 Then
      
        On Error Resume Next
      
        If lc < &HCF Then
          SappyChannels(i).EventQueue.Add cticks, lc, c, 0, 0
          pc = pc + 1
        Else
          c = lc
          ReadOffset 1, pc
          g = False
          nc = 0
          While g = False
            D = ReadByte(1)
            If D >= &H80 Then
              If nc = 0 Then
                pn = lln(nc) + tR
                SappyChannels(i).EventQueue.Add cticks, c, pn, llv(nc), lla(nc)
              End If
              g = True
            Else
              lln(nc) = D
              pc = pc + 1
              e = ReadByte(1)
              If e < &H80 Then
                llv(nc) = e
                pc = pc + 1
                F = ReadByte(1)
                If F >= &H80 Then
                  F = lla(nc)
                  g = True
                Else
                  lla(nc) = F
                  pc = pc + 1
                  nc = nc + 1
                End If
              Else
                e = llv(nc)
                F = lla(nc)
                g = True
              End If
              pn = D + tR
              SappyChannels(i).EventQueue.Add cticks, c, pn, e, F
            End If
            
            On Error Resume Next
            
            If PatchExists(lp) = False Then
              inshead = ReadInstrumentHead(1, mvarInstrumentTablePointer + CLng(lp) * CLng(12))
              If (inshead.bChannel And &H80) = &H80 Then
                drmhead = ReadDrumKitHead(1)
                inshead = ReadInstrumentHead(1, GBAROMPointerToOffset(drmhead.pDirectTable + CLng(pn) * CLng(12)))
                dirhead = ReadDirectHead(1)
                gbhead = ReadNoiseHead(1, GBAROMPointerToOffset(drmhead.pDirectTable + CLng(pn) * CLng(12)) + 2)
                DrumKits.Add Str(lp)
                DrumKits(Str(lp)).Directs.Add Str(pn)
                SetStuff DrumKits(Str(lp)).Directs(Str(pn)), inshead, dirhead, gbhead
                If DrumKits(Str(lp)).Directs(Str(pn)).outputtype = dotDirect Or DrumKits(Str(lp)).Directs(Str(pn)).outputtype = dotWave Then GetSample DrumKits(Str(lp)).Directs(Str(pn)), dirhead, smphead, True
              
              ElseIf (inshead.bChannel And &H40) = &H40 Then 'multi
                mulhead = ReadMultiHead(1)
                Instruments.Add Str(lp)
                Instruments(Str(lp)).KeyMaps.Add ReadByte(1, GBAROMPointerToOffset(mulhead.pKeyMap) + pn), Str(pn)
                cdr = Instruments(Str(lp)).KeyMaps(Str(pn)).AssignDirect
                inshead = ReadInstrumentHead(1, GBAROMPointerToOffset(mulhead.pDirectTable + CLng(cdr) * CLng(12)))
                dirhead = ReadDirectHead(1)
                gbhead = ReadNoiseHead(1, GBAROMPointerToOffset(mulhead.pDirectTable + CLng(cdr) * CLng(12)) + 2)
                Instruments(Str(lp)).Directs.Add Str(cdr)
                SetStuff Instruments(Str(lp)).Directs(Str(cdr)), inshead, dirhead, gbhead
                If Instruments(Str(lp)).Directs(Str(cdr)).outputtype = dotDirect Or Instruments(Str(lp)).Directs(Str(cdr)).outputtype = dotWave Then GetSampleWithMulti Instruments(Str(lp)).Directs(Str(cdr)), dirhead, smphead, False
          
              Else 'direct or gb sample
                dirhead = ReadDirectHead(1)
                gbhead = ReadNoiseHead(1, mvarInstrumentTablePointer + CLng(lp) * CLng(12) + 2)
                Directs.Add Str(lp)
                SetStuff Directs(Str(lp)), inshead, dirhead, gbhead
                If Directs(Str(lp)).outputtype = dotDirect Or Directs(Str(lp)).outputtype = dotWave Then GetSampleWithMulti Directs(Str(lp)), dirhead, smphead, False
              End If
              
            Else 'patch already exists
              inshead = ReadInstrumentHead(1, mvarInstrumentTablePointer + CLng(lp) * CLng(12))
              If (inshead.bChannel And &H80) = &H80 Then
                drmhead = ReadDrumKitHead(1)
                inshead = ReadInstrumentHead(1, GBAROMPointerToOffset(drmhead.pDirectTable + CLng(pn) * CLng(12)))
                dirhead = ReadDirectHead(1)
                gbhead = ReadNoiseHead(1, GBAROMPointerToOffset(drmhead.pDirectTable + CLng(pn) * CLng(12)) + 2)
                If DirectExists(DrumKits(Str(lp)).Directs, pn) = False Then
                  DrumKits(Str(lp)).Directs.Add Str(pn)
                  SetStuff DrumKits(Str(lp)).Directs(Str(pn)), inshead, dirhead, gbhead
                  If DrumKits(Str(lp)).Directs(Str(pn)).outputtype = dotDirect Or DrumKits(Str(lp)).Directs(Str(pn)).outputtype = dotWave Then GetSampleWithMulti DrumKits(Str(lp)).Directs(Str(pn)), dirhead, smphead, False
                End If
              
              ElseIf (inshead.bChannel And &H40) = &H40 Then 'multi
                mulhead = ReadMultiHead(1)
                If KeyMapExists(Instruments(Str(lp)).KeyMaps, pn) = False Then Instruments(Str(lp)).KeyMaps.Add ReadByte(1, GBAROMPointerToOffset(mulhead.pKeyMap) + pn), Str(pn)
                cdr = Instruments(Str(lp)).KeyMaps(Str(pn)).AssignDirect
                inshead = ReadInstrumentHead(1, GBAROMPointerToOffset(mulhead.pDirectTable + CLng(cdr) * CLng(12)))
                dirhead = ReadDirectHead(1)
                gbhead = ReadNoiseHead(1, GBAROMPointerToOffset(mulhead.pDirectTable + CLng(cdr) * CLng(12)) + 2)
                If DirectExists(Instruments(Str(lp)).Directs, cdr) = False Then
                  Instruments(Str(lp)).Directs.Add Str(cdr)
                  SetStuff Instruments(Str(lp)).Directs(Str(cdr)), inshead, dirhead, gbhead
                  If Instruments(Str(lp)).Directs(Str(cdr)).outputtype = dotDirect Or Instruments(Str(lp)).Directs(Str(cdr)).outputtype = dotWave Then GetSampleWithMulti Instruments(Str(lp)).Directs(Str(cdr)), dirhead, smphead, False
                End If
              End If
            End If
              
            On Error GoTo 0
            
          Wend
        End If
      ElseIf c >= &H80 And c <= &HB0 Then
        SappyChannels(i).EventQueue.Add cticks, c, 0, 0, 0
        cticks = cticks + SLen2Ticks(c - &H80)
        pc = pc + 1
      End If
    Loop Until c = &HB1 Or c = &HB2
    
    SappyChannels(i).EventQueue.Add cticks, c, 0, 0, 0
  Next i
  
  FSOUND_Init 44100, 64, 0
  FSOUND_SetSFXMasterVolume mvarGlobalVolume
  MidiOpen
  If mvarOutputType = sotMIDI Then GoTo SkipThatWholeInstrumentGarbish
  
  Trace "==================="
  Trace "Filling sample pool"
  Trace "==================="
  Dim quark As Integer
  For Each Item In SamplePool
    RaiseEvent Loading(1)
'    OpenFile 2, Item.Key & ".raw"
'    If Item.GBWave = True Then
'      WriteString 2, Item.SampleData
'    Else
'      For i = 0 To Item.Size
'        WriteByte 2, ReadByte(1, Item.SampleData + i)
'      Next i
'    End If
'    CloseFile 2
'    Item.SampleData = ""
'    If Item.GBWave = True Then
'      Item.FModSample = FSOUND_Sample_Load(FSOUND_FREE, Item.Key & ".raw", FSOUND_8BITS + FSOUND_LOADRAW + FSOUND_LOOP_NORMAL + FSOUND_MONO + FSOUND_UNSIGNED, 0, 0)
'      Call FSOUND_Sample_SetLoopPoints(Item.FModSample, 0, 31)
'    Else
'      Item.FModSample = FSOUND_Sample_Load(FSOUND_FREE, Item.Key & ".raw", FSOUND_8BITS + FSOUND_LOADRAW + IIf(Item.LoopEnable = True, FSOUND_LOOP_NORMAL, 0) + FSOUND_MONO + FSOUND_SIGNED, 0, 0)
'      Call FSOUND_Sample_SetLoopPoints(Item.FModSample, Item.loopstart, Item.Size - 1)
'    End If
'    DeleteFile Item.Key & ".raw"
    quark = quark + 1
    'On Error Resume Next
    Trace "#" & quark & " - " & Item.GBWave & " - " & Item.SampleData
    If Item.GBWave = True Then
      If Val(Item.SampleData) = 0 Then
        OpenFile 2, "temp.raw"
        WriteString 2, Item.SampleData
        CloseFile 2
        Item.FModSample = FSOUND_Sample_Load(FSOUND_FREE, "temp.raw", FSOUND_8BITS + FSOUND_LOADRAW + FSOUND_LOOP_NORMAL + FSOUND_MONO + FSOUND_UNSIGNED, 0, 0)
        Call FSOUND_Sample_SetLoopPoints(Item.FModSample, 0, 31)
        DeleteFile "temp.raw"
      Else
        Item.FModSample = FSOUND_Sample_Load(FSOUND_FREE, Filename, FSOUND_8BITS + FSOUND_LOADRAW + FSOUND_LOOP_NORMAL + FSOUND_MONO + FSOUND_UNSIGNED, Item.SampleData, Item.Size)
        Call FSOUND_Sample_SetLoopPoints(Item.FModSample, 0, 31)
      End If
    Else
      If Val(Item.SampleData) = 0 Then
        On Error Resume Next
        OpenFile 2, "temp.raw"
        'For i = 0 To Item.Size
        '  WriteByte 2, ReadByte(1, Item.SampleData + i)
        'Next i
        WriteString 2, Item.SampleData
        CloseFile 2
        Item.FModSample = FSOUND_Sample_Load(FSOUND_FREE, "temp.raw", FSOUND_8BITS + FSOUND_LOADRAW + IIf(Item.LoopEnable = True, FSOUND_LOOP_NORMAL, 0) + FSOUND_MONO + FSOUND_SIGNED, 0, 0)
        Call FSOUND_Sample_SetLoopPoints(Item.FModSample, Item.loopstart, Item.Size - 1)
        DeleteFile "temp.raw"
        On Error GoTo 0
      Else
        Item.FModSample = FSOUND_Sample_Load(FSOUND_FREE, Filename, FSOUND_8BITS + FSOUND_LOADRAW + IIf(Item.LoopEnable = True, FSOUND_LOOP_NORMAL, 0) + FSOUND_MONO + FSOUND_SIGNED, Item.SampleData, Item.Size)
        Call FSOUND_Sample_SetLoopPoints(Item.FModSample, Item.loopstart, Item.Size - 1)
      End If
    End If
    'MsgBox "Item.Key: 0x" & Hex(Item.Key) & vbCrLf & _
           "Item.SampleData: 0x" & Hex(Item.SampleData) & vbCrLf & _
           "Item.Size: 0x" & Hex(Item.Size) & vbCrLf & vbCrLf & _
           "Item.FModSample: 0x" & Hex(Item.FModSample)
    On Error GoTo 0
  Next

  For i = 0 To 9
    SamplePool.Add "noise0" & i
    With SamplePool("noise0" & i)
      Randomize Timer
      .SampleData = NoiseWaves(0, i)
      .Frequency = 7040
      .Size = 16384
      OpenFile 2, "noise0" & i & ".raw"
      WriteString 2, .SampleData
      CloseFile 2
      .SampleData = ""
      .FModSample = FSOUND_Sample_Load(FSOUND_FREE, "noise0" & i & ".raw", FSOUND_8BITS + FSOUND_LOADRAW + FSOUND_LOOP_NORMAL + FSOUND_MONO + FSOUND_UNSIGNED, 0, 0)
      Call FSOUND_Sample_SetLoopPoints(.FModSample, 0, 16383)
      DeleteFile "noise0" & i & ".raw"
    End With
    SamplePool.Add "noise1" & i
    
    With SamplePool("noise1" & i)
      Randomize Timer
      .SampleData = NoiseWaves(1, i)
      .Frequency = 7040
      .Size = 256
      OpenFile 2, "noise1" & i & ".raw"
      WriteString 2, .SampleData
      CloseFile 2
      .SampleData = ""
      .FModSample = FSOUND_Sample_Load(FSOUND_FREE, "noise1" & i & ".raw", FSOUND_8BITS + FSOUND_LOADRAW + FSOUND_LOOP_NORMAL + FSOUND_MONO + FSOUND_UNSIGNED, 0, 0)
      Call FSOUND_Sample_SetLoopPoints(.FModSample, 0, 255)
      DeleteFile "noise1" & i & ".raw"
    End With
  Next i
  
  For mx2 = 0 To 3
    SamplePool.Add "square" & mx2
    With SamplePool("square" & mx2)
      Select Case mx2
        Case 0
          .SampleData = String(4, Chr(Int(&H80 + (&H7F * GBSquareMulti)))) & String(28, Chr(Int(&H80 - (&H7F * GBSquareMulti))))
        Case 1
          .SampleData = String(8, Chr(Int(&H80 + (&H7F * GBSquareMulti)))) & String(24, Chr(Int(&H80 - (&H7F * GBSquareMulti))))
        Case 2
          .SampleData = String(16, Chr(Int(&H80 + (&H7F * GBSquareMulti)))) & String(16, Chr(Int(&H80 - (&H7F * GBSquareMulti))))
        Case 3
          .SampleData = String(24, Chr(Int(&H80 + (&H7F * GBSquareMulti)))) & String(8, Chr(Int(&H80 - (&H7F * GBSquareMulti))))
      End Select
      .Frequency = 7040
      .Size = 32
      OpenFile 2, "square" & mx2 & ".raw"
      WriteString 2, .SampleData
      CloseFile 2
      .SampleData = ""
      .FModSample = FSOUND_Sample_Load(FSOUND_FREE, "square" & mx2 & ".raw", FSOUND_8BITS + FSOUND_LOADRAW + FSOUND_LOOP_NORMAL + FSOUND_MONO + FSOUND_UNSIGNED, 0, 0)
      Call FSOUND_Sample_SetLoopPoints(.FModSample, 0, 31)
      DeleteFile "square" & mx2 & ".raw"
    End With
  Next mx2
  mvarGB1Chan = 255
  mvarGB2Chan = 255
  mvarGB3Chan = 255
  mvarGB4Chan = 255
  
SkipThatWholeInstrumentGarbish:
  RaiseEvent Loading(2)
  
  Set EventProcessor = New CTimerMM
  mvarTempo = 120
  lasttempo = -1
  incr = 0
  EventProcessor_Timer 0
  
  CloseFile 1
  
  TotalTicks = 0
  TotalMSecs = 0
  Beats = 0
  If WantToRecord Then
    Recording = True
    midifile = 42
    Dim H As String * 4
    If Dir(RecordTo) <> "" Then Kill RecordTo
    Open RecordTo For Binary As midifile
    H = "MThd"
    Put #midifile, , H
    Put #midifile, , FlipLong(6)
    Put #midifile, , FlipInt(0)
    Put #midifile, , FlipInt(1) 'FlipInt(SappyChannels.count)
    Put #midifile, , FlipInt(24) '48
    H = "MTrk"
    Put #midifile, , H
    Put #midifile, , CLng(0)
    Dim msg As String
    msg = frmSappy.lblSongName
    msg = msg & " --- dumped by " & App.Title & " version " & App.Major & "." & App.Minor
    
    msg = "Sonic Advance 2 - "
    
    If Len(msg) > 120 Then msg = left(msg, 120)
    BufferEvent Chr$(&HFF) & Chr$(2) & Chr$(Len(msg)) & msg, 0
  End If
  
  Exit Sub
hell:
  If Err.Number = 6 Then
    MsgBox "Invalid song number. Probably went out of the table."
    StopSong
    Exit Sub
  End If
  MsgBox "runtime error: " & Err.Number & " / " & Err.Description, vbCritical
  StopSong
End Sub

'Added by Kawa in DLL conversion
Private Sub Class_Initialize()
  Dim ts As Long, te As Long, sz As Long
  Trace Now & vbTab & "- Yo, this be clsSappyDecoder, Class_Initialize()"
  Randomize Timer
  sz = GetSettingI("Noise Length")
  If sz = 0 Then sz = 2047
  ts = GetTickCount
  For i = 0 To 9
    Trace Now & vbTab & "- Creating NoiseWaves(0," & i & ")"
    For j = 0 To sz  '2047 '16383
      NoiseWaves(0, i) = NoiseWaves(0, i) & Chr(Int(Rnd * 153)) '(255 * 0.6)))
    Next j
    Trace Now & vbTab & "- Creating NoiseWaves(1," & i & ")"
    For j = 0 To 255
      NoiseWaves(1, i) = NoiseWaves(1, i) & Chr(Int(Rnd * 153)) '(255 * 0.6)))
    Next j
  Next i
  te = GetTickCount
  Trace Now & vbTab & "- Took " & (te - ts) & "."
  mvarGlobalVolume = 255
  Trace Now & vbTab & "- Done. Back to the studio..."
End Sub

Private Sub EventProcessor_Timer(ByVal lMilliseconds As Long)
  If ErrorChecking = True Then On Error GoTo hell
  
  Dim ep As Integer, mutethis As Boolean
  
  TotalMSecs = TotalMSecs + lMilliseconds
  If mvarTickCounter > 0 Then
    For i = 0 To 31
      With NoteArray(i)
        If .Enabled = True And .WaitTicks > 0 Then
          .WaitTicks = .WaitTicks - (mvarTickCounter - mvarLastTick)
        End If
        If .WaitTicks <= 0 And .Enabled = True And .NoteOff = False Then
          If SappyChannels(.ParentChannel).Sustain = False Then
            .NoteOff = True
          End If
        End If
      End With
    Next i
    For i = 1 To SappyChannels.count
  
      While SappyChannels(i).Enabled = False
        i = i + 1
        If i > SappyChannels.count Then Exit For
      Wend

      With SappyChannels(i)
        'mutethis = False
        For ep = 0 To EarPiercerCnt
          If EarPiercers(ep) = .PatchNumber Then
            .mute = True
            '.Enabled = False
            Exit For
          End If
        Next ep
        
        If .WaitTicks > 0 Then .WaitTicks = .WaitTicks - (mvarTickCounter - mvarLastTick)
        oo = False
        OP = False
        Do While .WaitTicks <= 0
          'DoEvents
          Select Case .EventQueue(.ProgramCounter).CommandByte
            
            Case &HB1
              .Enabled = False
              Exit For
            
            Case &HB9
              .ProgramCounter = .ProgramCounter + 1
            
            Case &HBB
              mvarTempo = .EventQueue(.ProgramCounter).Param1 * 2
              RaiseEvent ChangedTempo(mvarTempo)
              If Recording Then BufferEvent Chr$(&HFF) & Chr$(&H51), Me.TotalTicks
              If Recording Then Put #midifile, , FlipLong(((60000000 / mvarTempo) And &HFFFFFF) Or &H3000000)
              .ProgramCounter = .ProgramCounter + 1
            
            Case &HBC
              .Transpose = SignedByteToInteger(.EventQueue(.ProgramCounter).Param1)
              .ProgramCounter = .ProgramCounter + 1
            
            Case &HBD
              .PatchNumber = .EventQueue(.ProgramCounter).Param1
              If DirectExists(Directs, .PatchNumber) Then
                .outputtype = Directs(Str(.PatchNumber)).outputtype
              ElseIf InstrumentExists(.PatchNumber) Then
                .outputtype = cotMultiSample
              ElseIf DrumKitExists(.PatchNumber) Then
                .outputtype = cotDrumKit
              Else
                .outputtype = cotNull
              End If
              .ProgramCounter = .ProgramCounter + 1
              SelectInstrument i, MidiPatchMap(.PatchNumber)
              BufferEvent Chr$(&HC0 + i) & Chr$(MidiPatchMap(.PatchNumber)), Me.TotalTicks
              
            Case &HBE
              'Do Set Volume
              .MainVolume = .EventQueue(.ProgramCounter).Param1
              For Each Item In .Notes
                If NoteArray(Item.NoteID).Enabled = True And NoteArray(Item.NoteID).ParentChannel = i Then
                
                  dav = CSng((CSng(NoteArray(Item.NoteID).Velocity) / CSng(&H7F)) * (CSng(.MainVolume) / CSng(&H7F)) * (CSng(Int(NoteArray(Item.NoteID).EnvPosition)) / CSng(&HFF)) * 255)
                  If mutethis Then dav = 0
                  If mvarOutputType = sotWave Then
                    FSOUND_SetVolume NoteArray(Item.NoteID).FModChannel, dav * IIf(.mute, 0, 1)
                  Else
                    'MIDISETVOL
                    SetChnVolume NoteArray(Item.NoteID).FModChannel, dav * IIf(.mute, 0, 2)
                  End If
                  On Error Resume Next
                  If Recording Then BufferEvent Chr$(&HD0 + NoteArray(Item.NoteID).FModChannel) & Chr$(dav), Me.TotalTicks
                  On Error GoTo 0
                End If
              Next Item
              .ProgramCounter = .ProgramCounter + 1
            
            Case &HBF
              'Do Set Panning
              .Panning = .EventQueue(.ProgramCounter).Param1
              For Each Item In .Notes
                If NoteArray(Item.NoteID).Enabled = True And NoteArray(Item.NoteID).ParentChannel = i Then
                  If mvarOutputType = sotWave Then
                    FSOUND_SetPan NoteArray(Item.NoteID).FModChannel, .Panning * 2
                  Else
                    'MIDISETPAN
                    SetChnPan NoteArray(Item.NoteID).FModChannel, .Panning * 2
                  End If
                End If
              Next Item
              .ProgramCounter = .ProgramCounter + 1
            
            Case &HC0
              'Do Set Pitch Bend
              .PitchBend = .EventQueue(.ProgramCounter).Param1
              .ProgramCounter = .ProgramCounter + 1
              For Each Item In .Notes
                If NoteArray(Item.NoteID).Enabled = True And NoteArray(Item.NoteID).ParentChannel = i Then
                  If mvarOutputType = sotWave Then
                    FSOUND_SetFrequency NoteArray(Item.NoteID).FModChannel, NoteArray(Item.NoteID).Frequency * (2 ^ (1 / 12)) ^ ((CSng(.PitchBend - &H40)) / CSng(&H40) * CSng(.PitchBendRange))
                  Else
                    'MIDIPITCHBEND
                    'PitchWheel NoteArray(Item.NoteID).FModChannel, NoteArray(Item.NoteID).Frequency * (2 ^ (1 / 12)) ^ ((CSng(.PitchBend - &H40)) / CSng(&H40) * CSng(.PitchBendRange))
                  End If
                End If
              Next Item
          
            Case &HC1
              'Do Set Pitch Bend Range
              .PitchBendRange = SignedByteToInteger(.EventQueue(.ProgramCounter).Param1)
              .ProgramCounter = .ProgramCounter + 1
              For Each Item In .Notes
                If NoteArray(Item.NoteID).Enabled = True And NoteArray(Item.NoteID).ParentChannel = i Then
                  If mvarOutputType = sotWave Then
                    FSOUND_SetFrequency NoteArray(Item.NoteID).FModChannel, NoteArray(Item.NoteID).Frequency * (2 ^ (1 / 12)) ^ ((CSng(.PitchBend - &H40)) / CSng(&H40) * CSng(.PitchBendRange))
                  Else
                    'MIDIPITCHBENDRANGE
                    'PitchWheel NoteArray(Item.NoteID).FModChannel, NoteArray(Item.NoteID).Frequency * (2 ^ (1 / 12)) ^ ((CSng(.PitchBend - &H40)) / CSng(&H40) * CSng(.PitchBendRange))
                  End If
                End If
              Next Item
          
            Case &HC2
              'Do Set Vibrato Depth
              .VibratoDepth = .EventQueue(.ProgramCounter).Param1
              .ProgramCounter = .ProgramCounter + 1
            
            Case &HC4
              'Do Set Vibrato Rate
              .VibratoRate = .EventQueue(.ProgramCounter).Param1
              .ProgramCounter = .ProgramCounter + 1
            
            Case &HCE
              'Do Set Sustain Off
              .Sustain = False
              For Each Item In .Notes
                If NoteArray(Item.NoteID).Enabled = True And NoteArray(Item.NoteID).NoteOff = False Then  'And NoteArray(Item.NoteID).WaitTicks < 1 Then
                  NoteArray(Item.NoteID).NoteOff = True
                End If
              Next Item
              .ProgramCounter = .ProgramCounter + 1
          
            Case &HB3
              .SubroutineCounter = .SubroutineCounter + 1
              .ReturnPointer = .ProgramCounter + 1
              .ProgramCounter = .Subroutines(.SubroutineCounter).EventQueuePointer
              .InSubroutine = True
          
            Case &HB4
              If .InSubroutine = True Then
                .ProgramCounter = .ReturnPointer
                .InSubroutine = False
              Else
                .ProgramCounter = .ProgramCounter + 1
              End If
            
            Case &HB2
              justlooped = True
              .InSubroutine = False
              .ProgramCounter = .LoopPointer
          
            Case Is >= &HCF
              ll = (SLen2Ticks(.EventQueue(.ProgramCounter).CommandByte - &HCF)) + 1
              If .EventQueue(.ProgramCounter).CommandByte = &HCF Then
                .Sustain = True
                ll = 0
              End If
              nn = .EventQueue(.ProgramCounter).Param1
              vv = .EventQueue(.ProgramCounter).Param2
              uu = .EventQueue(.ProgramCounter).Param3
              NoteQueue.Add True, 0, nn, 0, vv, i, uu, 0, 0, 0, 0, 0, ll, .PatchNumber
              .ProgramCounter = .ProgramCounter + 1
          
            Case Is <= &HB0
              If justlooped = True Then
                justlooped = False
                If i = 1 Then RaiseEvent SongLoop
                .WaitTicks = 0
              Else
                .ProgramCounter = .ProgramCounter + 1
                If .ProgramCounter > 1 Then
                  .WaitTicks = .EventQueue(.ProgramCounter).Ticks - .EventQueue(.ProgramCounter - 1).Ticks
                Else
                  .WaitTicks = .EventQueue(.ProgramCounter).Ticks
                End If
              End If
            
            Case Else
              .ProgramCounter = .ProgramCounter + 1
          
          End Select
          
          oo = True
        Loop
      
      End With
    Next i
    mmx = -1
  
    If SappyChannels.count > 0 Then
      Dim clearedchannel() As Boolean
      ReDim clearedchannel(1 To SappyChannels.count)
      RaiseEvent UpdateDisplay
      For Each Item In NoteQueue
        x = FreeNote
        If x < 32 Then
          Set NoteArray(x) = Item
          With SappyChannels(Item.ParentChannel)
            If clearedchannel(Item.ParentChannel) = False Then
              clearedchannel(Item.ParentChannel) = True
              For Each item2 In .Notes
                If NoteArray(item2.NoteID).Enabled = True And NoteArray(item2.NoteID).NoteOff = False Then
                  NoteArray(item2.NoteID).NoteOff = True
                End If
              Next item2
            End If
         
            .Notes.Add CByte(x), Str(x)
            pat = Item.PatchNumber
            nn = Item.NoteNumber
            
            If DirectExists(Directs, pat) Then
              NoteArray(x).outputtype = Directs(Str(pat)).outputtype
              NoteArray(x).EnvAttenuation = Directs(Str(pat)).EnvAttenuation
              NoteArray(x).EnvDecay = Directs(Str(pat)).EnvDecay
              NoteArray(x).EnvSustain = Directs(Str(pat)).EnvSustain
              NoteArray(x).EnvRelease = Directs(Str(pat)).EnvRelease
              If Directs(Str(pat)).outputtype = dotDirect Or Directs(Str(pat)).outputtype = dotWave Then
                das = Str(Directs(Str(pat)).SampleID)
                daf = NoteToFreq(nn + (60 - Directs(Str(pat)).DrumTuneKey), IIf(SamplePool(das).GBWave, -1, SamplePool(das).Frequency))
                If SamplePool(das).GBWave = True Then daf = daf / 2
              ElseIf Directs(Str(pat)).outputtype = dotSquare1 Or Directs(Str(pat)).outputtype = dotSquare2 Then
                das = "square" & (Directs(Str(pat)).GB1 Mod 4)
                daf = NoteToFreq(nn + (60 - Directs(Str(pat)).DrumTuneKey))
              ElseIf Directs(Str(pat)).outputtype = dotNoise Then
                das = "noise" & (Directs(Str(pat)).GB1 Mod 2) & Int(Rnd * 3)
                daf = NoteToFreq(nn + (60 - Directs(Str(pat)).DrumTuneKey))
              Else
                das = ""
              End If
            
            ElseIf InstrumentExists(pat) Then
              NoteArray(x).outputtype = Instruments(Str(pat)).Directs(Str(Instruments(Str(pat)).KeyMaps(Str(nn)).AssignDirect)).outputtype
              NoteArray(x).EnvAttenuation = Instruments(Str(pat)).Directs(Str(Instruments(Str(pat)).KeyMaps(Str(nn)).AssignDirect)).EnvAttenuation
              NoteArray(x).EnvDecay = Instruments(Str(pat)).Directs(Str(Instruments(Str(pat)).KeyMaps(Str(nn)).AssignDirect)).EnvDecay
              NoteArray(x).EnvSustain = Instruments(Str(pat)).Directs(Str(Instruments(Str(pat)).KeyMaps(Str(nn)).AssignDirect)).EnvSustain
              NoteArray(x).EnvRelease = Instruments(Str(pat)).Directs(Str(Instruments(Str(pat)).KeyMaps(Str(nn)).AssignDirect)).EnvRelease
              If Instruments(Str(pat)).Directs(Str(Instruments(Str(pat)).KeyMaps(Str(nn)).AssignDirect)).outputtype = dotDirect Or Instruments(Str(pat)).Directs(Str(Instruments(Str(pat)).KeyMaps(Str(nn)).AssignDirect)).outputtype = dotWave Then
                das = Str(Instruments(Str(pat)).Directs(Str(Instruments(Str(pat)).KeyMaps(Str(nn)).AssignDirect)).SampleID)
                If Instruments(Str(pat)).Directs(Str(Instruments(Str(pat)).KeyMaps(Str(nn)).AssignDirect)).FixedPitch = True Then
                  daf = SamplePool(das).Frequency
                Else
                  daf = NoteToFreq(nn, IIf(SamplePool(das).GBWave, -2, SamplePool(das).Frequency))
                End If
              ElseIf Instruments(Str(pat)).Directs(Str(Instruments(Str(pat)).KeyMaps(Str(nn)).AssignDirect)).outputtype = dotSquare1 Or Instruments(Str(pat)).Directs(Str(Instruments(Str(pat)).KeyMaps(Str(nn)).AssignDirect)).outputtype = dotSquare2 Then
                das = "square" & (Instruments(Str(pat)).Directs(Str(Instruments(Str(pat)).KeyMaps(Str(nn)).AssignDirect)).GB1 Mod 4)
                daf = NoteToFreq(nn)
              Else
                das = ""
              End If
            
            ElseIf DrumKitExists(pat) Then
              NoteArray(x).outputtype = DrumKits(Str(pat)).Directs(Str(nn)).outputtype
              NoteArray(x).EnvAttenuation = DrumKits(Str(pat)).Directs(Str(nn)).EnvAttenuation
              NoteArray(x).EnvDecay = DrumKits(Str(pat)).Directs(Str(nn)).EnvDecay
              NoteArray(x).EnvSustain = DrumKits(Str(pat)).Directs(Str(nn)).EnvSustain
              NoteArray(x).EnvRelease = DrumKits(Str(pat)).Directs(Str(nn)).EnvRelease
              If DrumKits(Str(pat)).Directs(Str(nn)).outputtype = dotDirect Or DrumKits(Str(pat)).Directs(Str(nn)).outputtype = dotWave Then
                das = Str(DrumKits(Str(pat)).Directs(Str(nn)).SampleID)
                If DrumKits(Str(pat)).Directs(Str(nn)).FixedPitch = True And SamplePool(das).GBWave = False Then
                  daf = SamplePool(das).Frequency
                Else
                  daf = NoteToFreq(DrumKits(Str(pat)).Directs(Str(nn)).DrumTuneKey, IIf(SamplePool(das).GBWave, -2, SamplePool(das).Frequency))
                End If
              ElseIf DrumKits(Str(pat)).Directs(Str(nn)).outputtype = dotSquare1 Or DrumKits(Str(pat)).Directs(Str(nn)).outputtype = dotSquare2 Then
                das = "square" & (DrumKits(Str(pat)).Directs(Str(nn)).GB1 Mod 4)
                daf = NoteToFreq(DrumKits(Str(pat)).Directs(Str(nn)).DrumTuneKey)
              ElseIf DrumKits(Str(pat)).Directs(Str(nn)).outputtype = dotNoise Then
                das = "noise" & (DrumKits(Str(pat)).Directs(Str(nn)).GB1 Mod 2) & Int(Rnd * 3)
                daf = NoteToFreq((DrumKits(Str(pat)).Directs(Str(nn)).DrumTuneKey))
              Else
                das = ""
              End If
            Else
              das = ""
            End If
            
            If das <> "" Then
              daf = daf * ((2 ^ (1 / 12)) ^ Me.Transpose)
              dav = CSng((CSng(Item.Velocity) / CSng(&H7F)) * (CSng(.MainVolume) / CSng(&H7F)) * 255)
              If mutethis Then dav = 0
              
              Select Case NoteArray(x).outputtype
                Case notSquare1
                  If mvarGB1Chan < 32 Then
                    With NoteArray(mvarGB1Chan)
                      If mvarOutputType = sotWave Then
                        FSOUND_StopSound .FModChannel
                      Else
                        'MIDISTOPSOUND
                        ToneOff .ParentChannel, .NoteNumber + MidiPatchTrans(.PatchNumber)
                        'PitchWheel NoteArray(Item.NoteID).FModChannel, 0
                      End If
                      If Recording Then BufferEvent Chr$(&H80 + .ParentChannel) & Chr$(.NoteNumber), Me.TotalTicks
                      .FModChannel = 0
                      On Error Resume Next
                      SappyChannels(.ParentChannel).Notes.Remove Str(mvarGB1Chan)
                      On Error GoTo 0
                      .Enabled = False
                    End With
                  End If
                  mvarGB1Chan = x
                Case notSquare2
                  If mvarGB2Chan < 32 Then
                    With NoteArray(mvarGB2Chan)
                      If mvarOutputType = sotWave Then
                        FSOUND_StopSound .FModChannel
                      Else
                        'MIDISTOPSOUND
                        ToneOff .ParentChannel, .NoteNumber + MidiPatchTrans(.PatchNumber)
                      End If
                      If Recording Then BufferEvent Chr$(&H80 + .ParentChannel) & Chr$(.NoteNumber), Me.TotalTicks
                      .FModChannel = 0
                      SappyChannels(.ParentChannel).Notes.Remove Str(mvarGB2Chan)
                      .Enabled = False
                    End With
                  End If
                  mvarGB2Chan = x
                Case notWave
                  If mvarGB3Chan < 32 Then
                    With NoteArray(mvarGB3Chan)
                      If mvarOutputType = sotWave Then
                        FSOUND_StopSound .FModChannel
                      Else
                        'MIDISTOPSOUND
                        ToneOff Item.ParentChannel, Item.NoteNumber + MidiPatchTrans(Item.PatchNumber)
                      End If
                      If Recording Then BufferEvent Chr$(&H80 + Item.ParentChannel) & Chr$(Item.NoteNumber), Me.TotalTicks
                      .FModChannel = 0
                      SappyChannels(.ParentChannel).Notes.Remove Str(mvarGB3Chan)
                      .Enabled = False
                    End With
                  End If
                  mvarGB3Chan = x
                Case notNoise
                  If mvarGB4Chan < 32 Then
                    With NoteArray(mvarGB4Chan)
                      If mvarOutputType = sotWave Then
                        FSOUND_StopSound .FModChannel
                      Else
                        'MIDISTOPSOUND
                        ToneOff .ParentChannel, .NoteNumber + MidiPatchTrans(.PatchNumber)
                      End If
                      If Recording Then BufferEvent Chr$(&H80 + .ParentChannel) & Chr$(.NoteNumber), Me.TotalTicks
                      .FModChannel = 0
                      SappyChannels(.ParentChannel).Notes.Remove Str(mvarGB4Chan)
                      .Enabled = False
                    End With
                  End If
                  mvarGB4Chan = x
              End Select
        
              If mvarOutputType = sotWave Then
                If mutethis = False Then
                  NoteArray(x).FModChannel = FSOUND_PlaySound(x + 1, SamplePool(das).FModSample)
                Else
                  x = x
                End If
              Else
                NoteArray(x).FModChannel = Item.ParentChannel
              End If
              NoteArray(x).Frequency = daf
              NoteArray(x).Notephase = npInitial
              If mvarOutputType = sotWave Then
                FSOUND_SetFrequency NoteArray(x).FModChannel, CSng(daf) * (2 ^ (1 / 12)) ^ ((CSng(.PitchBend - &H40)) / CSng(&H40) * CSng(.PitchBendRange))
                FSOUND_SetVolume NoteArray(x).FModChannel, dav * IIf(.mute, 0, 1)
                FSOUND_SetPan NoteArray(x).FModChannel, .Panning * 2
              Else
                'MIDIPLAYSOUND
                If .mute = False Then
                  'If Item.PatchNumber = 127 Then 'easy way
                  If DrumKitExists(Item.PatchNumber) Then 'better way
                    ToneOn 9, MidiDrumMap(Item.NoteNumber), Item.Velocity
                  Else
                    ToneOn Item.ParentChannel, Item.NoteNumber + MidiPatchTrans(Item.PatchNumber), Item.Velocity
                  End If
                End If
              End If
              If Recording Then
                If DrumKitExists(Item.PatchNumber) Then 'better way
                  BufferEvent Chr$(&H99) & Chr$(MidiDrumMap(Item.NoteNumber)) & Chr$(Item.Velocity), Me.TotalTicks
                Else
                  BufferEvent Chr$(&H90 + Item.ParentChannel) & Chr$(Item.NoteNumber + MidiPatchTrans(Item.PatchNumber)) & Chr$(Item.Velocity), Me.TotalTicks
                End If
              End If
              RaiseEvent PlayedANote(Item.ParentChannel, Item.NoteNumber, Item.Velocity)
            End If
          End With
        End If
      Next Item
    End If
    NoteQueue.Clear

    If mvarNoteFrameCounter > 0 Then
      For i = 0 To 31
        If NoteArray(i).Enabled = True Then
          With NoteArray(i)
            If .outputtype = notDirect Then
              If .NoteOff = True And .Notephase < npRelease Then
                .EnvStep = 0
                .Notephase = npRelease
              End If
              If .EnvStep = 0 Or (.EnvPosition = .EnvDestination) Or (.EnvStep = 0 And (.EnvPosition <= .EnvDestination)) Or (.EnvStep >= 0 And .EnvPosition >= .EnvDestination) Then
                Select Case .Notephase
                  Case npInitial
                    .Notephase = npAttack
                    .EnvPosition = 0
                    .EnvDestination = 255
                    .EnvStep = .EnvAttenuation
                  Case npAttack
                    .Notephase = npDecay
                    .EnvDestination = .EnvSustain
                    .EnvStep = (.EnvDecay - &H100) / 2
                  Case npDecay
                    .Notephase = npSustain
                    .EnvStep = 0
                  Case npSustain
                    .Notephase = npSustain
                    .EnvStep = 0
                  Case npRelease
                    .Notephase = npNoteOff
                    .EnvDestination = 0
                    .EnvStep = (.EnvRelease - &H100)
                  Case npNoteOff
                    If mvarOutputType = sotWave Then
                      FSOUND_StopSound .FModChannel
                    Else
                      'MIDISTOPSOUND
                      ToneOff .ParentChannel, .NoteNumber + MidiPatchTrans(.PatchNumber)
                      'Watch this: enabling this makes the file unreadable
                      'BufferEvent Chr$(&H80 + .ParentChannel) & Chr$(.NoteNumber), Me.TotalTicks, .ParentChannel
                    End If
                    If Recording Then BufferEvent Chr$(&H80 + .ParentChannel) & Chr$(.NoteNumber) & Chr$(0), Me.TotalTicks
                    .FModChannel = 0
                    SappyChannels(.ParentChannel).Notes.Remove Str(i)
                    .Enabled = False
                End Select
              End If
              ' .EnvStep = .EnvStep * 1
              nex = .EnvPosition + .EnvStep
              If nex > .EnvDestination And .EnvStep > 0 Then nex = .EnvDestination
              If nex < .EnvDestination And .EnvStep < 0 Then nex = .EnvDestination
              .EnvPosition = nex
              dav = CSng((CSng(.Velocity) / CSng(&H7F)) * (CSng(SappyChannels(.ParentChannel).MainVolume) / CSng(&H7F)) * (CSng(Int(.EnvPosition)) / CSng(&HFF)) * 255)
              If mutethis Then dav = 0
              
              If mvarOutputType = sotWave Then
                FSOUND_SetVolume .FModChannel, dav * IIf(SappyChannels(.ParentChannel).mute, 0, 1)
              Else
                'MIDISETVOL
                SetChnVolume .FModChannel, dav * IIf(SappyChannels(.ParentChannel).mute, 0, 1)
              End If
              'If Recording Then BufferEvent Chr$(&HD0 + .FModChannel) & Chr$(dav), Me.TotalTicks
            
            Else
              
              'GB Envelope
              If .NoteOff = True And .Notephase < npRelease Then
                .EnvStep = 0
                .Notephase = npRelease
              End If
              If .EnvStep = 0 Or (.EnvPosition = .EnvDestination) Or (.EnvStep = 0 And (.EnvPosition <= .EnvDestination)) Or (.EnvStep >= 0 And .EnvPosition >= .EnvDestination) Then
                Select Case .Notephase
                  Case npInitial
                    .Notephase = npAttack
                    .EnvPosition = 0
                    .EnvDestination = 255
                    .EnvStep = &H100 - (.EnvAttenuation * 8)
                  Case npAttack
                    .Notephase = npDecay
                    .EnvDestination = .EnvSustain
                    .EnvStep = (-(.EnvDecay)) * 2
                  Case npDecay
                    .Notephase = npSustain
                    .EnvStep = 0
                  Case npSustain
                    .Notephase = npSustain
                    .EnvStep = 0
                  Case npRelease
                    .Notephase = npNoteOff
                    .EnvDestination = 0
                    .EnvStep = (&H8 - .EnvRelease) * 2
                  Case npNoteOff
                    Select Case .outputtype
                      Case notSquare1: mvarGB1Chan = 255
                      Case notSquare2: mvarGB2Chan = 255
                      Case notWave: mvarGB3Chan = 255
                      Case notNoise: mvarGB4Chan = 255
                    End Select
                    If mvarOutputType = sotWave Then
                      FSOUND_StopSound .FModChannel
                    Else
                      'MIDISTOPSOUND
                      ToneOff .ParentChannel, .NoteNumber + MidiPatchTrans(.PatchNumber)
                    End If
                    'Watch this...
                    If Recording Then BufferEvent Chr$(&H80 + .ParentChannel) & Chr$(.NoteNumber), Me.TotalTicks
                    .FModChannel = 0
                    SappyChannels(.ParentChannel).Notes.Remove Str(i)
                    .Enabled = False
                End Select
              End If
              ' .EnvStep = .EnvStep * 1
              nex = .EnvPosition + .EnvStep
              If nex > .EnvDestination And .EnvStep > 0 Then nex = .EnvDestination
              If nex < .EnvDestination And .EnvStep < 0 Then nex = .EnvDestination
              .EnvPosition = nex
              
              dav = CSng((CSng(.Velocity) / CSng(&H7F)) * (CSng(SappyChannels(.ParentChannel).MainVolume) / CSng(&H7F)) * (CSng(Int(.EnvPosition)) / CSng(&HFF)) * 255)
              If mutethis Then dav = 0
              If mvarOutputType = sotWave Then
                FSOUND_SetVolume .FModChannel, dav * IIf(SappyChannels(.ParentChannel).mute, 0, 1)
              Else
                'MIDISETVOL
                SetChnVolume .FModChannel, dav * IIf(SappyChannels(.ParentChannel).mute, 0, 1)
              End If
              'If Recording Then BufferEvent Chr$(&HD0 + .ParentChannel) & Chr$(dav), Me.TotalTicks

            End If
          End With
        End If
      Next i
    End If
    
    xmmm = False
    For i = 1 To SappyChannels.count
      If SappyChannels(i).Enabled Then xmmm = True
    Next i
    If xmmm = False Or mvarTempo = 0 Then
      StopSong
      RaiseEvent SongFinish
      Exit Sub
    End If
  End If
  mvarLastTick = 0
  mvarTickCounter = 0
  incr = incr + 1
  If incr >= Int(60000 / (mvarTempo * SappyPPQN)) Then
    mvarTickCounter = 1 '(8 / (60000 / (mvarTempo * SappyPPQN)))
    TotalTicks = TotalTicks + 1
    If TotalTicks Mod 48 = 0 Then
      Beats = Beats + 1
      RaiseEvent Beat(Beats)
    End If
    incr = 0
  End If
  
  mvarNoteFrameCounter = 1 '(8 / (60000 / (mvarTempo * SappyPPQN)))
  
  If mvarTempo <> lasttempo Then
    lasttempo = mvarTempo
    EventProcessor.Enabled = False
    EventProcessor.EventType = etPeriodic
    EventProcessor.Interval = 1
    EventProcessor.Resolution = 1
    EventProcessor.Enabled = True
  End If
  Exit Sub
hell:
  MsgBox "RTE " & Err.Number & " - " & Err.Description, vbCritical
  StopSong
End Sub

Private Sub NoteProcessor_Timer(ByVal lMilliseconds As Long)
  EventProcessor.Enabled = False
  EventProcessor.EventType = etPeriodic
  EventProcessor.Interval = (60000 / (mvarTempo * SappyPPQN)) '* dticks
  EventProcessor.Resolution = 1
  EventProcessor.Enabled = True
  Exit Sub
hell:
  MsgBox "runtime error: " & Err.Number & " / " & Err.Description, vbCritical
  StopSong
End Sub

Public Function DirectExists(DirectsCollection As SDirects, ByVal DirectID As Byte) As Boolean
  For Each Item In DirectsCollection
    If Val(Item.Key) = DirectID Then
      DirectExists = True
      Exit Function
    End If
  Next
End Function
Public Function KeyMapExists(KeyMapCollection As SKeyMaps, ByVal KeyMapID As Byte) As Boolean
  For Each Item In KeyMapCollection
    If Val(Item.Key) = KeyMapID Then
      KeyMapExists = True
      Exit Function
    End If
  Next
End Function
Public Function PatchExists(ByVal patch As Byte) As Boolean
  For Each Item In Directs
    If Val(Item.Key) = patch Then
      PatchExists = True
      Exit Function
    End If
  Next
  For Each Item In Instruments
    If Val(Item.Key) = patch Then
      PatchExists = True
      Exit Function
    End If
  Next
  For Each Item In DrumKits
    If Val(Item.Key) = patch Then
      PatchExists = True
      Exit Function
    End If
  Next
  PatchExists = False
End Function
Public Function InstrumentExists(ByVal patch As Byte) As Boolean
  For Each Item In Instruments
    If Val(Item.Key) = patch Then
      InstrumentExists = True
      Exit Function
    End If
  Next
  InstrumentExists = False
End Function
Public Function DrumKitExists(ByVal patch As Byte) As Boolean
  For Each Item In DrumKits
    If Val(Item.Key) = patch Then
      DrumKitExists = True
      Exit Function
    End If
  Next
  DrumKitExists = False
End Function
Public Function SampleExists(ByVal SampleID As Long) As Boolean
  For Each Item In SamplePool
    If Val(Item.Key) = SampleID Then
      SampleExists = True
      Exit Function
    End If
  Next
  SampleExists = False
End Function

Public Function FreeNote() As Byte
  For i = 0 To 31
    If NoteArray(i).Enabled = False Then
      FreeNote = i
      Exit Function
    End If
  Next i
  FreeNote = 255
End Function

Private Sub WriteVarLen(ByVal ch As Long, ByVal Value As Long)
  Dim buffer As Long
  buffer = Value And &H7F
  While Value \ 128 > 0
    Value = Value \ 128
    buffer = buffer * 256
    buffer = buffer Or ((Value And &H7F) Or &H80)
  Wend
  Do
    Put #ch, , CByte(buffer And 255) ': Pos = Pos + 1
    If (buffer And &H80) Then
      buffer = buffer \ 256
    Else
      Exit Do
    End If
  Loop
End Sub

Public Function FlipLong(ByVal Value As Long) As Long
  Dim s1 As String, s2 As String
  Dim b(4) As String
  s1 = Right("00000000" & Hex(Value), 8)
  b(0) = Mid(s1, 1, 2)
  b(1) = Mid(s1, 3, 2)
  b(2) = Mid(s1, 5, 2)
  b(3) = Mid(s1, 7, 2)
  s2 = b(3) & b(2) & b(1) & b(0)
  FlipLong = Val("&H" & s2)
'  Dim b1 As Byte, b2 As Byte, b3 As Byte, b4 As Byte
'  On Error Resume Next
'  b1 = value Mod &H100
'  value = value \ &H100
'  b2 = value Mod &H100
'  value = value \ &H100
'  b3 = value Mod &H100
'  value = value \ &H100
'  b4 = value Mod &H100
'
'  value = b1
'  value = value * &H100
'  value = value + b2
'  value = value * &H100
'  value = value + b3
'  value = value * &H100
'  value = value + b4
'
'  FlipLong = value
End Function

Public Function FlipInt(ByVal Value As Long) As Integer
  Dim b1 As Byte, b2 As Byte
  b1 = Value Mod &H100
  Value = Value \ &H100
  b2 = Value Mod &H100
  
  Value = b1
  Value = Value * &H100
  Value = Value + b2
  
  FlipInt = Value
End Function

Private Sub GetSample(D As SDirect, dirhead As SappyDirectHeader, smphead As SappySampleHeader, UseReadString As Boolean)
With D
  Debug.Print "GetSample -> 0x" & Hex(dirhead.pSampleHeader) & " (" & IIf(UseReadString, "readstring", "seek") & ")"
  .SampleID = dirhead.pSampleHeader
  sid = .SampleID
  If SampleExists(sid) = False Then
    SamplePool.Add Str(sid)
    If .outputtype = dotDirect Then
      smphead = ReadSampleHead(1, GBAROMPointerToOffset(sid))
      With SamplePool(Str(sid))
        .Size = smphead.wSize
        .Frequency = smphead.wFreq * 64
        .loopstart = smphead.wLoop
        .LoopEnable = smphead.flags > 0
        .GBWave = False
        If UseReadString Then
          .SampleData = ReadString(1, .Size)
        Else
          .SampleData = Seek(1)
        End If
      End With
    Else
      With SamplePool(Str(sid))
        .Size = 32
        .Frequency = GBWaveBaseFreq
        .loopstart = 0
        .LoopEnable = True
        .GBWave = True
        tsi = ReadString(1, 16, GBAROMPointerToOffset(sid))
        .SampleData = ""
        For ai = 0 To 31
          bi = ai Mod 2
          .SampleData = .SampleData & ChrB(Int(((IIf(Mid(tsi, (ai / 2) + 1, 1) = "", 0, Asc(Mid(tsi, (ai / 2) + 1, 1))) \ (16 ^ bi)) Mod 16) * (GBWaveMulti * 16)))
        Next ai
      End With
    End If
  End If
End With
End Sub

Private Sub GetSampleWithMulti(D As SDirect, dirhead As SappyDirectHeader, smphead As SappySampleHeader, UseReadString As Boolean)
With D
  Debug.Print "GetSample -> 0x" & Hex(dirhead.pSampleHeader) & " (" & IIf(UseReadString, "readstring", "seek") & ", multi)"
  .SampleID = dirhead.pSampleHeader
  sid = .SampleID
  If SampleExists(sid) = False Then
    SamplePool.Add Str(sid)
    If .outputtype = dotDirect Then
      smphead = ReadSampleHead(1, GBAROMPointerToOffset(sid))
      With SamplePool(Str(sid))
        .Size = smphead.wSize
        .Frequency = smphead.wFreq * CLng(64)
        .loopstart = smphead.wLoop
        .LoopEnable = smphead.flags > 0
        .GBWave = False
        If UseReadString Then
          .SampleData = ReadString(1, .Size)
        Else
          .SampleData = Seek(1)
        End If
      End With
    Else
      With SamplePool(Str(sid))
        .Size = 32
        .Frequency = GBWaveBaseFreq
        .loopstart = 0
        .LoopEnable = True
        .GBWave = True
        tsi = ReadString(1, 16, GBAROMPointerToOffset(sid))
        .SampleData = ""
        For ai = 0 To 31
          bi = ai Mod 2
          .SampleData = .SampleData & ChrB(Int(((IIf(Mid(tsi, (ai / 2) + 1, 1) = "", 0, Asc(Mid(tsi, (ai / 2) + 1, 1))) \ (16 ^ bi)) Mod 16) * (GBWaveMulti * 16)))
        Next ai
      End With
    End If
  End If
End With
End Sub

Private Sub SetStuff(foo As SDirect, inshead As SappyInstrumentHeader, dirhead As SappyDirectHeader, gbhead As SappyNoiseHeader)
With foo
  .DrumTuneKey = inshead.bDrumPitch
  .outputtype = inshead.bChannel And 7
  .EnvAttenuation = dirhead.bAttack
  .EnvDecay = dirhead.bHold
  .EnvSustain = dirhead.bSustain
  .EnvRelease = dirhead.bRelease
  .Raw0 = dirhead.b0
  .Raw1 = dirhead.b1
  .GB1 = gbhead.b2
  .GB2 = gbhead.b3
  .GB3 = gbhead.b4
  .GB4 = gbhead.b5
  .FixedPitch = IIf((inshead.bChannel And &H8) = &H8, True, False)
  .Reverse = IIf((inshead.bChannel And &H10) = &H10, True, False)
End With
End Sub
