VERSION 5.00
Begin VB.Form frmTakeTrax 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Export Tracks"
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
   Icon            =   "frmTakeTrax.frx":0000
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
      TabIndex        =   11
      Top             =   4080
      Visible         =   0   'False
      Width           =   6015
   End
   Begin VB.PictureBox Picture1 
      BackColor       =   &H80000018&
      BorderStyle     =   0  'None
      Height          =   2175
      Left            =   3240
      ScaleHeight     =   145
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   193
      TabIndex        =   6
      Top             =   1200
      Width           =   2895
      Begin VB.Label Label9 
         BackStyle       =   0  'Transparent
         Caption         =   "[7004]"
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
         TabIndex        =   7
         Top             =   30
         Width           =   2775
      End
      Begin VB.Label Label10 
         BackStyle       =   0  'Transparent
         Caption         =   "[3004]Any instance of $T is replaced by the current track's number. Likewise, $P is replaced by the track's base pointer."
         Height          =   1845
         Left            =   60
         TabIndex        =   8
         Top             =   270
         Width           =   2775
      End
   End
   Begin Sappy2k6.SkinButton Command2 
      CausesValidation=   0   'False
      Default         =   -1  'True
      Height          =   375
      Left            =   3600
      TabIndex        =   9
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
   Begin Sappy2k6.SkinButton Command1 
      Cancel          =   -1  'True
      Height          =   375
      Left            =   4920
      TabIndex        =   10
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
   Begin VB.TextBox txtFilename 
      Height          =   285
      Left            =   3240
      TabIndex        =   5
      Top             =   840
      Width           =   2895
   End
   Begin VB.ListBox lstTracks 
      Height          =   2535
      IntegralHeight  =   0   'False
      Left            =   120
      Style           =   1  'Checkbox
      TabIndex        =   2
      Top             =   840
      Width           =   2895
   End
   Begin VB.Line Line3 
      BorderColor     =   &H80000010&
      X1              =   8
      X2              =   408
      Y1              =   231
      Y2              =   231
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000014&
      X1              =   208
      X2              =   208
      Y1              =   8
      Y2              =   232
   End
   Begin VB.Line Line4 
      BorderColor     =   &H80000014&
      X1              =   8
      X2              =   408
      Y1              =   232
      Y2              =   232
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
   Begin VB.Label Label3 
      Caption         =   "[3002]Select where you want to save the tracks:"
      Height          =   615
      Left            =   3600
      TabIndex        =   4
      Top             =   120
      Width           =   2535
   End
   Begin VB.Line Line1 
      BorderColor     =   &H80000010&
      X1              =   207
      X2              =   207
      Y1              =   8
      Y2              =   232
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
   Begin VB.Label Label1 
      Caption         =   "[3001]Select the tracks you want to export:"
      Height          =   615
      Left            =   480
      TabIndex        =   1
      Top             =   120
      Width           =   2535
   End
End
Attribute VB_Name = "frmTakeTrax"
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
'|  Track exporter  |
'|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|
'| Code 100% by Kyoufu Kawa, based on Juicer.         |
'| Last update: February 1st, 2005                    |
'|____________________________________________________|
'
'###########################################################################################

Option Explicit

Private Sub Command1_Click()
  ClickSound
  Unload Me
End Sub

Private Sub Command2_Click()
  Dim i As Integer
  Dim t As String
  If lstTracks.SelCount = 0 Then
    MsgBox LoadResString(3005)
    IncessantNoises "TaskFail" 'Bee-owee-owee-oweeeeeohh....
    Exit Sub
  End If
  If txtFilename.Text = "" Then
    MsgBox LoadResString(3006)
    IncessantNoises "TaskFail" 'Bee-owee-owee-oweeeeeohh....
    Exit Sub
  End If
  
  txtFilename.Text = Replace(txtFilename.Text, "$t", "$T")
  txtFilename.Text = Replace(txtFilename.Text, "$p", "$P")
  i = 2
  If InStr(txtFilename.Text, "$T") Then i = i - 1
  If InStr(txtFilename.Text, "$P") Then i = i - 1
  If i = 2 Then
    MsgBox LoadResString(3011)
    IncessantNoises "TaskFail" 'Bee-owee-owee-oweeeeeohh....
    Exit Sub
  End If
  
  ClickSound
  
  txtLog.Top = 8
  txtLog.Visible = True
  Scribe LoadResString(3007)
  Scribe String(Len(LoadResString(3007)), "¯")
  For i = 0 To lstTracks.ListCount - 1
    If lstTracks.Selected(i) = True Then
      Scribe Replace(LoadResString(3008), "$TRACK", i)
      t = txtFilename.Text
      t = Replace(t, "$T", i)
      t = Replace(t, "$P", lstTracks.List(i))
      Scribe Replace(LoadResString(3009), "$FILE", t)
      DumpTrack Val("&H" & FixHex(lstTracks.List(i), 6)), t
    Else
      Scribe Replace(LoadResString(3010), "$TRACK", i)
    End If
  Next i
  Scribe LoadResString(7)
  Command2.Enabled = False
  'Command1.FontBold = False
  Command1.Caption = LoadResString(6)
  'Command1.FontBold = True
  Command1.Default = True
  IncessantNoises "TaskComplete"
  'Unload Me
End Sub

Private Sub Scribe(t As String)
  txtLog.Text = txtLog & t & vbCrLf
  txtLog.SelStart = Len(txtLog)
End Sub

Private Sub DumpTrack(o As Long, t As String)
  Dim b As Byte
  Dim p As Long
  Open t For Binary As #98
  Seek #99, o + 1
  Do
    Get #99, , b
    Put #98, , b
    If b = &HB1 Then 'fine
      'Scribe LoadResString(3012)
      Exit Do
    End If
    If b = &HB2 Or b = &HB3 Or b = &HB5 Then 'goto/patt/rept
      If b = &HB5 Then
        Get #99, , b 'num reps
        Put #98, , b
      End If
      Get #99, , p
      p = p - &H8000000 - o
      Put #98, , p
    End If
    DoEvents
  Loop Until EOF(98)
  Close #98
End Sub

Private Sub Form_Load()
  SetCaptions Me
  Caption = LoadResString(3000)
End Sub

Private Sub Picture1_Paint()
  DrawSkin Picture1
End Sub
