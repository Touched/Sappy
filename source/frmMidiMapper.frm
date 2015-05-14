VERSION 5.00
Begin VB.Form frmMidiMapper 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "[5000] MIDI Mapper"
   ClientHeight    =   3855
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6735
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmMidiMapper.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   257
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   449
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin Sappy2k6.SkinButton Command4 
      Height          =   375
      Left            =   5400
      TabIndex        =   17
      Top             =   2040
      Width           =   1215
      _ExtentX        =   0
      _ExtentY        =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "[5008] Reset"
   End
   Begin VB.OptionButton Option1 
      Caption         =   "[5002] Drums"
      Height          =   375
      Index           =   1
      Left            =   1440
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   0
      Width           =   1455
   End
   Begin VB.OptionButton Option1 
      Caption         =   "[5001] Insts"
      Height          =   375
      Index           =   0
      Left            =   0
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   0
      Value           =   -1  'True
      Width           =   1455
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   5760
      Top             =   2760
   End
   Begin Sappy2k6.SkinButton Command3 
      Height          =   375
      Left            =   5400
      TabIndex        =   15
      Top             =   960
      Width           =   1215
      _ExtentX        =   0
      _ExtentY        =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "[5] Cancel"
   End
   Begin Sappy2k6.SkinButton Command2 
      Height          =   375
      Left            =   5400
      TabIndex        =   14
      Top             =   480
      Width           =   1215
      _ExtentX        =   0
      _ExtentY        =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "[4] OK"
   End
   Begin Sappy2k6.SkinButton Command1 
      Height          =   375
      Left            =   5400
      TabIndex        =   16
      Top             =   1560
      Width           =   1215
      _ExtentX        =   0
      _ExtentY        =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "[5007] Listen"
   End
   Begin VB.PictureBox Picture1 
      Height          =   3255
      Index           =   1
      Left            =   120
      ScaleHeight     =   3195
      ScaleWidth      =   5115
      TabIndex        =   9
      Top             =   480
      Width           =   5175
      Begin VB.ListBox lstDrums 
         Height          =   2535
         IntegralHeight  =   0   'False
         Left            =   0
         TabIndex        =   11
         Top             =   240
         Width           =   2535
      End
      Begin VB.ListBox lstDrumR 
         Height          =   2535
         IntegralHeight  =   0   'False
         Left            =   2640
         TabIndex        =   13
         Top             =   240
         Width           =   2535
      End
      Begin VB.Label Label5 
         Caption         =   "[5003] Remap to"
         Height          =   255
         Left            =   2640
         TabIndex        =   12
         Top             =   0
         Width           =   2535
      End
      Begin VB.Label Label4 
         Caption         =   "[5005] Drum key"
         Height          =   255
         Left            =   0
         TabIndex        =   10
         Top             =   0
         Width           =   2535
      End
   End
   Begin VB.PictureBox Picture1 
      Height          =   3255
      Index           =   0
      Left            =   120
      ScaleHeight     =   213
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   341
      TabIndex        =   2
      Top             =   480
      Width           =   5175
      Begin VB.TextBox txtTranspose 
         Height          =   285
         Left            =   1920
         TabIndex        =   8
         Text            =   "0"
         Top             =   2880
         Width           =   615
      End
      Begin VB.ListBox lstInsts 
         Height          =   2535
         IntegralHeight  =   0   'False
         Left            =   0
         TabIndex        =   4
         Top             =   240
         Width           =   2535
      End
      Begin VB.ListBox lstRemapTo 
         Height          =   2535
         IntegralHeight  =   0   'False
         Left            =   2640
         TabIndex        =   6
         Top             =   240
         Width           =   2535
      End
      Begin VB.Label Label3 
         Caption         =   "[5006] Transpose"
         Height          =   255
         Left            =   0
         TabIndex        =   7
         Top             =   2880
         Width           =   1815
      End
      Begin VB.Label Label1 
         Caption         =   "[5004] Instrument"
         Height          =   255
         Left            =   0
         TabIndex        =   3
         Top             =   0
         Width           =   2535
      End
      Begin VB.Label Label2 
         Caption         =   "[5003] Remap to"
         Height          =   255
         Left            =   2640
         TabIndex        =   5
         Top             =   0
         Width           =   2535
      End
   End
