VERSION 5.00
Begin VB.Form frmEgg 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "STOP!"
   ClientHeight    =   1560
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   1995
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmEgg.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   104
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   133
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command1 
      BackColor       =   &H00C0C0C0&
      Cancel          =   -1  'True
      Caption         =   "Touch this"
      Default         =   -1  'True
      Enabled         =   0   'False
      Height          =   420
      Left            =   450
      TabIndex        =   0
      Top             =   990
      Width           =   1125
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Hammer time!"
      Height          =   255
      Left            =   840
      TabIndex        =   1
      Top             =   345
      Width           =   1095
   End
   Begin VB.Image Image1 
      Height          =   465
      Left            =   165
      Picture         =   "frmEgg.frx":000C
      Top             =   210
      Width           =   465
   End
End
Attribute VB_Name = "frmEgg"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_KeyPress(KeyAscii As Integer)
  Unload Me
End Sub

