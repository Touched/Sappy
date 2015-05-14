Attribute VB_Name = "SapPlayer"
Public NoiseWaves(0 To 1, 0 To 9) As String
Public Details As Boolean
Public Type SappyMasterTableEntry
 pSong As Long
 wPriority1 As Integer
 wPriority2 As Integer
End Type
Public Type SappySongHeader
 wTracks As Byte 'Integer
 wBlocks As Byte
 'w1 As Integer
 wPriority As Byte
 wReverb As Byte
 pInstrumentBank As Long
End Type
Public Type SappyInstrumentHeader
 bChannel As Byte
 bDrumPitch As Byte
End Type
Public Type SappyDirectHeader
 b0 As Byte
 b1 As Byte
 pSampleHeader As Long
 bAttack As Byte
 bHold As Byte
 bSustain As Byte
 bRelease As Byte
End Type
Public Type SappySquare1Header
 bRaw1 As Byte
 bRaw2 As Byte
 bDutyCycle As Byte
 b3 As Byte
 b4 As Byte
 b5 As Byte
 bAttack As Byte
 bDecay As Byte
 bSustain As Byte
 bRelease As Byte
End Type
Public Type SappySquare2Header
 b0 As Byte
 b1 As Byte
 bDutyCycle As Byte
 b3 As Byte
 b4 As Byte
 b5 As Byte
 bAttack As Byte
 bDecay As Byte
 bSustain As Byte
 bRelease As Byte
End Type
Public Type SappyWaveHeader
 b0 As Byte
 b1 As Byte
 pSample As Long
 bAttack As Byte
 bDecay As Byte
 bSustain As Byte
 bRelease As Byte
End Type
Public Type SappyNoiseHeader
 b0 As Byte
 b1 As Byte
 b2 As Byte
 b3 As Byte
 b4 As Byte
 b5 As Byte
 bAttack As Byte
 bDecay As Byte
 bSustain As Byte
 bRelease As Byte
End Type
Public Type SappyInvalidHeader
 b0 As Byte
 b1 As Byte
 b2 As Byte
 b3 As Byte
 b4 As Byte
 b5 As Byte
 b6 As Byte
 b7 As Byte
 b8 As Byte
 b9 As Byte
End Type
Public Type SappyDrumKitHeader
 b0 As Byte
 b1 As Byte
 pDirectTable As Long
 b6 As Byte
 b7 As Byte
 b8 As Byte
 b9 As Byte
End Type
Public Type SappyMultiHeader
 b0 As Byte
 b1 As Byte
 pDirectTable As Long
 pKeyMap As Long
End Type
Public Type SappySampleHeader
 flags As Long
 b4 As Byte
 FineTune As Byte
 wFreq As Integer
 wLoop As Long
 wSize As Long
End Type


'Channel Byte
'
'Special Instrument Bits (Override all others)
'6 - Multi-sample Instrument
'7 - Drum Kit
'
'Bits 0-2 assign a channel:
'0 - Direct
'1 - Square 1
'2 - Square 2
'3 - Wave
'4 - Noise
'5-7 - None
'
'Direct Channel Bits:
'3 - Fixed Pitch (Plays Sample at Middle C frequency)
'4 - Reverse (Reverses Sample)
'5 - ??


Public Function ReadSongHead(ByVal filenumber As Integer, Optional ByVal offset As Long = -1) As SappySongHeader
 ReadOffset filenumber, offset
 Get #filenumber, ReadOffset(filenumber) + 1, ReadSongHead
 ReadOffset filenumber, Seek(filenumber) - 1
End Function
Public Function ReadInstrumentHead(ByVal filenumber As Integer, Optional ByVal offset As Long = -1) As SappyInstrumentHeader
 ReadOffset filenumber, offset
 Get #filenumber, ReadOffset(filenumber) + 1, ReadInstrumentHead
 ReadOffset filenumber, Seek(filenumber) - 1
End Function
Public Function ReadDirectHead(ByVal filenumber As Integer, Optional ByVal offset As Long = -1) As SappyDirectHeader
 ReadOffset filenumber, offset
 Get #filenumber, ReadOffset(filenumber) + 1, ReadDirectHead
 ReadOffset filenumber, Seek(filenumber) - 1
End Function
Public Function ReadDrumKitHead(ByVal filenumber As Integer, Optional ByVal offset As Long = -1) As SappyDrumKitHeader
 ReadOffset filenumber, offset
 Get #filenumber, ReadOffset(filenumber) + 1, ReadDrumKitHead
 ReadOffset filenumber, Seek(filenumber) - 1
End Function
Public Function ReadMultiHead(ByVal filenumber As Integer, Optional ByVal offset As Long = -1) As SappyMultiHeader
 ReadOffset filenumber, offset
 Get #filenumber, ReadOffset(filenumber) + 1, ReadMultiHead
 ReadOffset filenumber, Seek(filenumber) - 1
End Function
Public Function ReadSquare1Head(ByVal filenumber As Integer, Optional ByVal offset As Long = -1) As SappySquare1Header
 ReadOffset filenumber, offset
 Get #filenumber, ReadOffset(filenumber) + 1, ReadSquare1Head
 ReadOffset filenumber, Seek(filenumber) - 1
End Function
Public Function ReadSquare2Head(ByVal filenumber As Integer, Optional ByVal offset As Long = -1) As SappySquare1Header
 ReadOffset filenumber, offset
 Get #filenumber, ReadOffset(filenumber) + 1, ReadSquare2Head
 ReadOffset filenumber, Seek(filenumber) - 1