End
Attribute VB_Name = "frmMidiMapper"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' ______________
'|  SAPPY 2006  |
'|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|
'| Interface code © 2006 by Kyoufu Kawa               |
'| Player code © 200X by DJ ßouché                    |
'| In-program graphics by Kyoufu Kawa                 |
'| Thanks to SomeGuy, Majin Bluedragon and SlimeSmile |
'|                                                    |
'| This code is NOT in the Public Domain or whatever. |
'| At least until Kyoufu Kawa releases it in the PD   |
'| himself.  Until then, you're not supposed to even  |
'| HAVE this code unless given to you by Kawa or any  |
'| other Helmeted Rodent member.                      |
'|____________________________________________________|
' _______________
'|  MIDI Mapper  |
'|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|
'| Code 100% by Kyoufu Kawa.                          |
'| Last update: July 21st, 2006                       |
'|____________________________________________________|
'
'###########################################################################################

Option Explicit

Private MidiMap(0 To 127) As Integer
Private MidiTrans(0 To 127) As Integer
Private DrumMap(0 To 127) As Integer

Private InstNames(128) As String
Private Drums(128) As String

Private Sub Command1_Click()
  Command1.Enabled = False
  If Option1(0).value Then
    SelectInstrument 4, lstRemapTo.ListIndex
    Command1.Tag = 50 + (Rnd * 4)
    ToneOn 4, CLng(Command1.Tag), 127
    Timer1.Enabled = True
  Else
    Command1.Tag = lstDrumR.ListIndex + 35
    ToneOn 9, CLng(Command1.Tag), 127
    Timer1.Enabled = True
  End If
End Sub

Private Sub Command2_Click()
  MidiClose
  
  Dim NewMap As IXMLDOMElement
  Dim NewInst As IXMLDOMElement
  Dim NewAtt As IXMLDOMAttribute
  Dim i As Integer, need As Boolean
  
  Set NewMap = frmSappy.x.createElement("midimap")
  
  For i = 0 To 127
    If MidiMap(i) <> i Then 'it's remapped
      need = True
      Set NewInst = frmSappy.x.createElement("inst")
      Set NewAtt = frmSappy.x.createAttribute("from")
      NewAtt.value = i
      NewInst.Attributes.setNamedItem NewAtt
      Set NewAtt = frmSappy.x.createAttribute("to")
      NewAtt.value = MidiMap(i)
      NewInst.Attributes.setNamedItem NewAtt
      If MidiTrans(i) <> 0 Then
        Set NewAtt = frmSappy.x.createAttribute("transpose")
        NewAtt.value = MidiTrans(i)
        NewInst.Attributes.setNamedItem NewAtt
      End If
      NewMap.appendChild NewInst
    End If
  Next i
  
  For i = 0 To 127
    If DrumMap(i) <> i Then 'it's remapped
      need = True
      Set NewInst = frmSappy.x.createElement("drum")
      Set NewAtt = frmSappy.x.createAttribute("from")
      NewAtt.value = i
      NewInst.Attributes.setNamedItem NewAtt
      Set NewAtt = frmSappy.x.createAttribute("to")
      NewAtt.value = DrumMap(i)
      NewInst.Attributes.setNamedItem NewAtt
      NewMap.appendChild NewInst
    End If
  Next i
    
  On Error Resume Next
  frmSappy.MidiMapsDaddy.removeChild frmSappy.MidiMapNode
  On Error GoTo 0
  If need Then
    frmSappy.MidiMapsDaddy.appendChild NewMap
  End If
    
  frmSappy.x.save frmSappy.xfile
  frmSappy.LoadGameFromXML frmSappy.gamecode
  Unload Me
End Sub

Private Sub Command3_Click()
  MidiClose
  Unload Me
End Sub

