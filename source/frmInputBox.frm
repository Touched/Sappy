VERSION 5.00
Begin VB.Form frmInputBox 
   BorderStyle     =   0  'None
   ClientHeight    =   1560
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4680
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmInputBox.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   104
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   312
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   120
      TabIndex        =   1
      Text            =   "baz"
      Top             =   600
      Width           =   4455
   End
   Begin Sappy2k6.SkinButton Command1 
      Cancel          =   -1  'True
      Height          =   375
      Left            =   3360
      TabIndex        =   3
      Top             =   1080
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
      Left            =   2040
      TabIndex        =   2
      Top             =   1080
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
   Begin VB.Line Line3 
      BorderColor     =   &H80000010&
      X1              =   8
      X2              =   304
      Y1              =   64
      Y2              =   64
   End
   Begin VB.Line Line4 
      BorderColor     =   &H80000014&
      X1              =   8
      X2              =   304
      Y1              =   65
      Y2              =   65
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "bar"
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   120
      UseMnemonic     =   0   'False
      Width           =   4455
   End
End
Attribute VB_Name = "frmInputBox"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Declare Function ReleaseCapture Lib "user32.dll" () As Long
Private Declare Function SendMessage Lib "user32.dll" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByRef lParam As Any) As Long
Private Const WM_NCLBUTTONDOWN As Long = &HA1
Private Const HTCAPTION As Long = 2

Private Sub Command1_Click()
  Text1 = ""
  Hide
End Sub

Private Sub Command2_Click()
  Hide
End Sub

Private Sub Form_Load()
  SetCaptions Me
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  Form_MouseMove Button, Shift, x, y
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = vbLeftButton Then
    ReleaseCapture
    SendMessageLong Me.hwnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&
  End If
End Sub

Private Sub Form_Paint()
  DrawSkin Me
End Sub

Private Sub Label1_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  Form_MouseMove Button, Shift, x, y
End Sub

Private Sub Label1_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
  Form_MouseMove Button, Shift, x, y
End Sub
