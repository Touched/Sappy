VERSION 5.00
Begin VB.Form frmMakeTrax 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Import Tracks"
   ClientHeight    =   4080
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6240
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmMakeTrax.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   272
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   416
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox txtLog 
      BeginProperty Font 
         Name            =   "Lucida Console"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3255
      Left            =   120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   17
      Top             =   4080
      Visible         =   0   'False
      Width           =   6015
   End
   Begin VB.PictureBox Picture1 
      BackColor       =   &H80000018&
      BorderStyle     =   0  'None
      Height          =   1455
      Left            =   3240
      ScaleHeight     =   97
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   193
      TabIndex        =   11
      Top             =   1920
      Width           =   2895
      Begin VB.Label Label10 
         BackStyle       =   0  'Transparent
         Caption         =   "[2006]The second track will be saved right after the first track. Headers are copied."
         Height          =   1125
         Left            =   60
         TabIndex        =   13
         Top             =   270
         Width           =   2775
      End
      Begin VB.Label Label9 
         BackStyle       =   0  'Transparent
         Caption         =   "[2005]Track offsets"
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
         Left            =   60
         TabIndex        =   12
         Top             =   30
         Width           =   2775
      End
   End
   Begin VB.TextBox txtVoicegroup 
      Height          =   285
      Left            =   4800
      TabIndex        =   10
      Top             =   1560
      Width           =   1335
   End
   Begin VB.TextBox txtTrack 
      Height          =   285
      Left            =   4800
      TabIndex        =   8
      Top             =   1200
      Width           =   1335
   End
   Begin VB.TextBox txtHeaderOffset 
      Height          =   285
      Left            =   4800
      TabIndex        =   6
      Top             =   840
      Width           =   1335
   End
   Begin VB.ListBox lstTracks 
      Height          =   2535
      IntegralHeight  =   0   'False
      Left            =   120
      Sorted          =   -1  'True
      Style           =   1  'Checkbox
      TabIndex        =   2
      Top             =   840
      Width           =   2895
   End
   Begin VB.FileListBox File1 
      Height          =   870
      Left            =   1080
      TabIndex        =   16
      Top             =   1200
      Visible         =   0   'False
      Width           =   855
   End
   Begin Sappy2k6.SkinButton Command1 
      Cancel          =   -1  'True
      Height          =   375
      Left            =   4920
      TabIndex        =   15
      Top             =   3600
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
      Caption         =   "[5]Cancel"
   End
   Begin Sappy2k6.SkinButton Command2 
      CausesValidation=   0   'False
      Default         =   -1  'True
      Height          =   375
      Left            =   3600
      TabIndex        =   14
      Top             =   3600
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
      Caption         =   "[4]OK"
   End
   Begin VB.Label Label8 
      Caption         =   "[2016]Voicegroup"
      Height          =   255
      Left            =   3240
      TabIndex        =   9
      Top             =   1560
      Width           =   1335
   End
   Begin VB.Label Label6 
      Caption         =   "[2004]First track"
      Height          =   255
      Left            =   3240
      TabIndex        =   7
      Top             =   1200
      Width           =   1335
   End
   Begin VB.Label Label5 
      Caption         =   "[2003]Header"
      Height          =   255
      Left            =   3240
      TabIndex        =   5
      Top             =   840
      Width           =   1335
   End
   Begin VB.Label Label3 
      Caption         =   "[2002]Select where you want to save the tracks:"
      Height          =   615
      Left            =   3600
      TabIndex        =   4
      Top             =   120
      Width           =   2535
   End
   Begin VB.Label Label4 
      Caption         =   "2"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   15.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3240
      TabIndex        =   3
      Tag             =   "[NoLocal]"
      Top             =   120
      Width           =   255
   End
   Begin VB.Line Line1 
      BorderColor     =   &H80000010&
      X1              =   208
      X2              =   208
      Y1              =   8
      Y2              =   232
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000014&
      X1              =   209
      X2              =   209
      Y1              =   8
      Y2              =   231
   End
   Begin VB.Line Line4 
      BorderColor     =   &H80000014&
      X1              =   8
      X2              =   408
      Y1              =   232
      Y2              =   232
   End
   Begin VB.Line Line3 
      BorderColor     =   &H80000010&
      X1              =   8
      X2              =   408
      Y1              =   231
      Y2              =   231
   End
   Begin VB.Label Label1 
      Caption         =   "[2001]Select the tracks you want to import:"
      Height          =   615
      Left            =   480
      TabIndex        =   1
      Top             =   120
      Width           =   2535
   End
   Begin VB.Label Label2 
      Caption         =   "1"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   15.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Tag             =   "[NoLocal]"
      Top             =   120
      Width           =   255
   End
