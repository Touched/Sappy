VERSION 5.00
Object = "{77EBD0B1-871A-4AD1-951A-26AEFE783111}#2.1#0"; "vbalExpBar6.ocx"
Object = "{3D800911-77E3-43DE-82EA-7FC87C713180}#1.1#0"; "cPopMenu6.ocx"
Object = "{B6C8B132-5973-4983-AD46-8F3F10B04531}#1.0#0"; "vbalCbEx6.ocx"
Begin VB.Form frmSappy 
   Caption         =   "Sappy"
   ClientHeight    =   6600
   ClientLeft      =   150
   ClientTop       =   720
   ClientWidth     =   7425
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmSappy.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   440
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   495
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox picTop 
      BorderStyle     =   0  'None
      Height          =   1320
      Left            =   2550
      ScaleHeight     =   1320
      ScaleWidth      =   4860
      TabIndex        =   4
      Top             =   0
      Width           =   4860
      Begin VB.CommandButton cmdStop 
         Enabled         =   0   'False
         Height          =   495
         Left            =   4310
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   6
         Top             =   765
         UseMaskColor    =   -1  'True
         Width           =   495
      End
      Begin VB.CommandButton cmdPrevSong 
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   960
         MaskColor       =   &H00FF00FF&
         Style           =   1  'Graphical
         TabIndex        =   8
         Top             =   120
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdNextSong 
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   4380
         MaskColor       =   &H00FF00FF&
         Style           =   1  'Graphical
         TabIndex        =   11
         Top             =   120
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.TextBox txtSong 
         Enabled         =   0   'False
         Height          =   330
         Left            =   1365
         TabIndex        =   9
         Text            =   "1"
         Top             =   120
         Width           =   495
      End
      Begin VB.CommandButton cmdPlay 
         Enabled         =   0   'False
         Height          =   495
         Left            =   3820
         MaskColor       =   &H00FFFFFF&
         Style           =   1  'Graphical
         TabIndex        =   5
         Top             =   765
         UseMaskColor    =   -1  'True
         Width           =   495
      End
      Begin Sappy2k6.SkinButton cmdSpeed 
         Height          =   195
         Index           =   0
         Left            =   3600
         TabIndex        =   16
         Tag             =   "[NoLocal]"
         Top             =   525
         Width           =   195
         _ExtentX        =   344
         _ExtentY        =   344
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   6
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "<"
      End
      Begin vbalComboEx6.vbalCboEx cbxSongs 
         CausesValidation=   0   'False
         Height          =   330
         Left            =   1920
         TabIndex        =   10
         Tag             =   "[NoLocal]"
         Top             =   120
         Width           =   2415
         _ExtentX        =   4260
         _ExtentY        =   582
         Style           =   2
         Enabled         =   0   'False
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ExtendedUI      =   0   'False
         DropDownWidth   =   250
         Redraw          =   0   'False
      End
      Begin Sappy2k6.VolumeSlider VolumeSlider1 
         Height          =   375
         Left            =   2280
         TabIndex        =   20
         Top             =   840
         Width           =   975
         _ExtentX        =   1720
         _ExtentY        =   661
      End
      Begin Sappy2k6.SkinButton cmdSpeed 
         Height          =   195
         Index           =   1
         Left            =   3780
         TabIndex        =   17
         Tag             =   "[NoLocal]"
         Top             =   525
         Width           =   195
         _ExtentX        =   344
         _ExtentY        =   344
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   6
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   ">"
      End
      Begin VB.Label lblSong 
         BackStyle       =   0  'Transparent
         Caption         =   "[101]Song"
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   165
         Width           =   735
      End
      Begin VB.Label lblSpeed 
         BackStyle       =   0  'Transparent
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   3120
         TabIndex        =   15
         Top             =   525
         Width           =   495
      End
      Begin VB.Label Label4 
         BackStyle       =   0  'Transparent
         Caption         =   "[93]Speed"
         Height          =   255
         Left            =   2160
         TabIndex        =   14
         Top             =   525
         Width           =   855
      End
      Begin VB.Label lblInst 
         BackStyle       =   0  'Transparent
         Caption         =   "0x000000"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   1080
         TabIndex        =   22
         Top             =   1005
         Width           =   975
      End
      Begin VB.Label Label3 
         BackStyle       =   0  'Transparent
         Caption         =   "[92]Voices"
         Height          =   255
         Left            =   120
         TabIndex        =   21
         Top             =   1005
         Width           =   855
      End
      Begin VB.Label lblLoc 
         BackStyle       =   0  'Transparent
         Caption         =   "0x000000"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   1080
         TabIndex        =   19
         Top             =   765
         Width           =   975
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "[91]Header"
         Height          =   255
         Left            =   120
         TabIndex        =   18
         Top             =   765
         Width           =   855
      End
      Begin VB.Label lblDef 
         BackStyle       =   0  'Transparent
         Caption         =   "0x000000"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   1080
         TabIndex        =   13
         Top             =   525
         Width           =   975
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "[90]Table"
         Height          =   255
         Left            =   120
         TabIndex        =   12
         Top             =   525
         Width           =   855
      End
      Begin VB.Image imgButtonBorder 
         BorderStyle     =   1  'Fixed Single
         Height          =   525
         Left            =   3815
         Top             =   750
         Width           =   1005
      End
   End
   Begin VB.PictureBox picSkin 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      Height          =   375
      Left            =   4200
      ScaleHeight     =   21
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   21
      TabIndex        =   3
      Top             =   4320
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Timer timPlay 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   3720
      Top             =   4320
   End
   Begin VB.PictureBox picStatusbar 
      Align           =   2  'Align Bottom
      BorderStyle     =   0  'None
      Height          =   255
      Left            =   0
      ScaleHeight     =   17
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   495
      TabIndex        =   0
      Top             =   6345
      Width           =   7425
   End
   Begin VB.PictureBox picChannels 
      AutoRedraw      =   -1  'True
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   2655
      Left            =   2550
      ScaleHeight     =   177
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   324
      TabIndex        =   23
      Top             =   1320
      Width           =   4860
      Begin Sappy2k6.ChanView cvwChannel 
         Height          =   240
         Index           =   0
         Left            =   0
         TabIndex        =   30
         Top             =   465
         Visible         =   0   'False
         Width           =   4815
         _ExtentX        =   8493
         _ExtentY        =   423
         Mute            =   1
         Location        =   "0x000000"
         Delay           =   "0"
         Patch           =   "0"
         Volume          =   "0"
         Note            =   ""
         IType           =   "Direct"
      End
      Begin VB.CheckBox chkMute 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         Enabled         =   0   'False
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   30
         TabIndex        =   25
         ToolTipText     =   "Mute All"
         Top             =   255
         Value           =   1  'Checked
         Width           =   195
      End
      Begin VB.Line linProgress 
         BorderColor     =   &H0000C0C0&
         BorderWidth     =   2
         X1              =   -1
         X2              =   136
         Y1              =   16
         Y2              =   16
      End
      Begin VB.Label lblExpand 
         BackStyle       =   0  'Transparent
         Caption         =   "6"
         BeginProperty Font 
            Name            =   "Marlett"
            Size            =   9.75
            Charset         =   2
            Weight          =   500
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000C000&
         Height          =   225
         Left            =   4575
         MouseIcon       =   "frmSappy.frx":014A
         MousePointer    =   99  'Custom
         TabIndex        =   29
         Tag             =   "[NoLocal]"
         Top             =   240
         Width           =   240
      End
      Begin VB.Label lblSongName 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "[102]PleaseLoadGame"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   165
         Left            =   240
         TabIndex        =   24
         Tag             =   "[NoLocal]"
         Top             =   30
         Width           =   4335
      End
      Begin VB.Line Line2 
         BorderColor     =   &H00008080&
         X1              =   0
         X2              =   326
         Y1              =   16
         Y2              =   16
      End
      Begin VB.Line Line1 
         BorderColor     =   &H00008080&
         X1              =   0
         X2              =   326
         Y1              =   30
         Y2              =   30
      End
      Begin VB.Label lblPC 
         BackStyle       =   0  'Transparent
         Caption         =   "[103]Loc"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000C000&
         Height          =   180
         Left            =   270
         TabIndex        =   26
         Top             =   255
         Width           =   615
      End
      Begin VB.Label lblDel 
         BackStyle       =   0  'Transparent
         Caption         =   "Del"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000040C0&
         Height          =   180
         Left            =   960
         TabIndex        =   27
         Top             =   255
         Width           =   255
      End
      Begin VB.Label lblNote 
         BackStyle       =   0  'Transparent
         Caption         =   "[104]Note"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C0C000&
         Height          =   180
         Left            =   1320
         TabIndex        =   28
         Top             =   255
         Width           =   975
      End
   End
   Begin vbalExplorerBarLib6.vbalExplorerBarCtl ebr 
      Align           =   3  'Align Left
      Height          =   6345
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   2550
      _ExtentX        =   4498
      _ExtentY        =   11192
      BackColorEnd    =   0
      BackColorStart  =   0
      Begin VB.PictureBox picScreenshot 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   1230
         Left            =   360
         ScaleHeight     =   82
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   122
         TabIndex        =   2
         Top             =   4560
         Width           =   1830
      End
   End
   Begin cPopMenu6.PopMenu cPop 
      Left            =   3000
      Top             =   4320
      _ExtentX        =   1058
      _ExtentY        =   1058
      HighlightCheckedItems=   0   'False
      TickIconIndex   =   0
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00FF0000&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00800000&
      BorderWidth     =   2
      FillColor       =   &H00800000&
      FillStyle       =   7  'Diagonal Cross
      Height          =   855
      Left            =   2880
      Top             =   4200
      Visible         =   0   'False
      Width           =   3375
   End
   Begin VB.Menu mnuFile 
      Caption         =   "[10]File"
      Begin VB.Menu mnuFileOpen 
         Caption         =   "[11]Open"
      End
      Begin VB.Menu mnuFileSep 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFileExit 
         Caption         =   "[12]Exit"
      End
   End
   Begin VB.Menu mnuTasks 
      Caption         =   "[20]Tasks"
   End
   Begin VB.Menu mnuOptions 
      Caption         =   "[30]Options"
      Begin VB.Menu mnuOutput 
         Caption         =   "[31]Output to MIDI"
         Index           =   0
      End
      Begin VB.Menu mnuOutput 
         Caption         =   "[32]Output to Wave"
         Checked         =   -1  'True
         Index           =   1
      End
      Begin VB.Menu mnuOptionsSep 
         Caption         =   "-"
      End
      Begin VB.Menu mnuSeekPlaylist 
         Caption         =   "[36]Seek by Playlist"
      End
      Begin VB.Menu mnuAutovance 
         Caption         =   "[37]AutoAdvance"
         Visible         =   0   'False
      End
      Begin VB.Menu mnuGBMode 
         Caption         =   "[33]Gameboy Mode"
      End
      Begin VB.Menu mnuOptionsSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuImportLST 
         Caption         =   "[35]Import LST file"
      End
      Begin VB.Menu mnuSelectMIDI 
         Caption         =   "[38]Select MIDI device..."
      End
      Begin VB.Menu mnuMidiMap 
         Caption         =   "[39]Remap MIDI instruments..."
      End
      Begin VB.Menu mnuOptionsSep3 
         Caption         =   "-"
      End
      Begin VB.Menu mnuSettings 
         Caption         =   "[34]Settings"
      End
   End
   Begin VB.Menu mnuHelp 
      Caption         =   "[40]Help"
      Begin VB.Menu mnuHelpHelp 
         Caption         =   "[43]Help"
      End
      Begin VB.Menu mnuHelpAbout 
         Caption         =   "[41]About"
      End
      Begin VB.Menu mnuHelpOnline 
         Caption         =   "[42]HR Online"
      End
   End