Private Sub Command4_Click()
  Dim i As Integer
  
  For i = 0 To 127
    MidiMap(i) = i
    MidiTrans(i) = 0
    DrumMap(i) = i
  Next i
  
  lstInsts.Clear
  For i = 0 To 127
    lstInsts.AddItem i & " - " & InstNames(MidiMap(i))
  Next i
  
  lstDrums.Clear
  For i = 35 To 81
    lstDrums.AddItem i & " - " & Drums(DrumMap(i))
  Next i
  
  lstInsts.ListIndex = 0
  lstDrums.ListIndex = 0
End Sub

Private Sub Form_Load()
  InstNames(0) = "Acoustic Grand Piano"
  InstNames(1) = "Bright Acoustic Piano"
  InstNames(2) = "Electric Grand Piano"
  InstNames(3) = "Honky-tonk Piano"
  InstNames(4) = "Rhodes Piano"
  InstNames(5) = "Chorus Piano"
  InstNames(6) = "Harpsichord"
  InstNames(7) = "Clavinet"
  InstNames(8) = "Celesta"
  InstNames(9) = "Glockenspiel"
  InstNames(10) = "Music Box"
  InstNames(11) = "Vibraphone"
  InstNames(12) = "Marimba"
  InstNames(13) = "Xylophone"
  InstNames(14) = "Tubular Bells"
  InstNames(15) = "Dulcimer"
  InstNames(16) = "Hammond Organ"
  InstNames(17) = "Percuss. Organ"
  InstNames(18) = "Rock Organ"
  InstNames(19) = "Church Organ"
  InstNames(20) = "Reed Organ"
  InstNames(21) = "Accordion"
  InstNames(22) = "Harmonica"
  InstNames(23) = "Tango Accordion"
  InstNames(24) = "Acoustic Guitar (nylon)"
  InstNames(25) = "Acoustic Guitar (steel)"
  InstNames(26) = "Electric Guitar (jazz)"
  InstNames(27) = "Electric Guitar (clean)"
  InstNames(28) = "Electric Guitar (muted)"
  InstNames(29) = "Overdriven Guitar"
  InstNames(30) = "Distortion Guitar"
  InstNames(31) = "Guitar Harmonics"
  InstNames(32) = "Acoustic Bass"
  InstNames(33) = "Electric Bass (finger)"
  InstNames(34) = "Electric Bass (pick)"
  InstNames(35) = "Fretless Bass"
  InstNames(36) = "Slap Bass 1"
  InstNames(37) = "Slap Bass 2"
  InstNames(38) = "Synth Bass 1"
  InstNames(39) = "Synth Bass 2"
  InstNames(40) = "Violin"
  InstNames(41) = "Viola"
  InstNames(42) = "Cello"
  InstNames(43) = "Contra Bass"
  InstNames(44) = "Tremolo Strings"
  InstNames(45) = "Pizzicato Strings"
  InstNames(46) = "Orchestral Harp"
  InstNames(47) = "Timpani"
  InstNames(48) = "String Ensemble 1"
  InstNames(49) = "String Ensemble 2"
  InstNames(50) = "Synth Strings 1"
  InstNames(51) = "Synth Strings 2"
  InstNames(52) = "Choir Aahs"
  InstNames(53) = "Voice Oohs"
  InstNames(54) = "Synth Voice"
  InstNames(55) = "Orchestra Hit"
  InstNames(56) = "Trumpet"
  InstNames(57) = "Trombone "
  InstNames(58) = "Tuba"
  InstNames(59) = "Muted Trumpet"
  InstNames(60) = "French Horn "
  InstNames(61) = "Brass Section"
  InstNames(62) = "Synth Brass 1"
  InstNames(63) = "Synth Brass 2"
  InstNames(64) = "Soprano Sax"
  InstNames(65) = "Alto Sax"
  InstNames(66) = "Tenor Sax"
  InstNames(67) = "Baritone Sax"
  InstNames(68) = "Oboe"
  InstNames(69) = "English Horn"
  InstNames(70) = "Bassoon"
  InstNames(71) = "Clarinet"
  InstNames(72) = "Piccolo"
  InstNames(73) = "Flute"
  InstNames(74) = "Recorder"
  InstNames(75) = "Pan Flute"
  InstNames(76) = "Bottle Blow"
  InstNames(77) = "Shaku"
  InstNames(78) = "Whistle"
  InstNames(79) = "Ocarina"
  InstNames(80) = "Lead 1 (square)"
  InstNames(81) = "Lead 2 (saw tooth)"
  InstNames(82) = "Lead 3 (calliope lead)"
  InstNames(83) = "Lead 4 (chiff lead)"
  InstNames(84) = "Lead 5 (charang)"
  InstNames(85) = "Lead 6 (voice)"
  InstNames(86) = "Lead 7 (fifths)"
  InstNames(87) = "Lead 8 (bass + lead)"
  InstNames(88) = "Pad 1 (new age)"
  InstNames(89) = "Pad 2 (warm)"
  InstNames(90) = "Pad 3 (poly synth)"
  InstNames(91) = "Pad 4 (choir)"
  InstNames(92) = "Pad 5 (bowed)"
  InstNames(93) = "Pad 6 (metallic)"
  InstNames(94) = "Pad 7 (halo)"
  InstNames(95) = "Pad 8 (sweep)"
  InstNames(96) = "FX 1 (rain)"
  InstNames(97) = "FX 2 (sound track)"
  InstNames(98) = "FX 3 (crystal)"
  InstNames(99) = "FX 4 (atmosphere)"
  InstNames(100) = "FX 5 (bright)"
  InstNames(101) = "FX 6 (goblins)"
  InstNames(102) = "FX 7 (echoes)"
  InstNames(103) = "FX 8 (sci-fi)"
  InstNames(104) = "Sitar"
  InstNames(105) = "Banjo"
  InstNames(106) = "Shamisen"
  InstNames(107) = "Koto"
  InstNames(108) = "Kalimba"
  InstNames(109) = "Bagpipe"
  InstNames(110) = "Fiddle"
  InstNames(111) = "Shanai"
  InstNames(112) = "Tinkle Bell"
  InstNames(113) = "Agogo"
  InstNames(114) = "Steel Drums"
  InstNames(115) = "Wood block"
  InstNames(116) = "Taiko Drum"
  InstNames(117) = "Melodic Tom"
  InstNames(118) = "Synth Drum "
  InstNames(119) = "Reverse Cymbal"
  InstNames(120) = "Guitar Fret Noise "
  InstNames(121) = "Breath Noise"
  InstNames(122) = "Seashore"
  InstNames(123) = "Bird Tweet"
  InstNames(124) = "Telephone Ring"
  InstNames(125) = "Helicopter"
  InstNames(126) = "Applause"
  InstNames(127) = "Gunshot"

  Drums(35) = "Acoustic Bass Drum"
  Drums(36) = "Bass Drum 1"
  Drums(37) = "Side Stick"
  Drums(38) = "Acoustic Snare"
  Drums(39) = "Hand Clap"
  Drums(40) = "Electric Snare"
  Drums(41) = "Low Floor Tom"
  Drums(42) = "Closed Hihat"
  Drums(43) = "High Floor Tom"
  Drums(44) = "Pedal Hihat"
  Drums(45) = "Low Tom"
  Drums(46) = "Open Hihat"
  Drums(47) = "Low-Mid Tom"
  Drums(48) = "Hi-Mid Tom"
  Drums(49) = "Crash Cymbal 1"
  Drums(50) = "High Tom"
  Drums(51) = "Ride Cymbal 1"
  Drums(52) = "Chinese Cymbal"
  Drums(53) = "Ride Bell"
  Drums(54) = "Tambourine"
  Drums(55) = "Splash Cymbal"
  Drums(56) = "Cowbell"
  Drums(57) = "Crash Cymbal 1"
  Drums(58) = "Vibraslap"
  Drums(59) = "Ride Cymbal 2"
  Drums(60) = "High Bongo"
  Drums(61) = "Low Bongo"
  Drums(62) = "Mute High Conga"
  Drums(63) = "Open High Conga"
  Drums(64) = "Low Conga"
  Drums(65) = "High Timbale"
  Drums(66) = "Low Timbale"
  Drums(67) = "High Agogo"
  Drums(68) = "Low Agogo"
  Drums(69) = "Cabasa"
  Drums(70) = "Maracas"
  Drums(71) = "Short Whistle"
  Drums(72) = "Long Whistle"
  Drums(73) = "Short Guiro"
  Drums(74) = "Long Guiro"
  Drums(75) = "Claves"
  Drums(76) = "High Woodblock"
  Drums(77) = "Low Woodblock"
  Drums(78) = "Mute Cuica"
  Drums(79) = "Open Cuica"
  Drums(80) = "Mute Triangle"
  Drums(81) = "Open Triangle  "
  Dim i As Integer
  
  For i = 0 To 127
    MidiMap(i) = i
    MidiTrans(i) = 0
    DrumMap(i) = i
  Next i
  
  Dim n4 As IXMLDOMElement
  If frmSappy.MidiMapNode Is Nothing Then
    i = 0
  Else
    For Each n4 In frmSappy.MidiMapNode.childNodes
      If n4.baseName = "inst" Then
        i = n4.getAttribute("from")
        MidiMap(i) = n4.getAttribute("to")
        On Error Resume Next
        MidiTrans(i) = n4.getAttribute("transpose")
        On Error GoTo 0
      End If
      If n4.baseName = "drum" Then
        i = n4.getAttribute("from")
        DrumMap(i) = n4.getAttribute("to")
      End If
    Next
  End If
  
  For i = 0 To 127
    lstInsts.AddItem i & " - " & InstNames(MidiMap(i))
    lstRemapTo.AddItem i & " - " & InstNames(i)
  Next i
  
  For i = 35 To 81
    lstDrums.AddItem NoteToName(i) & " - " & Drums(DrumMap(i))
    lstDrumR.AddItem NoteToName(i) & " - " & Drums(i)
  Next i
  
  lstInsts.ListIndex = 0
  lstDrums.ListIndex = 0
  MidiOpen
  
  Picture1(0).BorderStyle = 0
  Picture1(1).BorderStyle = 0
  Option1(0).value = True
  Option1_Click 0
  
  Caption = LoadResString(5000)
  SetCaptions Me
