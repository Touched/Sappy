VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Sappy 2006 Sound Pack Installer"
   ClientHeight    =   3240
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5040
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "soundpack.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   216
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   336
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Register Now!"
      Height          =   375
      Left            =   2880
      TabIndex        =   0
      Top             =   2760
      Width           =   2055
   End
   Begin VB.Image Image1 
      Height          =   720
      Left            =   120
      Picture         =   "soundpack.frx":57E2
      Top             =   120
      Width           =   720
   End
   Begin VB.Label Label4 
      Caption         =   $"soundpack.frx":AFC4
      Height          =   615
      Left            =   120
      TabIndex        =   4
      Top             =   1800
      Width           =   4815
   End
   Begin VB.Label Label3 
      Caption         =   $"soundpack.frx":B071
      Height          =   855
      Left            =   120
      TabIndex        =   3
      Top             =   840
      Width           =   4815
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000014&
      X1              =   64
      X2              =   328
      Y1              =   48
      Y2              =   48
   End
   Begin VB.Line Line1 
      BorderColor     =   &H80000010&
      X1              =   64
      X2              =   328
      Y1              =   47
      Y2              =   47
   End
   Begin VB.Label Label2 
      Caption         =   "Because Kawa had nothing better to do."
      Height          =   255
      Left            =   960
      TabIndex        =   2
      Top             =   360
      Width           =   3975
   End
   Begin VB.Label Label1 
      Caption         =   "Sappy 2006 Sound Pack"
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
      Left            =   960
      TabIndex        =   1
      Top             =   120
      Width           =   3975
   End
End
Attribute VB_Name = "Form1"
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
' _______________________
'|  Soundpack installer  |
'|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|
'| Code 100% by Kyoufu Kawa.                          |
'| Last update: December 15th, 2005                   |
'|____________________________________________________|
'
'###########################################################################################

Private Declare Function WinExec Lib "kernel32.dll" (ByVal lpCmdLine As String, ByVal nCmdShow As Long) As Long

Private Type Sound
  Name As String
  Friend As String
End Type

Private Sounds(16) As Sound

Private Sub Command1_Click()
  For i = 0 To 2
    UpdateKey HKEY_CURRENT_USER, "AppEvents\EventLabels\Sappy2k5-" & Sounds(0).Name & "\", "", Sounds(0).Friend
    UpdateKey HKEY_CURRENT_USER, "AppEvents\Schemes\Apps\Sappy2k5\Sappy2k5-" & Sounds(0).Name & "\.Current\", "", ""
  Next i
  
  If MsgBox("All sound keys added." & vbCrLf & vbCrLf & "Would you like to open the Sound control panel now?", vbYesNo + vbInformation) = vbYes Then
    WinExec "control.exe mmsys.cpl", 1
  End If
  End
End Sub

Private Sub Form_Load()
  Sounds(0).Name = "ButtonClick"
  Sounds(0).Friend = "Button Click"
  Sounds(1).Name = "TaskComplete"
  Sounds(1).Friend = "Task Complete"
  Sounds(2).Name = "TaskFail"
  Sounds(2).Friend = "Task Failed"
End Sub