End
Attribute VB_Name = "frmSappy"
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
'|  Main interface  |
'|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|
'| Code 99% by Kyoufu Kawa.                           |
'| Last update: July 22nd, 2006                       |
'|____________________________________________________|
'
'###########################################################################################

Option Explicit

Private Type RECT
        left As Long
        tOp As Long
        Right As Long
        Bottom As Long
End Type

Private Type tSongHeader
  NumTracks As Byte
  NumBlocks As Byte
  Priority As Byte
  Reverb As Byte
  VoiceGroup As Long
  Tracks(32) As Long
End Type

Private Type tPlaylist
  NumSongs As Integer
  SongName(1024) As String
  SongNo(1024) As Integer
End Type

Private playlist(0 To 255) As tPlaylist
Private NumPLs As Integer
Private MidiMap(0 To 127) As Integer
Private MidiMapTrans(0 To 127) As Integer
Private DrumMap(0 To 127) As Integer
Private BleedingEars(0 To 127) As Integer
Private BECnt As Integer
Public MidiMapNode As IXMLDOMElement
Public MidiMapsDaddy As IXMLDOMElement

Private SongHead As tSongHeader
Private SongHeadOrg As Long

Public SongTbl As Long
Public gamecode As String
Public myFile As String
Public xfile As String

Private DontLoadDude As Boolean
Private TaskMenus(16) As Long

Public imlImages As cVBALImageList
Public imlStatusbar As cVBALImageList
Private WithEvents cStatusBar As cNoStatusBar
Attribute cStatusBar.VB_VarHelpID = -1
Public x As New DOMDocument
Public rootNode As IXMLDOMElement

Implements ISubclass
Private e_mr As EMsgResponse
Private Const WM_SIZING = &H214
Private mywidth As Long

Private Const WM_APPCOMMAND As Long = &H319
Private Const APPCOMMAND_MEDIA_NEXTTRACK As Long = 11
Private Const APPCOMMAND_MEDIA_PLAY_PAUSE As Long = 14
Private Const APPCOMMAND_MEDIA_PREVIOUSTRACK As Long = 12
Private Const APPCOMMAND_MEDIA_STOP As Long = 13
Private Const APPCOMMAND_VOLUME_DOWN As Long = 9
Private Const APPCOMMAND_VOLUME_UP As Long = 10

Private Const WM_MOUSEWHEEL As Long = &H20A

Public WithEvents SappyDecoder As clsSappyDecoder
Attribute SappyDecoder.VB_VarHelpID = -1
Dim DutyCycleWave(0 To 4) As String
Dim DutyCycle(0 To 4) As Long
Dim mm As Boolean

Private Playing As Boolean
Private TotalMinutes As Integer
Private TotalSeconds As Integer
Private loopsToGo As Integer
Private songinfo As String
Private justthesongname As String
Private WantToRecord As Integer
Private WantToRecordTo As String
Private FullWidth As Long
Private ClassicWidth As Long

Private Declare Function midiOutGetNumDevs Lib "winmm.dll" () As Integer
Private Declare Function GetPixel Lib "gdi32.dll" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long) As Long

'Private WithEvents HookedDialog As cCommonDialog
'Private m_bInIDE As Boolean

Private Sub cbxSongs_Change()
  Dim i As Integer
  If DontLoadDude = True Then Exit Sub
  If cbxSongs.ItemData(cbxSongs.ListIndex) = 9999 Then Exit Sub 'don't try to load playlists
  txtSong = cbxSongs.ItemData(cbxSongs.ListIndex)
  LoadSong txtSong
End Sub

Private Sub chkMute_Click()
  Dim i As Integer
  If chkMute.Tag = "^_^" Then Exit Sub
  'If Playing = True Then
  '  For i = 0 To SappyDecoder.SappyChannels.count - 1
  '    cvwChannel(i).mute = chkMute.value
  '  Next i
  'Else
  chkMute.Tag = "O.O"
  For i = 0 To cvwChannel.count - 1
    cvwChannel(i).mute = chkMute.value
  Next i
  chkMute.Tag = "-_-"
  'End If
End Sub

Private Sub cmdPlay_Click()
  Dim i As Integer
  Dim S As String
  cmdStop_Click
  MousePointer = 11
  SappyDecoder.outputtype = IIf(mnuOutput(1).Checked = True, sotWave, sotMIDI)
  SappyDecoder.ClearMidiPatchMap
  For i = 0 To 127
    'SappyDecoder.MidiMap(i) = MidiMap(i)
    SappyDecoder.SetMidiPatchMap i, MidiMap(i), MidiMapTrans(i)
    SappyDecoder.SetMidiDrumMap i, DrumMap(i)
  Next i
  For i = 0 To BECnt
    SappyDecoder.AddEarPiercer BleedingEars(i)
  Next i
  If mnuGBMode.Checked = True Then
    For i = 0 To 126
      'SappyDecoder.MidiMap(i) = IIf(i Mod 2 = 1, 80, 81) '80
      SappyDecoder.SetMidiPatchMap i, IIf(i Mod 2 = 1, 80, 81), 0
    Next i
  End If
  
  linProgress.x2 = -1
  
  SappyDecoder.PlaySong myFile, txtSong, SongTbl, (WantToRecord), WantToRecordTo

  WantToRecord = 2
  
  cStatusBar.PanelText("simple") = ""
 
  For i = 0 To SappyDecoder.SappyChannels.count - 1
    SappyDecoder.SappyChannels(i + 1).mute = IIf(cvwChannel(i).mute = 1, False, True)
    cvwChannel(i).Note = ""
    cvwChannel(i).pan = 0
    cvwChannel(i).volume = 0
    cvwChannel(i).patch = 0
  Next i
  
  lblSpeed = SappyDecoder.Tempo
  
  TotalMinutes = 0
  TotalSeconds = 0
  timPlay.Enabled = True
  
  loopsToGo = GetSettingI("Song Repeats")
  Playing = True
  cmdPlay.Picture = imlImages.ItemPicture(20)
  
  If GetSettingI("mIRC Now Playing") Then
    Open "sappy.stt" For Output As #42
    Print #42, songinfo
    Close #42
  End If
  
  If GetSettingI("MSN Now Playing") Then
    TellMSN justthesongname & IIf(SappyDecoder.outputtype = sotMIDI, " (midi)", ""), _
            "Sappy " & App.Major & "." & App.Minor, _
            ebr.Bars("Info").Items("Game").Text & " (" & gamecode & ")" _
            'ebr.Bars("Info").Items("Creator").Text
  End If
  
  mnuOutput(0).Enabled = False
  mnuOutput(1).Enabled = False
  mnuGBMode.Enabled = False
  mnuSelectMIDI.Enabled = False
  mnuMidiMap.Enabled = False
  MousePointer = 0
End Sub

Private Sub cmdNextSong_Click()
  If mnuSeekPlaylist.Checked = True Then
    If cbxSongs.ListCount = 1 Then Exit Sub
    If cbxSongs.ListIndex = cbxSongs.ListCount - 1 Then
      cbxSongs.ListIndex = 1
    Else
      cbxSongs.ListIndex = cbxSongs.ListIndex + 1
      Do
        If cbxSongs.ItemData(cbxSongs.ListIndex) = 9999 Then
          If cbxSongs.ListIndex = cbxSongs.ListCount - 1 Then
            cbxSongs.ListIndex = 1
          Else
            cbxSongs.ListIndex = cbxSongs.ListIndex + 1
          End If
        Else
          Exit Do
        End If
      Loop
    End If
    cbxSongs_Change
  Else
    If txtSong = 1024 Then Exit Sub
    txtSong = txtSong + 1
    LoadSong txtSong
  End If