End
Attribute VB_Name = "frmMakeTrax"
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
'|  Track importer  |
'|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|
'| Code 100% by Kyoufu Kawa, based on old Juicer.     |
'| Last update: December 15th, 2005                   |
'|____________________________________________________|
'
'###########################################################################################

Option Explicit

Public MyNumblocks As Byte
Public MyPriority As Byte
Public MyReverb As Byte
Public MyVoiceGroup As Long
Public SongTableEntry As Long

Private Tracks(32) As Long

Private Sub Command1_Click()
  ClickSound
  Unload Me
End Sub

Private Sub Command2_Click()
  Dim t As String
  Dim i As Integer
  Dim j As Integer
  Dim p As Long
  ClickSound
  If lstTracks.SelCount = 0 Then
    MsgBox LoadResString(2007)
    Exit Sub
  End If
  If txtTrack = "" Then
    MsgBox LoadResString(2008)
    Exit Sub
  End If
  If txtHeaderOffset = "" Then
    MsgBox LoadResString(2009)
    Exit Sub
  End If
  
  txtLog.Top = 8
  txtLog.Visible = True
  Scribe LoadResString(2010)
  Scribe String(Len(LoadResString(2010)), "¯")
  j = 0
  For i = 0 To lstTracks.ListCount - 1
    If lstTracks.Selected(i) = True Then
      t = lstTracks.List(i)
      Scribe Replace(Replace(LoadResString(2011), "$FILE", t), "$TO", "0x" & Hex("&H" & FixHex(txtTrack, 6)))
      InsertTrack t, CLng(Val("&H" & Hex("&H" & FixHex(txtTrack, 6))))
      Tracks(j) = Val("&H" & Hex("&H" & FixHex(txtTrack, 6)))
      Open t For Binary As #3
      p = Val("&H" & Hex("&H" & FixHex(txtTrack, 6))) + LOF(3)
      txtTrack = "0x" & Hex(p)
      Close #3
      j = j + 1
    End If
  Next i
  Scribe LoadResString(2012)
  Seek #99, Val("&H" & Hex("&H" & FixHex(txtHeaderOffset, 6))) + 1
  Put #99, , CByte(lstTracks.SelCount)
  Put #99, , MyNumblocks
  Put #99, , MyPriority
  Put #99, , MyReverb
  Put #99, , CLng(Val("&H" & FixHex(txtVoicegroup, 6)) + &H8000000)
  For i = 0 To lstTracks.SelCount - 1
    Put #99, , Tracks(i) + &H8000000
  Next i
  If MsgBox(LoadResString(2013), vbYesNo) = vbYes Then
    Scribe "Updating song table..."
    p = Val("&H" & Hex("&H" & FixHex(txtHeaderOffset, 6)))
    p = p + &H8000000
    Put #99, SongTableEntry + 1, p
  End If
  Scribe LoadResString(7)
  Command2.Enabled = False
  'Command1.FontBold = False
  Command1.Caption = LoadResString(6)
  'Command1.FontBold = True
  Command1.Default = True
  frmSappy.LoadSong frmSappy.txtSong
  IncessantNoises "TaskComplete"
End Sub

Private Sub Form_Load()
  Dim i As Integer
  For i = 0 To File1.ListCount - 1
    lstTracks.AddItem File1.List(i)
  Next i
  SetCaptions Me
  Caption = LoadResString(2000)
End Sub

Private Sub InsertTrack(t As String, o As Long)
  Dim b As Byte
  Dim p As Long
  Seek #99, o + 1
  Open t For Binary As #98
  Do
    Get #98, , b
    Put #99, , b
    If b = &HB1 Then Exit Do
    If b = &HB2 Or b = &HB3 Or b = &HB5 Then
      'Scribe LoadResString(2014)
      If b = &HB5 Then
        Get #98, , b
        Put #99, , b
      End If
      Get #98, , p
      'Scribe Replace(Replace(LoadResString(2015), "$OLD", "0x" & FixHex(p, 8)), "$NEW", "0x" & FixHex(p + o, 6))
      p = p + &H8000000 + o
      Put #99, , p
    End If
    DoEvents
  Loop Until EOF(98)
  Close #98
End Sub

Private Sub Scribe(t As String)
  txtLog.Text = txtLog & t & vbCrLf
  txtLog.SelStart = Len(txtLog)
End Sub

Private Sub Picture1_Paint()
  DrawSkin Picture1
End Sub