End Sub

Private Sub lstDrumR_Click()
  DrumMap(lstDrums.ListIndex + 35) = lstDrumR.ListIndex + 35
  lstDrums.List(lstDrums.ListIndex) = NoteToName(lstDrums.ListIndex + 35) & " - " & Drums(lstDrumR.ListIndex + 35)
End Sub

Private Sub lstDrumR_DblClick()
  If Command1.Tag <> "" Then Timer1_Timer
  Command1_Click
End Sub

Private Sub lstDrums_Click()
  lstDrumR.ListIndex = DrumMap(lstDrums.ListIndex + 35) - 35
End Sub

Private Sub lstDrums_DblClick()
  If Command1.Tag <> "" Then Timer1_Timer
  Command1_Click
End Sub

Private Sub lstInsts_Click()
  lstRemapTo.ListIndex = MidiMap(lstInsts.ListIndex)
  txtTranspose = MidiTrans(lstInsts.ListIndex)
End Sub

Private Sub lstInsts_DblClick()
  If Command1.Tag <> "" Then Timer1_Timer
  Command1_Click
End Sub

Private Sub lstRemapTo_Click()
  MidiMap(lstInsts.ListIndex) = lstRemapTo.ListIndex
  lstInsts.List(lstInsts.ListIndex) = lstInsts.ListIndex & " - " & InstNames(lstRemapTo.ListIndex)
End Sub

Private Sub lstRemapTo_DblClick()
  If Command1.Tag <> "" Then Timer1_Timer
  Command1_Click
End Sub

Private Sub Option1_Click(Index As Integer)
  Picture1(Index).ZOrder
End Sub

Private Sub Timer1_Timer()
  ToneOff 4, CLng(Command1.Tag)
  Command1.Enabled = True
End Sub

Private Sub txtTranspose_LostFocus()
  MidiTrans(lstInsts.ListIndex) = Val(txtTranspose)
End Sub