End Sub

Private Sub cmdPrevSong_Click()
  If mnuSeekPlaylist.Checked = True Then
    If cbxSongs.ListCount = 1 Then Exit Sub
    If cbxSongs.ListIndex = 0 Then
      cbxSongs.ListIndex = cbxSongs.ListCount - 1
    Else
      cbxSongs.ListIndex = cbxSongs.ListIndex - 1
      Do
        If cbxSongs.ItemData(cbxSongs.ListIndex) = 9999 Then
          If cbxSongs.ListIndex = 0 Then
            cbxSongs.ListIndex = cbxSongs.ListCount - 1
          Else
            cbxSongs.ListIndex = cbxSongs.ListIndex - 1
          End If
        Else
          Exit Do
        End If
      Loop
    End If
    cbxSongs_Change
  Else
    If txtSong = 0 Then Exit Sub '181205 update: Someguy complained about lack of Track Zero in Sonic
    txtSong = txtSong - 1
    LoadSong txtSong
  End If
End Sub

Private Sub cmdSpeed_Click(Index As Integer)
  If Index = 0 Then SappyDecoder.Tempo = Int(SappyDecoder.Tempo / 2)
  If Index = 1 Then SappyDecoder.Tempo = Int(SappyDecoder.Tempo * 2)
  lblSpeed = SappyDecoder.Tempo
End Sub

Private Sub cmdStop_Click()
  If Playing = True Then
    Playing = False
    SappyDecoder.StopSong
    linProgress.x2 = -1
  End If
  If mnuAutovance.Checked = True Then cmdPrevSong_Click
  
  If WantToRecord = 2 Then WantToRecord = 0
  
  Playing = False
  timPlay.Enabled = False
  cmdPlay.Picture = imlImages.ItemPicture(19)
  Dim i As Integer
  For i = 0 To cvwChannel.count - 1
    cvwChannel(i).volume = 0
    cvwChannel(i).pan = 0
  Next i
  
  If GetSetting("mIRC Now Playing") Then
    Open "sappy.stt" For Output As #42
    Print #42, App.Major & "." & App.Minor & "| | | |Not running|"
    Close #42
  End If
  
  If GetSettingI("MSN Now Playing") Then ShutMSN
  mnuOutput(0).Enabled = True
  mnuOutput(1).Enabled = True
  mnuSelectMIDI.Enabled = True
  mnuMidiMap.Enabled = True
  mnuGBMode.Enabled = mnuOutput(0).Checked
End Sub

Private Sub cPop_Click(ItemNumber As Long)
  Dim itm As vbalExplorerBarLib6.cExplorerBarItem
  Dim i As Integer
  For i = 1 To 16
    If ItemNumber = TaskMenus(i) Then
      Set itm = ebr.Bars("Tasks").Items(cPop.MenuKey(ItemNumber))
      ebr_ItemClick itm
    End If
  Next i
End Sub

Private Sub cPop_ItemHighlight(ItemNumber As Long, bEnabled As Boolean, bSeparator As Boolean)
  cStatusBar.PanelText("simple") = cPop.HelpText(ItemNumber)
  'cStatusBar.SimpleMode = True
  'cStatusBar.SimpleText = cPop.HelpText(ItemNumber)
  'picStatusbar.Refresh
End Sub

Private Sub cPop_MenuExit()
  cStatusBar.PanelText("simple") = ""
  'cStatusBar.SimpleMode = False
  'picStatusbar.Refresh
End Sub

Private Sub cvwChannel_MuteChanged(Index As Integer)
  'If Playing = False Then Exit Sub
  On Error Resume Next
  If SappyDecoder.SappyChannels.count < 1 Then GoTo FlickIt 'Exit Sub
  SappyDecoder.SappyChannels(Index + 1).mute = IIf(cvwChannel(Index).mute = 1, False, True)
  
FlickIt:
  If chkMute.Tag = "O.O" Then Exit Sub
  Dim i As Integer, j As Integer
  For i = 0 To SappyDecoder.SappyChannels.count - 1
    If cvwChannel(i).mute = 1 Then j = j + 1
  Next i
  chkMute.Tag = "^_^"
  If j = SappyDecoder.SappyChannels.count Then
    chkMute.value = 1
  ElseIf j = 0 Then
    chkMute.value = 0
  Else
    chkMute.value = 2
  End If
  chkMute.Tag = "-_-"
End Sub

Private Sub cvwChannel_Resize(Index As Integer)
  Dim i As Integer
  For i = 1 To cvwChannel.count - 1
    cvwChannel(i).tOp = cvwChannel(i - 1).tOp + cvwChannel(i - 1).Height
  Next i
End Sub

Private Sub ebr_BarClick(bar As vbalExplorerBarLib6.cExplorerBar)
  WriteSettingI "Bar " & bar.Index & " state", bar.State
End Sub

Private Sub ebr_ItemClick(itm As vbalExplorerBarLib6.cExplorerBarItem)
  Dim i As Long
  Dim S As String
  If itm.Key = "taketrax" Then
    For i = 0 To SongHead.NumTracks - 1
      frmTakeTrax.lstTracks.AddItem "0x" & FixHex(SongHead.Tracks(i), 6)
    Next i
    frmTakeTrax.Show 1
  End If
  If itm.Key = "maketrax" Then
    frmMakeTrax.txtHeaderOffset = "0x" & FixHex(SongHeadOrg, 6)
    frmMakeTrax.txtTrack = "0x" & FixHex(SongHead.Tracks(i), 6)
    frmMakeTrax.MyNumblocks = SongHead.NumBlocks
    frmMakeTrax.MyPriority = SongHead.Priority
    frmMakeTrax.MyReverb = SongHead.Reverb
    frmMakeTrax.txtVoicegroup = "0x" & FixHex(SongHead.VoiceGroup, 6)
    frmMakeTrax.SongTableEntry = SongTbl + (txtSong * 8)
    frmMakeTrax.Show 1
  End If
  If itm.Key = "takesamp" Then
    frmTakeSamp.SingleSong = SongHeadOrg
    frmTakeSamp.Show 1
  End If
  If itm.Key = "codetrax" Then
    frmAssembler.SongTableEntry = SongTbl + (txtSong * 8)
    frmAssembler.txtVoicegroup = "0x" & FixHex(SongHead.VoiceGroup, 6)
    frmAssembler.Show 1
  End If
  If itm.Key = "makemidi" Then PrepareRecording
  
  If itm.Key = "Game" Then
    S = ebr.Bars("Info").Items("Game").Text
    S = InputBox(LoadResString(210), , S)
    If S = "" Then GoTo hell
    ebr.Bars("Info").Items("Game").Text = S
    SaveNewRomHeader "name", S
  End If
  If itm.Key = "Creator" Then
    S = ebr.Bars("Info").Items("Creator").Text
    If S = LoadResString(63) Then S = "" Else S = Mid(S, Len(LoadResString(65)) + 1)
    S = InputBox(LoadResString(211), , S)
    If S = "" Then GoTo hell
    ebr.Bars("Info").Items("Creator").Text = LoadResString(65) & S
    SaveNewRomHeader "creator", S
  End If
  If itm.Key = "Tagger" Then
    S = ebr.Bars("Info").Items("Tagger").Text
    If S = LoadResString(64) Then S = "" Else S = Mid(S, Len(LoadResString(66)) + 1)
    S = InputBox(LoadResString(212), , S)
    If S = "" Then GoTo hell
    ebr.Bars("Info").Items("Tagger").Text = LoadResString(66) & S
    SaveNewRomHeader "tagger", S
  End If
hell:
  cmdPlay.SetFocus
End Sub

