VERSION 5.00
Begin VB.Form frmSelectMidiOut 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "[9000] Select MIDIOUT"
   ClientHeight    =   2175
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3735
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmSelectMidiOut.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2175
   ScaleWidth      =   3735
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin Sappy2k6.SkinButton Command1 
      Default         =   -1  'True
      Height          =   375
      Left            =   2280
      TabIndex        =   2
      Top             =   1680
      Width           =   1335
      _ExtentX        =   2355
      _ExtentY        =   661
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "[4]"
   End
   Begin VB.ListBox List1 
      Height          =   1335
      IntegralHeight  =   0   'False
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   3495
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Blah"
      Height          =   495
      Left            =   120
      TabIndex        =   1
      Top             =   1560
      Width           =   2055
   End
End
Attribute VB_Name = "frmSelectMidiOut"
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
' __________________
'|  MidiOUT dialog  |
'|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|
'| Code 100% by Kyoufu Kawa.                          |
'| Last update: July 20th, 2006                       |
'|____________________________________________________|
'
'###########################################################################################
Option Explicit

Private Declare Function midiOutGetNumDevs Lib "winmm.dll" () As Integer
Private Declare Function midiOutGetDevCaps Lib "winmm.dll" Alias "midiOutGetDevCapsA" (ByVal uDeviceID As Long, ByRef lpCaps As MIDIOUTCAPS, ByVal uSize As Long) As Long

Private Type MIDIOUTCAPS
  wMid As Integer
  wPid As Integer
  vDriverVersion As Long
  szPname As String * 32
  wTechnology As Integer
  wVoices As Integer
  wNotes As Integer
  wChannelMask As Integer
  dwSupport As Long
End Type

Private Sub Command1_Click()
  ClickSound
  WantedMidiDevice = List1.ListIndex
  WriteSettingI "MIDI Device", WantedMidiDevice
  Unload Me
End Sub

Private Sub Form_Load()
  If midiOutGetNumDevs = 0 Then
    List1.AddItem "No devices."
    Exit Sub
  End If
  
  Dim i As Integer, myCaps As MIDIOUTCAPS
  For i = 1 To midiOutGetNumDevs
    midiOutGetDevCaps i - 1, myCaps, 52 'LenB(myCaps)
    List1.AddItem myCaps.szPname 'Trim(myCaps.szPname)
  Next i
  
  List1.ListIndex = WantedMidiDevice
  
  SetCaptions Me
  Caption = LoadResString(9000)
End Sub

Private Sub Form_Paint()
  DrawSkin Me
End Sub

Private Sub List1_Click()
  If midiOutGetNumDevs = 0 Then Label1 = ""
  
  Dim myCaps As MIDIOUTCAPS
  midiOutGetDevCaps List1.ListIndex, myCaps, 52
  Label1 = LoadResString(9000 + myCaps.wTechnology)
  Select Case myCaps.wTechnology
    Case 1: Label1 = Label1 & vbCrLf & "W00t!"
    Case 3: Label1 = Label1 & vbCrLf & "Oooh..."
    Case 4: Label1 = Label1 & vbCrLf & "Lame..."
    Case 6: Label1 = Label1 & vbCrLf & "Sweet!"
    Case 7: Label1 = Label1 & vbCrLf & "Cool!"
  End Select
End Sub

'Private Const MOD_MIDIPORT As Long = 1
'Private Const MOD_SYNTH As Long = 2
'Private Const MOD_SQSYNTH As Long = 3
'Private Const MOD_FMSYNTH As Long = 4
'Private Const MOD_MAPPER As Long = 5
'Private Const MOD_WAVETABLE As Long = 6
'Private Const MOD_SWSYNTH As Long = 7

