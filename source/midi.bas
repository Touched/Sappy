Attribute VB_Name = "MidiLib"
Option Explicit
DefLng A-Z

Public Declare Function midiOutOpen Lib "winmm.dll" (lphMidiOut As Long, ByVal uDeviceID As Long, ByVal dwCallback As Long, ByVal dwInstance As Long, ByVal dwFlags As Long) As Long
Public Declare Function midiOutClose Lib "winmm.dll" (ByVal hMidiOut As Long) As Long
Public Declare Function midiOutShortMsg Lib "winmm.dll" (ByVal hMidiOut As Long, ByVal dwMsg As Long) As Long


'#define NoteOnCmd       0x90
'#define NoteOffCmd      0x80
'#define PgmChngCmd      0xC0
'#define ControlCmd      0xB0
'#define PolyPressCmd    0xA0
'#define ChanPressCmd    0xD0
'#define PchWheelCmd     0xE0
'#define SysExCmd        0xF0

Private mdh As Long
Private midiOpened As Boolean

Public WantedMidiDevice As Long

Public Sub MidiOpen()
  If midiOutOpen(mdh, WantedMidiDevice, 0, 0, 0) Then
    'Trace "Opened MIDI port"
    On Error Resume Next
    Open App.Path + "\pmidi.tmp" For Input As #4
    If Err.Number = 0 Then
      Dim i As Long
      Dim S As String
      Line Input #4, S
      Input #4, i
      midiOutClose i
      Close #4
    End If
  End If
  'allows for closing midi after a crash
  Open App.Path + "\pmidi.tmp" For Output As #4
  Print #4, "Previous midi handle: (used in case it crashed last time)"
  Print #4, mdh
  Close #4
  midiOpened = True
End Sub

Public Sub MidiClose()
  If midiOpened Then
    'Trace "Closing MIDI"
    midiOutClose mdh
    midiOpened = False
  End If
End Sub

Public Sub SelectInstrument(ByVal channel As Long, ByVal patch As Long)
  If midiOpened Then
    midiOutShortMsg mdh, &HC0 Or patch * 256 Or channel
    'Trace "Set Patch for " & channel & " to " & patch
  End If
End Sub

Public Sub ToneOn(ByVal channel As Long, ByVal tone As Long, ByVal volume As Long)
  If midiOpened Then
    If tone < 0 Then tone = 0
    If tone > 127 Then tone = 127
    midiOutShortMsg mdh, &H90 Or tone * 256 Or channel Or volume * 65536
    'Trace "Tone on: " & tone & " on " & channel & ", vol " & volume
  End If
End Sub

Public Sub ToneOff(ByVal channel As Long, ByVal tone As Long)
  If midiOpened Then
    If tone < 0 Then tone = 0
    If tone > 127 Then tone = 127
    midiOutShortMsg mdh, &H80 Or tone * 256 Or channel
    'Trace "Tone off: " & tone & " on " & channel
  End If
End Sub

Public Sub SetChnVolume(ByVal channel As Long, ByVal volume As Long)
  If midiOpened Then
    midiOutShortMsg mdh, &HD0 Or volume * 256 Or channel
    'Trace "volume for " & channel & " to " & volume
  End If
End Sub

Public Sub SetChnPan(ByVal channel As Long, ByVal pan As Long)
  If midiOpened Then
    midiOutShortMsg mdh, &HB0 Or &HA * 256 Or channel Or pan * 65536
    'midiOutShortMsg mdh, &HB0 Or pan * 256 Or channel Or &HA * 65536
    'Trace "pan for " & channel & " to " & pan
  End If
End Sub

Public Sub PitchWheel(ByVal channel As Long, ByVal pit)
  If midiOpened Then
    midiOutShortMsg mdh, &HE0 Or pit * 256 Or channel
    'Trace "Tone on: " & tone & " on " & channel & ", vol " & volume
  End If
End Sub