Private Sub Form_Load()
  Dim i As Integer, j As Integer, blah As IXMLDOMElement, regset As String
  
  Trace "frmSappy/Form_Load()"
  Trace "- Set icon"
  SetIcon hwnd, "APP", True
  
  Trace "- DoomClock"
  Dim y As Integer
  Dim D As Integer
  Dim m As Integer
  Dim thresh As Integer
  D = Val(Format(Now, "dd"))
  m = Val(Format(Now, "mm"))
  y = Val(Format(Now, "yyyy"))
  thresh = 2007
  If (y > thresh) Or (y = thresh And D >= 25 And m = 12) Then
    Trace "- DoomClock triggered."
    ShellExecute 0, vbNullString, "http://helmetedrodent.kickassgamers.com", vbNullString, "", 1
    End
  End If
  
  Trace "- Set dimensions"
  ScaleMode = 1
  cbxSongs.Height = 330
  mywidth = Width / Screen.TwipsPerPixelX 'remember for wmSize subclass
  
  Trace "- Create duty cycle waves"
  DutyCycleWave(0) = String(14, Chr(0)) & String(2, Chr(255))
  DutyCycleWave(1) = String(12, Chr(0)) & String(4, Chr(255))
  DutyCycleWave(2) = String(16, Chr(0)) & String(16, Chr(255))
  DutyCycleWave(3) = String(4, Chr(0)) & String(12, Chr(255))
  
  Trace "- Create Sappy engine"
  Set SappyDecoder = New clsSappyDecoder
  
  Trace "- Get settings"
  mnuSeekPlaylist.Checked = GetSettingI("Seek by Playlist")
  mnuAutovance.Checked = GetSettingI("AutoAdvance")
  regset = GetSetting("Driver")
  If Trim(regset) = "" Then regset = "FMOD"
  mnuOutput(0).Checked = IIf(regset = "MIDI", True, False)
  mnuOutput(1).Checked = IIf(regset = "FMOD", True, False)
  mnuGBMode.Checked = GetSettingI("MIDI in GB Mode")
  i = GetSettingI("Window Height")
  If i > 0 Then Height = i
  WantedMidiDevice = GetSettingI("MIDI Device")
  i = GetSettingI("FMOD Volume")
  If i > 0 Then VolumeSlider1.SetValue i
  
  FullWidth = Width
  If LoadResString(10000) = "<NLPLZ>" Or LoadResString(10000) = "<SPLZ>" Or LoadResString(10000) = "<DPLZ>" Then
    FullWidth = FullWidth + (16 * Screen.TwipsPerPixelX)
    ebr.Width = ebr.Width + (16 * Screen.TwipsPerPixelX)
  End If
  ClassicWidth = FullWidth - ebr.Width - 10
  HandleClassicMode
  
  xfile = GetSetting("XML File")
  If Trim(xfile) = "" Then xfile = "sappy.xml"
  ChDir App.Path
  If Dir(App.Path & "\" & xfile) = "" Then
    Trace "- Oh shit..."
    If MsgBox(Replace(LoadResString(204), "$XML", xfile), vbYesNo) = vbYes Then
      Open xfile For Output As #4
      Print #4, "<sappy xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" xsi:noNamespaceSchemaLocation=""http://helmetedrodent.kickassgamers.com/sappy.xsd"">"
      Print #4, "</sappy>"
      Close #4
    Else
      End
    End If
  End If
  xfile = App.Path & "\" & xfile
      
  Trace "- Localize"
  SetCaptions Me
  Caption = LoadResString(0)
  lblPC.FontSize = 7
  lblDel.FontSize = 7
  lblNote.FontSize = 7
  linProgress.x2 = -1
  
  Trace "- Attach messages"
  AttachMessage Me, hwnd, WM_SIZING
  AttachMessage Me, hwnd, WM_APPCOMMAND
  AttachMessage Me, hwnd, WM_MOUSEWHEEL
  
  Trace "- Load tool pics"
  Dim stdPic As New StdPicture
  Set imlImages = New cVBALImageList
  With imlImages 'vbalImages
    .OwnerHDC = Me.hdc
    .ColourDepth = ILC_COLOR8
    .IconSizeX = 16
    .IconSizeY = 16
    .Create
    
    Set stdPic = LoadResPicture("TOOLICONS", vbResBitmap)
    .AddFromHandle stdPic.Handle, IMAGE_BITMAP, , &HFF00FF
    cmdPrevSong.Picture = .ItemPicture(16)
    cmdNextSong.Picture = .ItemPicture(17)
    cmdStop.Picture = .ItemPicture(18)
    cmdPlay.Picture = .ItemPicture(19)
  End With
  Trace "- Load status pics"
  Set imlStatusbar = New cVBALImageList
  With imlStatusbar 'vbalStatusBar
    .OwnerHDC = Me.hdc
    .ColourDepth = ILC_COLOR8
    .IconSizeX = 16
    .IconSizeY = 16
    .Create
    
    Set stdPic = LoadResPicture("STATUSICONS", vbResBitmap)
    .AddFromHandle stdPic.Handle, IMAGE_BITMAP, , &HFF00FF
  End With
  
  Trace "- Create status bar"
  Set cStatusBar = New cNoStatusBar
  With cStatusBar
    .Create picStatusbar
    .ImageList = imlStatusbar.hIml
    .AllowXPStyles = True
    Set .Font = lblSong.Font
  End With
  FixStatusBar
  
  Trace "- Create menu"
  With cPop
    .SubClassMenu Me
    If GetSettingI("Nice Menus") = 0 Then
      '.HighlightStyle =
      .OfficeXpStyle = False
    Else
      .OfficeXpStyle = True
    End If

    Trace "- Set menu icons and help"
    .ImageList = imlImages.hIml
    .ItemIcon("mnuFileOpen") = 0
    .ItemIcon("mnuOutput(0)") = 2
    .ItemIcon("mnuOutput(1)") = 3
    .ItemIcon("mnuSeekPlaylist") = 4
    '.ItemIcon("mnuAutovance") = 5
    .ItemIcon("mnuGBMode") = 6
    .ItemIcon("mnuHelpHelp") = 7
    .ItemIcon("mnuHelpOnline") = 8
    .ItemIcon("mnuImportLST") = 20
    .ItemIcon("mnuSelectMIDI") = 22
    .ItemIcon("mnuMidiMap") = 23
    .HelpText("mnuFileOpen") = LoadResString(70)
    .HelpText("mnuFileExit") = LoadResString(71)
    .HelpText("mnuOutput(0)") = LoadResString(72)
    .HelpText("mnuOutput(1)") = LoadResString(73)
    .HelpText("mnuHelpAbout") = LoadResString(75)
    .HelpText("mnuHelpOnline") = LoadResString(76)
  End With
  
  'Not setting any images for Japanese systems until further notice.
  If LoadResString(10000) <> "<JAPPLZ>" Then
    cbxSongs.ImageList = imlImages
  End If
  
  Trace "- Skinning"
  Dim hue As Single, sat As Single, skinno As Integer
  skinno = GetSettingI("Skin")
  'If regset <> "" Then skinno = Val(regset) Else skinno = 0
  picSkin.Picture = LoadResPicture(100 + skinno, vbResBitmap)
  regset = GetSetting("Skin Hue")
  If regset <> "" Then hue = Val(Replace(regset, ",", ".")) Else hue = 3.5
  regset = GetSetting("Skin Saturation")
  If regset <> "" Then sat = Val(Replace(regset, ",", ".")) Else sat = 0.4
  Colorize picSkin, hue, sat
  
  Dim woogy As Control
  For Each woogy In Me.Controls
    If TypeName(woogy) = "CommandButton" Then
      woogy.MousePointer = 99
      woogy.MouseIcon = LoadResPicture("HAND", vbResCursor)
    End If
  Next woogy
  
  Trace "- Set up task bar"
  With ebr
    .BackColorStart = picSkin.point(6, 16)
    .BackColorEnd = picSkin.point(6, 32)
    .UseExplorerStyle = IIf(GetSettingI("Force Nice Bar"), False, True)
    .Bars.Add , "Tasks", LoadResString(50)
    .ImageList = imlImages.hIml
    With .Bars("Tasks")
      .CanExpand = False
      .State = eBarCollapsed
      Trace "- Add tasks"
      .Items.Add , "taketrax", LoadResString(52), 9
      .Items.Add , "maketrax", LoadResString(53), 10
      .Items.Add , "takesamp", LoadResString(54), 11
      .Items.Add , "codetrax", LoadResString(55), 12
      .Items.Add , "makemidi", LoadResString(51), 2
      .Items("taketrax").ToolTipText = LoadResString(81)
      .Items("maketrax").ToolTipText = LoadResString(82)
      .Items("takesamp").ToolTipText = LoadResString(83)
      .Items("codetrax").ToolTipText = LoadResString(84)
      .Items("makemidi").ToolTipText = LoadResString(80)
      For i = 1 To .Items.count
        TaskMenus(i) = cPop.AddItem(.Items(i).Text, .Items(i).Key, .Items(i).ToolTipText, , cPop.MenuIndex("mnuTasks"), .Items(i).IconIndex, False, False)
      Next i
      .State = GetSettingI("Bar " & .Index & " state")
    End With
    Trace "- Set up info bar"
    .Bars.Add , "Info", LoadResString(60)
    With .Bars("Info")
      .CanExpand = False
      .State = eBarCollapsed
      .Items.Add , "Game", LoadResString(61), , 0
      .Items.Add , "Code", LoadResString(62), , 1
      .Items.Add , "Creator", LoadResString(63), , 0
      .Items.Add , "Tagger", LoadResString(64), , 0
      .Items.Add , "SongTbl", "0x000000", , 1
      .Items.Add , "Screen", , , 2
      .Items("Game").Bold = True
      .Items("SongTbl").SpacingAfter = 8
      .Items("Screen").Control = picScreenshot
      .Items("Screen").SpacingAfter = 6
      .State = GetSettingI("Bar " & .Index & " state")
    End With
  End With
    
  Trace "- Create channel views"
  For i = 1 To 32
    Load cvwChannel(i)
    cvwChannel(i).tOp = cvwChannel(i - 1).tOp + cvwChannel(i - 1).Height
    cvwChannel(i).volume = 0
    cvwChannel(i).pan = 0
    cvwChannel(i).Visible = False
  Next i
    
'  Trace "- Load XML"
'  Set x = New DOMDocument26
'  x.Load xfile
'  x.preserveWhiteSpace = True
'  If x.parseError.errorcode <> 0 Then
'     MsgBox Replace(Replace(LoadResString(208), "$ERROR", x.parseError.reason), "$CAUSE", x.parseError.srcText)
'     End
'  End If
'  For Each blah In x.childNodes
'    If blah.baseName = "sappy" Then
'      Set rootNode = blah
'      Exit For
'    End If
'  Next
  
  Trace "- Finalizing"
  'VolumeSlider1.SetValue 50
  
  If midiOutGetNumDevs = 0 Then 'got no midi
    mnuOutput(0).Enabled = False
    mnuOutput(1).Checked = True
  End If
  
  picScreenshot.Picture = LoadResPicture("NOPIC", vbResBitmap)
  
  On Error Resume Next
  Trace "- Handle startup rom"
  i = GetSettingI("Reload ROM")
  On Error GoTo 0
  If Command <> "" Then
    myFile = Replace(Command, """", "")
    mnuFileOpen.Tag = "BrotherMaynard"
    Trace "- Gonna open (argument)"
    mnuFileOpen_Click
    Exit Sub
  End If
  
  If i = 1 Then
    myFile = Replace(GetSetting("Last ROM"), """", "")
    If Dir(myFile) = "" Then myFile = ""
    If myFile <> "" Then
      mnuFileOpen.Tag = "BrotherMaynard"
      Trace "- Gonna open (reloader)"
      mnuFileOpen_Click
    End If
  End If
    
  Trace "- Done loadin'"
  'frmMidiMapper.Show 1, Me
  'frmSelectMidiOut.Show 1
  
  frmAbout.Show 1
End Sub

Private Sub Form_Resize()
  If WindowState = 1 Then Exit Sub
  picChannels.Height = ScaleHeight - picChannels.tOp - picStatusbar.Height
End Sub

Private Sub Form_Unload(Cancel As Integer)
  Dim i As Integer
  On Error Resume Next
  Trace "- Form_Unload() ENGAGE!"
  Trace "- Calling SappyDecoder.StopSong"
  SappyDecoder.StopSong
  Trace "- Calling ShutMSN"
  ShutMSN
  Trace "- Terminating SappyDecoder"
  Set SappyDecoder = Nothing
  Trace "- Killing menu subclass"
  cPop.UnsubclassMenu
  Close #99
  Trace "- Saving window height"
  WriteSettingI "Window Height", Height
  If GetSettingI("mIRC Now Playing") Then
    Trace "- Updating mIRC information"
    Open "sappy.stt" For Output As #42
    Print #42, App.Major & "." & App.Minor & "| | | |Not running|"
    Close #42
  End If
  Trace "- Detaching messages"
  DetachMessage Me, hwnd, WM_SIZING
  DetachMessage Me, hwnd, WM_APPCOMMAND
  DetachMessage Me, hwnd, WM_MOUSEWHEEL
  On Error GoTo 0
  Trace "- Killing forms"
  If Forms.count > 1 Then
    Dim Form As Form
    For Each Form In Forms
      Trace "- ..." & Form.name
      Unload Form
    Next
  End If
  Trace "- Will I dream?"
End Sub

Private Property Let ISubclass_MsgResponse(ByVal RHS As SSubTimer6.EMsgResponse)
  'This property procedure must exist to properly implement
  'the Subclassing Assistant, even though it does nothing.
End Property

Private Property Get ISubclass_MsgResponse() As SSubTimer6.EMsgResponse
  ISubclass_MsgResponse = emrPostProcess
End Property

Private Function ISubclass_WindowProc(ByVal hwnd As Long, ByVal iMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
  
  If iMsg = WM_SIZING Then
    Dim myRect As RECT
    CopyMemory myRect, ByVal lParam, LenB(myRect) 'get the Rect pointed to in lParam
    myRect.Right = myRect.left + mywidth 'fix width
    If myRect.Bottom - myRect.tOp < 280 Then myRect.Bottom = myRect.tOp + 280 'limit height
    CopyMemory ByVal lParam, myRect, LenB(myRect) 'put our edited Rect back in lParam
  End If
  
  If iMsg = WM_APPCOMMAND Then
    'Okay... debug shows that the AppCommand's actual "command" code is in the first byte.
    'Since our track control buttons don't go over 0xF, we can't go over 0xF0000...
    If lParam <= &HF0000 Then '...so first we ensure that part...
      Select Case Val("&H" & left(Hex(lParam), 1)) '...then cut out and evaluate the first nibble.
        Case APPCOMMAND_MEDIA_NEXTTRACK: cmdNextSong.value = True
        Case APPCOMMAND_MEDIA_PREVIOUSTRACK: cmdPrevSong.value = True
        Case APPCOMMAND_MEDIA_PLAY_PAUSE: cmdPlay.value = True
        Case APPCOMMAND_MEDIA_STOP: cmdStop.value = True
        Case APPCOMMAND_VOLUME_DOWN: VolumeSlider1.SetValue VolumeSlider1.GetValue() - 5
        Case APPCOMMAND_VOLUME_UP: VolumeSlider1.SetValue VolumeSlider1.GetValue() + 5
        'Case Else: Trace "Got an unhandled AppCommand: 0x" & Hex(lParam)
      End Select
    End If
    'TODO: Figure out how to "eat" the message, so pressing Play won't trigger background players.
  End If
  
  If iMsg = WM_MOUSEWHEEL Then
    If wParam < 0 Then
      VolumeSlider1.SetValue VolumeSlider1.GetValue() - 5
    ElseIf wParam > 0 Then
      VolumeSlider1.SetValue VolumeSlider1.GetValue() + 5
    End If
  End If
  
End Function

Private Sub lblExpand_Click()
  If lblExpand.Caption = "6" Then
    lblExpand.Caption = "5"
  Else
    lblExpand.Caption = "6"
  End If
  Dim i As Integer
  For i = 0 To cvwChannel.count - 1
    cvwChannel(i).Expand (lblExpand.Caption = "5")
  Next i
  For i = 1 To cvwChannel.count - 1
    cvwChannel(i).tOp = cvwChannel(i - 1).tOp + cvwChannel(i - 1).Height
  Next i
End Sub

Private Sub mnuAutovance_Click()
  mnuAutovance.Checked = Not mnuAutovance.Checked
  WriteSettingI "AutoAdvance", mnuAutovance.Checked
End Sub

Private Sub mnuFileExit_Click()
  Unload Me
End Sub

Private Sub mnuFileOpen_Click()
  Dim cc As New gCommonDialog
  Dim i As Integer
  Dim code As String * 4
  
  If mnuFileOpen.Tag = "BrotherMaynard" Then GoTo skipABit
  If cc.VBGetOpenFileName(myFile, , , , , , LoadResString(2) & "|*.gba") = False Then Exit Sub
  
skipABit:
  Close #99
  
  SongTbl = 0
  ebr.Bars("Tasks").CanExpand = False
  'ebr.Bars("Tasks").State = eBarCollapsed
  ebr.Bars("Info").CanExpand = False
  'ebr.Bars("Info").State = eBarCollapsed
  cbxSongs.Enabled = False
  cmdPrevSong.Enabled = False
  cmdNextSong.Enabled = False
  txtSong.Enabled = False
  chkMute.Enabled = False
  cmdPlay.Enabled = False
  cmdStop.Enabled = False
  For i = 1 To 5
    cPop.Enabled(TaskMenus(i)) = False
  Next i
  
  Open myFile For Binary As #99
  Get #99, &HAC + 1, code
  If Asc(Mid(code, 1, 1)) = 0 Then
    MsgBox LoadResString(209)
    Close #99
    Exit Sub
  End If
  DontLoadDude = True
  
  Dim axe As String
  If Dir(code & ".xml") <> "" Then axe = code & ".xml"
  If Dir(App.Path & "\" & code & ".xml") <> "" Then axe = App.Path & "\" & code & ".xml"
  LoadGameFromXML code, axe
  
  DontLoadDude = False
  gamecode = UCase(code)
  If SongTbl = 0 Then
    If left(gamecode, 3) = "AGS" Or left(gamecode, 3) = "AGF" Or left(gamecode, 3) = "BMG" Then
      'Autoscan don't like Golden Sun games :P
      MsgBox LoadResString(110), vbExclamation
      Close #99
      Exit Sub
    End If
    If MsgBox(Replace(LoadResString(205), "$CODE", gamecode), vbOKCancel + vbInformation) = vbCancel Then
      mnuFileOpen.Tag = ""
      Close #99
      Exit Sub
    End If
    cStatusBar.PanelText("simple") = LoadResString(105)
    FindMST
    cStatusBar.PanelText("simple") = ""
    If SongTbl = 0 Then 'still?
      MsgBox LoadResString(206)
      Close #99
      Exit Sub
    End If
    MsgBox Replace(LoadResString(207), "$TBL", Hex(SongTbl))
    SaveBareBonesGameToXML
    DontLoadDude = True
    LoadGameFromXML code
    DontLoadDude = False
  End If
  
  On Error Resume Next 'until we get the translations
  If axe <> "" Then cStatusBar.PanelText("simple") = LoadResString(111)
  On Error GoTo 0
  
  ebr.Bars("Tasks").CanExpand = True
  'ebr.Bars("Tasks").State = eBarExpanded
  ebr.Bars("Info").CanExpand = True
  'ebr.Bars("Info").State = eBarExpanded
  cbxSongs.Enabled = True
  cmdPrevSong.Enabled = True
  cmdNextSong.Enabled = True
  txtSong.Enabled = True
  chkMute.Enabled = True
  cmdPlay.Enabled = True
  cmdStop.Enabled = True
  txtSong = playlist(0).SongNo(0)
  LoadSong txtSong
  For i = 1 To 5
    cPop.Enabled(TaskMenus(i)) = True
  Next i
  
  mnuFileOpen.Tag = ""

  On Error Resume Next
  If GetSettingI("Reload ROM") Then
    WriteSetting "Last ROM", myFile
  End If
  
  DontLoadDude = False
  On Error GoTo 0
End Sub

Public Sub LoadSong(i As Integer)
  Dim l As Long
  Dim k As Long
  Dim m As Long
  Dim n As String

  On Error GoTo hell
  
  Get #99, SongTbl + (i * 8) + 1, l
  l = l - &H8000000
  SongHeadOrg = l
  Get #99, l + 1, SongHead
  
  For k = 0 To 32
    cvwChannel(k).Visible = False
  Next k
  
  For k = 0 To SongHead.NumTracks - 1
    cvwChannel(k).Visible = True
    cvwChannel(k).Location = SongHead.Tracks(k) - &H8000000
    cvwChannel(k).Note = "..."
    cvwChannel(k).Delay = 0
    cvwChannel(k).pan = 0
    cvwChannel(k).patch = 0
    cvwChannel(k).Velocity = 0
    cvwChannel(k).Vibrato = 0
    cvwChannel(k).volume = 0
  Next k
  
  lblDef = "0x" & FixHex(SongTbl + (i * 8), 6)
  lblLoc = "0x" & FixHex(SongHeadOrg, 6)
  lblInst = "0x" & FixHex(SongHead.VoiceGroup - &H8000000, 6)
  
  n = "?"
  lblSongName = Replace(LoadResString(106), "$INDEX", i)
  justthesongname = "Track " & i
  For k = 0 To NumPLs
    For l = 0 To playlist(k).NumSongs
      If playlist(k).SongNo(l) = i Then
        DontLoadDude = True
        n = playlist(k).SongName(l)
        justthesongname = n
        lblSongName = Replace(Replace(LoadResString(107), "$NAME", n), "$INDEX", i)
        For m = 0 To cbxSongs.ListCount - 1
          'If cbxSongs.List(m) = playlist(k).SongName(l) Then
          If cbxSongs.ItemData(m) = playlist(k).SongNo(l) Then
            cbxSongs.ListIndex = m
            DontLoadDude = False
            GoTo ExitForGood
          End If
        Next m
        DontLoadDude = False
      End If
    Next l
  Next k
ExitForGood:
  
  'Do mIRC string...
  Dim cc As New gCommonDialog
  songinfo = App.Major & "." & App.Minor & _
              "|" & cc.VBGetFileTitle(myFile) & _
              "|" & gamecode & _
              "|" & txtSong & _
              "|" & ebr.Bars("Info").Items("Game").Text & _
              "|" & n & IIf(SappyDecoder.outputtype = sotMIDI, " (midi)", "")
  
  If Playing = True Then
    cmdPlay_Click
  End If
 
hell:
End Sub

Public Sub LoadGameFromXML(gamecode As String, Optional ByVal newxfile As String = "")
  Dim n1 As IXMLDOMElement
  Dim n2 As IXMLDOMElement
  Dim n3 As IXMLDOMAttribute
  Dim n4 As IXMLDOMElement
  Dim s1 As IXMLDOMElement
  Dim s2 As IXMLDOMElement
  Dim s3 As IXMLDOMAttribute
  Dim s4 As IXMLDOMElement
  Dim i As Integer, j As Integer
  
  If newxfile = "" Then newxfile = xfile
  Trace "Loading from " & newxfile & "..."
  Set x = New DOMDocument26
  x.Load newxfile
  x.preserveWhiteSpace = True
  If x.parseError.errorcode <> 0 Then
     MsgBox Replace(Replace(LoadResString(208), "$ERROR", x.parseError.reason), "$CAUSE", x.parseError.srcText)
     End
  End If
  For Each n1 In x.childNodes
    If n1.baseName = "sappy" Then
      Set rootNode = n1
      Exit For
    End If
  Next
   
  On Error Resume Next
  ebr.Bars("Info").Items("Code").Text = LoadResString(61)
  ebr.Bars("Info").Items("Game").Text = LoadResString(62)
  ebr.Bars("Info").Items("Creator").Text = LoadResString(63)
  ebr.Bars("Info").Items("Tagger").Text = LoadResString(64)
  ebr.Bars("Info").Items("SongTbl").Text = "0x000000"
  'Set picScreenshot.Picture = Nothing
  picScreenshot.Picture = LoadResPicture("NOPIC", vbResBitmap)
  cbxSongs.Clear
  For j = 0 To 255
    For i = 0 To 1024
      playlist(j).SongName(i) = ""
      playlist(j).SongNo(i) = 0
    Next i
    playlist(0).NumSongs = 0
  Next j
  playlist(0).NumSongs = 1
  playlist(0).SongName(0) = LoadResString(109)
  playlist(0).SongNo(0) = 1
  NumPLs = 1
  For i = 0 To 127
    MidiMap(i) = i
    MidiMapTrans(i) = 0
    DrumMap(i) = i
    BleedingEars(i) = -1
  Next i
  BECnt = 0
  Set MidiMapNode = Nothing
  Set MidiMapsDaddy = Nothing
  For Each n1 In rootNode.childNodes
    If n1.baseName = "rom" Then
      NumPLs = 0
      For Each n3 In n1.Attributes
        If n3.baseName = "code" Then
          If LCase(n3.value) <> LCase(gamecode) Then
            GoTo BrotherMaynard
          End If
          ebr.Bars("Info").Items("Code").Text = "Gamecode " & UCase(n3.Text)
          gamecode = UCase(n3.Text)
        End If
        If n3.baseName = "name" Then
          ebr.Bars("Info").Items("Game").Text = n3.Text
        End If
        If n3.baseName = "creator" Then
          ebr.Bars("Info").Items("Creator").Text = LoadResString(65) & n3.Text
        End If
        If n3.baseName = "tagger" Then
          ebr.Bars("Info").Items("Tagger").Text = LoadResString(66) & n3.Text
        End If
        If n3.baseName = "songtable" Then
          SongTbl = Val("&H" & FixHex(n3.Text, 6))
          If Val("&H" & FixHex(n3.Text, 6)) <> Val("&H" & FixHex(n3.Text, 6) & "&") Then
            MsgBox "Song pointer in an unsupported location. " & Hex(Val("&H" & FixHex(n3.Text, 6) & "&")) & " is read as " & Hex(Val("&H" & FixHex(n3.Text, 6))) & "."
            Exit Sub
          End If
          ebr.Bars("Info").Items("SongTbl").Text = LoadResString(67) & "0x" & Hex(SongTbl)
        End If
        If n3.baseName = "screenshot" Then
          On Error Resume Next
          picScreenshot.Tag = n3.value
          picScreenshot.Picture = LoadPicture(n3.value)
          On Error GoTo 0
        End If
      Next
      
      On Error GoTo BrotherMaynard
      Set MidiMapsDaddy = n1
      For Each n2 In n1.childNodes
        If n2.baseName = "playlist" Then
          If n2.getAttribute("steal") <> "" Then
            cbxSongs.AddItemAndData n2.getAttribute("name"), 13, 13, 9999
            playlist(NumPLs).NumSongs = 0
            For Each s1 In rootNode.childNodes
              If s1.baseName = "rom" And s1.getAttribute("code") = n2.getAttribute("steal") Then
                For Each s2 In s1.childNodes
                  If s2.baseName = "playlist" And s2.getAttribute("name") = n2.getAttribute("name") Then
                    For Each s4 In s2.childNodes
                      If s4.baseName = "song" Then
                        playlist(NumPLs).SongName(playlist(NumPLs).NumSongs) = s4.Text
                        playlist(NumPLs).SongNo(playlist(NumPLs).NumSongs) = Val("&H" & FixHex(s4.getAttribute("track"), 4))
                        playlist(NumPLs).NumSongs = playlist(NumPLs).NumSongs + 1
                        cbxSongs.AddItemAndData s4.Text, 14, 14, Val("&H" & FixHex(s4.getAttribute("track"), 4)), 1
                      End If 'stealing song
                    Next 'stealing playlist children
                    GoTo StolenIt
                  End If 'stealing playlist
                Next 'stealing rom children
                MsgBox "Couldn't find playlist """ & n2.getAttribute("name") & """ for gamecode """ & n2.getAttribute("steal") & """."
              End If 'stealing rom
            Next 'stealing library
            NumPLs = NumPLs + 1
          Else
            cbxSongs.AddItemAndData n2.getAttribute("name"), 13, 13, 9999
            playlist(NumPLs).NumSongs = 0
            For Each n4 In n2.childNodes
              If n4.baseName = "song" Then
                playlist(NumPLs).SongName(playlist(NumPLs).NumSongs) = n4.Text
                playlist(NumPLs).SongNo(playlist(NumPLs).NumSongs) = Val("&H" & FixHex(n4.getAttribute("track"), 4))
                playlist(NumPLs).NumSongs = playlist(NumPLs).NumSongs + 1
                cbxSongs.AddItemAndData n4.Text, 14, 14, Val("&H" & FixHex(n4.getAttribute("track"), 4)), 1
              End If 'song
            Next 'playlist songs
            NumPLs = NumPLs + 1
          End If 'stealing check
        End If 'playlist
        On Error Resume Next

StolenIt:
        'We could get other tags here, like MidiMap.
        If n2.baseName = "midimap" Then
          Set MidiMapNode = n2
          For Each n4 In n2.childNodes
            If n4.baseName = "inst" Then
              i = n4.getAttribute("from")
              MidiMap(i) = n4.getAttribute("to")
              On Error Resume Next
              MidiMapTrans(i) = n4.getAttribute("transpose")
              On Error GoTo 0
            End If 'inst
          Next 'midimap children
        End If 'midimap
        
        If n2.baseName = "bleedingears" Then
          For Each n4 In n2.childNodes
            If n4.baseName = "inst" Then
              For Each n3 In n4.Attributes
                If n3.baseName = "id" Then
                  BleedingEars(BECnt) = n3.value
                  BECnt = BECnt + 1
                End If
                If n3.baseName = "from" Then
                  For i = n3.value To n4.getAttribute("to")
                    BleedingEars(BECnt) = i
                    BECnt = BECnt + 1
                  Next i
                End If
              Next
              'i = n4.getAttribute("id")
              'BleedingEars(BECnt) = i
              'BECnt = BECnt + 1
            End If 'inst
          Next 'bleedingears children
        End If 'bleedingears
        
      Next 'rom children
      On Error GoTo 0
    End If
BrotherMaynard:
  Next
  If cbxSongs.ListCount = 0 Then cbxSongs.AddItemAndData "No songs defined", 1, 1, 1
  cbxSongs.ListIndex = 0
End Sub

Private Sub SaveBareBonesGameToXML()
  Dim n1 As IXMLDOMElement
  Dim n2 As IXMLDOMComment
  Dim n3 As IXMLDOMElement
  Dim n4 As IXMLDOMAttribute
  Dim gamename As String * 12
  Get #99, &HA1, gamename
  Set n1 = x.createElement("rom")
  
  n1.setAttribute "code", gamecode
  n1.setAttribute "name", gamename
  n1.setAttribute "songtable", "0x" & Hex(SongTbl) 'FixHex(SongTbl, 6)
  
  Set n3 = x.createElement("playlist")
  Set n4 = x.createAttribute("name")
  n4.Text = "Main"
  n3.Attributes.setNamedItem n4
  n1.appendChild n3

  rootNode.insertBefore n1, Null
  x.save xfile
End Sub

Private Sub SaveNewRomHeader(att As String, nV As String)
  Dim n1 As IXMLDOMElement
  Dim axe As String
  
  axe = xfile
  If Dir(gamecode & ".xml") <> "" Then axe = gamecode & ".xml"
  If Dir(App.Path & "\" & gamecode & ".xml") <> "" Then axe = App.Path & "\" & gamecode & ".xml"
  Trace "Saving to " & axe & "..."
  Set x = New DOMDocument26
  x.Load axe
  x.preserveWhiteSpace = True
  If x.parseError.errorcode <> 0 Then
     MsgBox Replace(Replace(LoadResString(208), "$ERROR", x.parseError.reason), "$CAUSE", x.parseError.srcText)
     End
  End If
  For Each n1 In x.childNodes
    If n1.baseName = "sappy" Then
      Set rootNode = n1
      Exit For
    End If
  Next
  
  
  For Each n1 In rootNode.childNodes
    If n1.baseName = "rom" And n1.getAttribute("code") = gamecode Then
      n1.setAttribute att, nV
    End If
  Next
  x.save axe
End Sub

Private Sub FindMST()
  'Thumbcode to find:
  '400B 4018 8388 5900 C918 8900 8918 0A68 0168 101C 00F0 ---- 01BC 0047 MPlayTBL SongTBL
  Dim anArm As Long
  Dim aPointer As Long
  Dim off As Long
  Dim match As Integer
  MousePointer = 11
  Seek #99, 1
  Do
    Get #99, , anArm
    If match = 0 Then
      If anArm = &H18400B40 Then match = 1 Else match = 0
    ElseIf match = 1 Then
      If anArm = &H598883 Then match = 2 Else match = 0
    ElseIf match = 2 Then
      If anArm = &H8918C9 Then match = 3 Else match = 0
    ElseIf match = 3 Then
      If anArm = &H680A1889 Then match = 4 Else match = 0
    ElseIf match = 4 Then
      If anArm = &H1C106801 Then match = 5 Else match = 0
    ElseIf match = 5 Then
      'skip over the jump
      match = 6
    ElseIf match = 6 Then
      If anArm = &H4700BC01 Then
        match = 7
        off = Seek(99)
      Else
        match = 0
      End If
    End If
    If match = 7 Then 'mPlayTBL
      Seek #99, off
      Get #99, , aPointer
      Get #99, , aPointer
      SongTbl = aPointer - &H8000000
      MousePointer = 0
      Exit Sub
    End If
    DoEvents
  Loop Until EOF(99)
  MousePointer = 0
End Sub

Private Sub mnuGBMode_Click()
  mnuGBMode.Checked = Not mnuGBMode.Checked
  WriteSettingI "MIDI In GB Mode", mnuGBMode.Checked
End Sub

Private Sub mnuHelpAbout_Click()
  frmAbout.Show 1
End Sub

Private Sub mnuHelpHelp_Click()
  ShellExecute 0, vbNullString, App.Path & "\sappy.chm", vbNullString, "", 1
End Sub

Private Sub mnuHelpOnline_Click()
  ShellExecute 0, vbNullString, "http://helmetedrodent.kickassgamers.com", vbNullString, "", 1
End Sub

Private Sub mnuImportLST_Click()
  Dim cc As New gCommonDialog
  Dim myFile As String
  Dim myDir As String
  Dim C As String
  Dim n As String
  Dim E As String
  Dim p As String
  Dim m As String
  Dim S As String
  Dim F As String
  Dim l As String
  Dim y As String
  Dim myNewRom As IXMLDOMElement
  Dim myNewList As IXMLDOMElement
  Dim myNewSong As IXMLDOMElement
  Dim oldRom As IXMLDOMElement
  Dim blah As VbMsgBoxResult
  
  If cc.VBGetOpenFileName(myFile, , , , , , "Sappy.LST|sappy.lst") = False Then Exit Sub
  myDir = left(myFile, Len(myFile) - Len(cc.VBGetFileTitle(myFile)))
  
  x.save left(xfile, Len(xfile) - 3) & "bak"
  
  Open myFile For Input As #96
  Do
    Input #96, C 'code
    If C = "ENDFILE" Then Exit Do
    Input #96, n 'name
    Input #96, E 'engine
    Input #96, p 'playlist
    Input #96, m 'map
    Input #96, S 'songlist
    Input #96, F 'first
    Input #96, l 'last
    If C <> "****" And Right(C, 1) <> "ÿ" Then
      If E = "sapphire" Then
        Set myNewRom = x.createElement("rom")
        myNewRom.setAttribute "code", C '181205 update: OOPS!
        myNewRom.setAttribute "name", n
        myNewRom.setAttribute "songtable", "0x" & Hex(S) & ""
        If p = "blank" Then
          Set myNewList = x.createElement("playlist")
          myNewList.setAttribute "name", "No playlist"
          myNewRom.appendChild myNewList
        Else
          If Dir(myDir & p & ".lst") = "" Then
            Set myNewList = x.createElement("playlist")
            myNewList.setAttribute "name", "404"
            myNewRom.appendChild myNewList
          Else
            Open myDir & p & ".lst" For Input As #95
            Do
              Line Input #95, y
              If y = "ENDFILE" Then Exit Do
              Set myNewList = x.createElement("playlist")
              myNewList.setAttribute "name", y
              Do
                Line Input #95, y
                If y <> "ENDFILE" Then
                  If y <> "END" Then
                    Set myNewSong = x.createElement("song")
                    myNewSong.setAttribute "track", Val("&H" & left(y, 4))
                    myNewSong.Text = Mid(y, 6)
                    myNewList.appendChild myNewSong
                  End If
                End If
              Loop Until y = "END"
              myNewRom.appendChild myNewList
            Loop
            Close #95
          End If
        End If
        rootNode.appendChild myNewRom
      End If
    End If
SkipThisShit:
  Loop
  x.save xfile
  Close #96
  IncessantNoises "TaskComplete"
  
  LoadGameFromXML gamecode
End Sub

Private Sub mnuMidiMap_Click()
  frmMidiMapper.Show 1, Me
End Sub

Private Sub mnuOutput_Click(Index As Integer)
  If Index = 0 Then
    mnuOutput(0).Checked = True
    mnuOutput(1).Checked = False
    WriteSetting "Driver", "MIDI"
  Else
    mnuOutput(0).Checked = False
    mnuOutput(1).Checked = True
    WriteSetting "Driver", "FMOD"
  End If
  mnuGBMode.Enabled = mnuOutput(0).Checked
End Sub

Private Sub mnuSeekPlaylist_Click()
  mnuSeekPlaylist.Checked = Not mnuSeekPlaylist.Checked
  WriteSettingI "Seek by Playlist", mnuSeekPlaylist.Checked
End Sub

Private Sub mnuSelectMIDI_Click()
  frmSelectMidiOut.Show 1
End Sub

Private Sub mnuSettings_Click()
  frmOptions.Show 1
End Sub

Private Sub picChannels_Paint()
  'StretchBlt picChannels.hdc, 0, 0, picChannels.ScaleWidth, 17, picSkin.hdc, 6, 16, 2, 17, vbSrcCopy
End Sub

Private Sub picScreenshot_DblClick()
  Dim cc As New gCommonDialog
  Dim S As String
  S = picScreenshot.Tag
  If cc.VBGetOpenFileName(S, , , , , , LoadResString(1) & "|*.BMP;*.GIF;*.JPG") = True Then
    S = cc.VBGetFileTitle(S)
    picScreenshot.Picture = LoadPicture(S)
    picScreenshot.Tag = S
    SaveNewRomHeader "screenshot", S
  End If
End Sub

Private Sub picStatusbar_DblClick()
  If picStatusbar.Tag >= 402 And picStatusbar.Tag <= 436 Then
    frmOptions.Tag = "repsplz"
    frmOptions.Show 1
  End If
End Sub

Private Sub picStatusbar_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
  picStatusbar.Tag = x + IIf(ebr.Visible = False, ebr.Width, 0)
End Sub

Private Sub picStatusBar_Paint()
  cStatusBar.Draw
End Sub

Private Sub picTop_Paint()
  RedrawSkin
End Sub

Private Sub SappyDecoder_ChangedTempo(ByVal newtempo As Long)
  lblSpeed = SappyDecoder.Tempo
End Sub

Private Sub SappyDecoder_Loading(ByVal status As Integer, ByVal progress As Integer, ByVal total As Integer)
  cStatusBar.PanelText("simple") = LoadResString(8000 + status)
  If status = 1 Then cStatusBar.PanelText("simple") = cStatusBar.PanelText("simple") & " (" & progress & "/" & total & ")"
  'picStatusbar.Refresh
End Sub

Private Sub SappyDecoder_SongFinish()
  Playing = False
  timPlay.Enabled = False
  cmdPlay.Picture = imlImages.ItemPicture(19)
  mnuOutput(0).Enabled = True
  mnuOutput(1).Enabled = True
  mnuGBMode.Enabled = mnuOutput(0).Checked
  linProgress.x2 = -1
  ShutMSN
End Sub

Private Sub SappyDecoder_SongLoop()
  If loopsToGo = 0 Then Exit Sub
  loopsToGo = loopsToGo - 1
  If loopsToGo = 0 Then cmdStop_Click
End Sub

Private Sub SappyDecoder_UpdateDisplay()
  'Some of this from Drew's Sappy 2 interface.
  Dim C As Integer
  Dim ct As Long
  Dim ns As String
  Dim it As String
  Dim n As SNote
  
  For C = 1 To SappyDecoder.SappyChannels.count
    With SappyDecoder.SappyChannels(C)
      ct = 0
      ns = ""
      If .Notes.count > 0 Then
        For Each n In .Notes
          If SappyDecoder.GetNoteInfo(n.NoteID).Enabled = True And SappyDecoder.GetNoteInfo(n.NoteID).NoteOff = False Then
            ct = ct + ((SappyDecoder.GetNoteInfo(n.NoteID).Velocity / &H7F)) * (SappyDecoder.GetNoteInfo(n.NoteID).EnvPosition / &HFF) * &H7F
            ns = ns & NoteToName(SappyDecoder.GetNoteInfo(n.NoteID).NoteNumber) & " "
          End If
          Select Case SappyDecoder.GetNoteInfo(n.NoteID).outputtype
            Case notDirect: it = "Direct"
            Case notNoise: it = "Noise"
            Case notSquare1: it = "Square1"
            Case notSquare2: it = "Square2"
            Case notWave: it = "Wave"
            Case Else: it = ""
          End Select
        Next
        ct = ct / .Notes.count
      End If
      ct = ((ct / 127) * (.MainVolume / 127)) * 255
      cvwChannel(C - 1).Delay = .WaitTicks
      cvwChannel(C - 1).volume = ct
      cvwChannel(C - 1).pan = .Panning - 64
      cvwChannel(C - 1).patch = .PatchNumber
      cvwChannel(C - 1).Location = .TrackPointer + .ProgramCounter
      If ns <> "" Then cvwChannel(C - 1).Note = ns
      cvwChannel(C - 1).iType = it
      
    End With
  Next C
  
  Dim totallen As Long, totalplayed As Long, totalpercent As Long
  For C = 1 To SappyDecoder.SappyChannels.count
    With SappyDecoder.SappyChannels(C)
      totallen = totallen + .TrackLengthInBytes
      totalplayed = totalplayed + .ProgramCounter
    End With
  Next C
  totalpercent = (326 / totallen) * totalplayed
  linProgress.x2 = totalpercent
  'Caption = totalplayed & " / " & totallen & " -> " & totalpercent & "%"
  'Dim totalplayed As Long
  'With SappyDecoder.SappyChannels(1)
  '  tl = .TrackLengthInBytes - (.ProgramCounter + .TrackPointer)
  '  Caption = tl
  'End With

  cStatusBar.PanelText("crud") = loopsToGo
  cStatusBar.PanelText("time") = Right("00" & TotalMinutes, 2) & ":" & Right("00" & TotalSeconds, 2)
  cStatusBar.PanelText("frame") = SappyDecoder.TotalTicks
  
  Caption = SappyDecoder.Beats
  'picStatusbar.Refresh
End Sub

Private Sub timPlay_Timer()
  TotalSeconds = TotalSeconds + 1
  If TotalSeconds = 60 Then
    TotalMinutes = TotalMinutes + 1
    TotalSeconds = 0
  End If
End Sub

Private Sub txtSong_LostFocus()
  LoadSong Val(txtSong)
End Sub

Private Sub VolumeSlider1_Change(newValue As Integer)
  Dim VolumeScalar As Single
  VolumeScalar = 5.1
  SappyDecoder.GlobalVolume = newValue * VolumeScalar
  WriteSettingI "FMOD Volume", newValue
End Sub

Public Sub RedrawSkin()
  Dim panelRect As RECT
  ScaleMode = 3
  With panelRect
    .left = 0
    .tOp = 0
    .Right = picTop.Width
    .Bottom = picTop.Height
    BitBlt picTop.hdc, .left, .tOp, 2, 2, picSkin.hdc, 6, 0, vbSrcCopy
    StretchBlt picTop.hdc, .left + 2, .tOp, .Right - 4, 2, picSkin.hdc, 6, 2, 2, 2, vbSrcCopy
    BitBlt picTop.hdc, .left + .Right - 2, .tOp, 2, 2, picSkin.hdc, 6, 4, vbSrcCopy
    StretchBlt picTop.hdc, .left, .tOp + 2, 2, .Bottom - 4, picSkin.hdc, 6, 6, 2, 2, vbSrcCopy
    StretchBlt picTop.hdc, .left + 2, .tOp + 2, .Right - 4, .Bottom - 4, picSkin.hdc, 0, 0, 6, 62, vbSrcCopy
    StretchBlt picTop.hdc, .left + .Right - 2, .tOp + 2, 2, .Bottom - 4, picSkin.hdc, 6, 8, 2, 2, vbSrcCopy
    BitBlt picTop.hdc, .left, .tOp + .Bottom - 2, 2, 2, picSkin.hdc, 6, 10, vbSrcCopy
    StretchBlt picTop.hdc, .left + 2, .tOp + .Bottom - 2, .Right - 4, 2, picSkin.hdc, 6, 12, 2, 2, vbSrcCopy
    BitBlt picTop.hdc, .left + .Right - 2, .tOp + .Bottom - 2, 2, 2, picSkin.hdc, 6, 14, vbSrcCopy
  End With
  On Error Resume Next
  VolumeSlider1.BackColor = GetPixel(picSkin.hdc, 5, 42)
End Sub

Public Sub HandleClassicMode()
  If GetSettingI("Hide Bar") Then
    ebr.Visible = False
    Width = ClassicWidth
    ScaleMode = 3
    mywidth = Width / Screen.TwipsPerPixelX 'remember for wmSize subclass
    picTop.Move 0
    picChannels.Move 0
    ScaleMode = 1
    cbxSongs.Height = 330
  Else
    ebr.Visible = True
    Width = FullWidth
    ScaleMode = 3
    mywidth = Width / Screen.TwipsPerPixelX 'remember for wmSize subclass
    picTop.Move ebr.Width
    picChannels.Move ebr.Width
    ScaleMode = 1
    cbxSongs.Height = 330
  End If
End Sub

Public Sub FixStatusBar()
  With cStatusBar
    On Error Resume Next
    .RemovePanel "simple"
    .RemovePanel "frame"
    .RemovePanel "crud"
    .RemovePanel "time"
    On Error GoTo 0
    .AddPanel estbrNoBorders, "", , , True, , , "simple"
    .AddPanel estbrStandard, "0", , , False, , , "frame"
    .AddPanel estbrStandard, "0", 0, 24, False, , , "crud"
    .AddPanel estbrStandard, "00:00", 1, 32, False, , , "time"
  End With
  'picStatusbar.Refresh
End Sub

Private Sub PrepareRecording()
  Dim target As String
  Dim cc As New gCommonDialog
  If cc.VBGetSaveFileName(target, lblSongName & ".mid", , "Type 0 MIDI (*.mid)|*.mid", , , , "mid") = False Then Exit Sub
  WantToRecord = 1
  WantToRecordTo = target
  cmdPlay.value = True
  
'  Set HookedDialog = New cCommonDialog
'  With HookedDialog
'    .CancelError = False
'    .DefaultExt = "mid"
'    .DialogTitle = LoadResString(51)
'    .Filter = "Type 0 MIDI (*.mid)|*.mid"
'    .Filename = "Song " & txtSong & ".mid"
'    .flags = EOpenFile.OFN_EXPLORER Or EOpenFile.OFN_NOCHANGEDIR
'    .hwnd = Me.hwnd
'    .HookDialog = True
'    If InIDE() Then
'      .cdLoadLibrary App.Path & "\sappy.exe"
'    Else
'      .hInstance = App.hInstance
'    End If
'    .TemplateName = 42
'    .ShowSave
'    If InIDE() Then .cdFreeLibrary
'    If .Filename = "" Then Exit Sub
'    WantToRecordTo = .Filename
'  End With
'  WantToRecord = 1
'  cmdPlay.value = True
End Sub

'Private Property Get InIDE() As Boolean
'   ' debug.assert doesn't go when compiled:
'   Debug.Assert (InIDESub())
'   ' so this will return false
'   InIDE = m_bInIDE
'End Property
'Private Property Get InIDESub() As Boolean
'   m_bInIDE = True
'   InIDESub = True
'End Property