End Function
Public Function ReadWaveHead(ByVal filenumber As Integer, Optional ByVal offset As Long = -1) As SappyWaveHeader
 ReadOffset filenumber, offset
 Get #filenumber, ReadOffset(filenumber) + 1, ReadWaveHead
 ReadOffset filenumber, Seek(filenumber) - 1
End Function
Public Function ReadNoiseHead(ByVal filenumber As Integer, Optional ByVal offset As Long = -1) As SappyNoiseHeader
 ReadOffset filenumber, offset
 Get #filenumber, ReadOffset(filenumber) + 1, ReadNoiseHead
 ReadOffset filenumber, Seek(filenumber) - 1
End Function
Public Function ReadInvalidHead(ByVal filenumber As Integer, Optional ByVal offset As Long = -1) As SappyInvalidHeader
 ReadOffset filenumber, offset
 Get #filenumber, ReadOffset(filenumber) + 1, ReadInvalidHead
 ReadOffset filenumber, Seek(filenumber) - 1
End Function
Public Function ReadSampleHead(ByVal filenumber As Integer, Optional ByVal offset As Long = -1) As SappySampleHeader
 ReadOffset filenumber, offset
 Get #filenumber, ReadOffset(filenumber) + 1, ReadSampleHead
 ReadOffset filenumber, Seek(filenumber) - 1
End Function

Public Function SignedByteToInteger(ByVal SignedByte As Byte) As Long
 SignedByteToInteger = IIf(SignedByte > &H7F, SignedByte - &H100, SignedByte)
End Function

Public Function NoteToName(ByVal MIDINote As Byte) As String
X = MIDINote Mod 12
o = MIDINote \ 12
Select Case X
 Case 0: NoteToName = "C"
 Case 1: NoteToName = "C#"
 Case 2: NoteToName = "D"
 Case 3: NoteToName = "D#"
 Case 4: NoteToName = "E"
 Case 5: NoteToName = "F"
 Case 6: NoteToName = "F#"
 Case 7: NoteToName = "G"
 Case 8: NoteToName = "G#"
 Case 9: NoteToName = "A"
 Case 10: NoteToName = "A#"
 Case 11: NoteToName = "B"
End Select
NoteToName = NoteToName & o
End Function
Public Function NoteToFreq(ByVal MIDINote As Long, Optional ByVal MidCFreq As Long = -1) As Long
magic = 2 ^ (1 / 12)
X = MIDINote - &H3C
If MidCFreq = -1 Then
a = 7040
c = a * (magic ^ 3)
ElseIf MidCFreq = -2 Then
a = 7040 / 2
c = a * (magic ^ 3)

Else
c = MidCFreq
End If
NoteToFreq = c * (magic ^ X)
End Function
Public Function SLen2Ticks(ByVal ShortLen As Byte) As Long
Select Case ShortLen
 Case &H0: SLen2Ticks = &H0
Case &H1: SLen2Ticks = &H1
Case &H2: SLen2Ticks = &H2
Case &H3: SLen2Ticks = &H3
Case &H4: SLen2Ticks = &H4
Case &H5: SLen2Ticks = &H5
Case &H6: SLen2Ticks = &H6
Case &H7: SLen2Ticks = &H7
Case &H8: SLen2Ticks = &H8
Case &H9: SLen2Ticks = &H9
Case &HA: SLen2Ticks = &HA
Case &HB: SLen2Ticks = &HB
Case &HC: SLen2Ticks = &HC
Case &HD: SLen2Ticks = &HD
Case &HE: SLen2Ticks = &HE
Case &HF: SLen2Ticks = &HF
Case &H10: SLen2Ticks = &H10
Case &H11: SLen2Ticks = &H11
Case &H12: SLen2Ticks = &H12
Case &H13: SLen2Ticks = &H13
Case &H14: SLen2Ticks = &H14
Case &H15: SLen2Ticks = &H15
Case &H16: SLen2Ticks = &H16
Case &H17: SLen2Ticks = &H17
Case &H18: SLen2Ticks = &H18
Case &H19: SLen2Ticks = &H1C
Case &H1A: SLen2Ticks = &H1E
Case &H1B: SLen2Ticks = &H20
Case &H1C: SLen2Ticks = &H24
Case &H1D: SLen2Ticks = &H28
Case &H1E: SLen2Ticks = &H2A
Case &H1F: SLen2Ticks = &H2C
Case &H20: SLen2Ticks = &H30
Case &H21: SLen2Ticks = &H34
Case &H22: SLen2Ticks = &H36
Case &H23: SLen2Ticks = &H38
Case &H24: SLen2Ticks = &H3C
Case &H25: SLen2Ticks = &H40
Case &H26: SLen2Ticks = &H42
Case &H27: SLen2Ticks = &H44
Case &H28: SLen2Ticks = &H48
Case &H29: SLen2Ticks = &H4C
Case &H2A: SLen2Ticks = &H4E
Case &H2B: SLen2Ticks = &H50
Case &H2C: SLen2Ticks = &H54
Case &H2D: SLen2Ticks = &H58
Case &H2E: SLen2Ticks = &H5A
Case &H2F: SLen2Ticks = &H5C
Case &H30: SLen2Ticks = &H60
End Select
End Function

