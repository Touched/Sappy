VERSION 5.00
Begin VB.Form frmAbout 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "About"
   ClientHeight    =   5070
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6765
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmAbout.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   338
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   451
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.PictureBox picLogos 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      Height          =   480
      Left            =   840
      ScaleHeight     =   28
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   28
      TabIndex        =   3
      TabStop         =   0   'False
      Top             =   240
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.PictureBox picFont 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      Height          =   480
      Left            =   240
      ScaleHeight     =   28
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   28
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   240
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Timer timScroll 
      Interval        =   50
      Left            =   1440
      Top             =   240
   End
   Begin VB.PictureBox picGroup 
      AutoSize        =   -1  'True
      Height          =   1020
      Left            =   120
      ScaleHeight     =   64
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   432
      TabIndex        =   1
      TabStop         =   0   'False
      Top             =   120
      Width           =   6540
   End
   Begin Sappy2k6.SkinButton Command1 
      Default         =   -1  'True
      Height          =   375
      Left            =   4440
      TabIndex        =   0
      Top             =   4560
      Width           =   2175
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
      Caption         =   "[1000]OK"
   End
   Begin VB.PictureBox picScroller 
      Height          =   3255
      Left            =   120
      ScaleHeight     =   213
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   432
      TabIndex        =   4
      TabStop         =   0   'False
      Top             =   1200
      Width           =   6540
   End
End
Attribute VB_Name = "frmAbout"
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
' ________________
'|  About dialog  |
'|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|
'| Code 100% by Kyoufu Kawa.                          |
'| Last update: September 25th, 2006                  |
'|____________________________________________________|
'
'###########################################################################################

Option Explicit

Private lines(128) As String 'Refactored credits.
Public y As Long 'scroller Y position

Private Declare Function DrawText Lib "user32.dll" Alias "DrawTextA" (ByVal hdc As Long, ByVal lpStr As String, ByVal nCount As Long, ByRef lpRect As RECT, ByVal wFormat As Long) As Long
Private Type RECT
  left As Long
  tOp As Long
  Right As Long
  Bottom As Long
End Type
Private Const DT_CENTER As Long = &H1

Private Declare Function CreateFont Lib "gdi32.dll" Alias "CreateFontA" (ByVal H As Long, ByVal W As Long, ByVal E As Long, ByVal o As Long, ByVal W As Long, ByVal i As Long, ByVal u As Long, ByVal S As Long, ByVal C As Long, ByVal OP As Long, ByVal CP As Long, ByVal Q As Long, ByVal PAF As Long, ByVal F As String) As Long
Private Declare Function SelectObject Lib "gdi32.dll" (ByVal hdc As Long, ByVal hObject As Long) As Long
Private Declare Function DeleteObject Lib "gdi32.dll" (ByVal hObject As Long) As Long
Private Declare Function SetTextColor Lib "gdi32.dll" (ByVal hdc As Long, ByVal crColor As Long) As Long
Private Declare Function SetBkColor Lib "gdi32.dll" (ByVal hdc As Long, ByVal crColor As Long) As Long

Dim myDC As New pcMemDC

Private Sub Command1_Click()
  ClickSound
  Set myDC = Nothing
  Unload Me
End Sub

Private Sub Form_Load()

  SetCaptions Me
  Caption = LoadResString(1002)
  
  myDC.Width = picScroller.ScaleWidth
  myDC.Height = picScroller.ScaleHeight
  
  picGroup.Picture = LoadResPicture("BANNER", 0)
  picScroller.MouseIcon = LoadResPicture("HAND", 2)
  picFont.Picture = LoadResPicture("CREDITSFONT", 0)
  picLogos.Picture = LoadResPicture("CREDITSLOGOS", 0)
  picScroller.BackColor = picFont.point(1, 1)
  y = picScroller.ScaleHeight
  
  Dim b As String, C As Long, i As Long
  For i = 0 To 128
    lines(i) = ""
  Next i
  b = LoadResString(1001)
  C = 0
  For i = 1 To Len(b)
    lines(C) = lines(C) & Mid(b, i, 1)
    If Asc(Mid(b, i, 1)) = 10 Then
      C = C + 1
    End If
  Next i

End Sub

Private Sub Form_Paint()
  DrawSkin Me
End Sub

Private Sub picScroller_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  timScroll.Interval = 1
  
  Dim i As Long
  y = (Int(y / 15) - Int(Me.y / 15))
  If y > 0 Then
    If left(lines(y), 7) = "http://" Then
      ShellExecute Me.hwnd, "", lines(y), "", "", 0
    End If
  End If
End Sub

Private Sub picScroller_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
  Dim i As Long
  y = (Int(y / 15) - Int(Me.y / 15))
  If y > 0 Then
    If left(lines(y), 7) = "http://" Then
      picScroller.MousePointer = 99
    Else
      picScroller.MousePointer = 0
    End If
  End If
End Sub

Private Sub picScroller_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
  timScroll.Interval = 50
End Sub

Private Sub timScroll_Timer()
  Dim F As Long, of As Long, rc As RECT, r As Long, x As Long, i As Long
  
  For r = 0 To UBound(lines)
    x = (picScroller.ScaleWidth / 2) - ((Len(lines(r)) * 8) / 2) - 4
    If Trim(lines(r)) = "<logos>" Then
      BitBlt myDC.hdc, (picScroller.ScaleWidth / 2) - (picLogos.ScaleWidth / 2), y + (r * 15), picLogos.Width, picLogos.Height, picLogos.hdc, 0, 0, vbSrcCopy
    Else
      For i = 1 To Len(lines(r))
        If Asc(Mid(lines(r), i, 1)) = Asc("\") Then
          BitBlt myDC.hdc, x + (i * 8), y + (r * 15), 8, 16, picFont.hdc, 968 + (Abs(((y + r) / 1.5) Mod 6) * 8), 0, vbSrcCopy
        ElseIf Asc(Mid(lines(r), i, 1)) = Asc("ß") Then
          BitBlt myDC.hdc, x + (i * 8), y + (r * 15), 8, 16, picFont.hdc, 864, 0, vbSrcCopy
        ElseIf Asc(Mid(lines(r), i, 1)) >= Asc("à") Then
          BitBlt myDC.hdc, x + (i * 8), y + (r * 15), 8, 16, picFont.hdc, (Asc(Mid(lines(r), i, 1)) - 132) * 8, 0, vbSrcCopy
        Else
          BitBlt myDC.hdc, x + (i * 8), y + (r * 15), 8, 16, picFont.hdc, (Asc(Mid(lines(r), i, 1)) - 32) * 8, 0, vbSrcCopy
        End If
      Next i
      
    End If
  Next r
  
  StretchBlt myDC.hdc, 0, 31, picScroller.ScaleWidth, -32, frmSappy.picSkin.hdc, 6, 16, 2, 17, vbSrcAnd
  StretchBlt myDC.hdc, 0, picScroller.ScaleHeight - 32, picScroller.ScaleWidth, 32, frmSappy.picSkin.hdc, 6, 16, 2, 17, vbSrcAnd
  
  myDC.Draw picScroller.hdc
  
  y = y - 1
  If y < -800 Then y = picScroller.ScaleHeight
End Sub
