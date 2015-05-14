VERSION 5.00
Begin VB.UserControl SkinButton 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   DefaultCancel   =   -1  'True
   ScaleHeight     =   240
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   320
   ToolboxBitmap   =   "SkinButton.ctx":0000
   Begin VB.PictureBox Picture1 
      AutoRedraw      =   -1  'True
      Height          =   1095
      Left            =   3240
      ScaleHeight     =   69
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   21
      TabIndex        =   0
      Top             =   2040
      Visible         =   0   'False
      Width           =   375
   End
End
Attribute VB_Name = "SkinButton"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit


Private Declare Function ImageList_Draw Lib "COMCTL32.DLL" (ByVal hIml As Long, ByVal i As Long, ByVal hdcDst As Long, ByVal x As Long, ByVal y As Long, ByVal fStyle As Long) As Long

Private Const ILD_NORMAL = 0
Private Const ILD_TRANSPARENT = 1
Private Const ILD_BLEND25 = 2
Private Const ILD_SELECTED = 4
Private Const ILD_FOCUS = 4

Private Declare Function SetBkMode Lib "gdi32.dll" (ByVal hdc As Long, ByVal nBkMode As Long) As Long
Private Declare Function BitBlt Lib "gdi32.dll" (ByVal hDestDC As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Private Declare Function StretchBlt Lib "gdi32.dll" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal nSrcWidth As Long, ByVal nSrcHeight As Long, ByVal dwRop As Long) As Long
Private Declare Function DrawText Lib "user32" Alias "DrawTextA" (ByVal hdc As Long, ByVal lpStr As String, ByVal nCount As Long, lpRect As RECT, ByVal wFormat As Long) As Long
Private Declare Function InflateRect Lib "user32.dll" (ByRef lpRect As RECT, ByVal x As Long, ByVal y As Long) As Long
Private Declare Function DrawFocusRect Lib "user32.dll" (ByVal hdc As Long, ByRef lpRect As RECT) As Long
Private Declare Function CreateFont Lib "gdi32.dll" Alias "CreateFontA" (ByVal H As Long, ByVal W As Long, ByVal E As Long, ByVal o As Long, ByVal W As Long, ByVal i As Long, ByVal u As Long, ByVal S As Long, ByVal C As Long, ByVal OP As Long, ByVal CP As Long, ByVal Q As Long, ByVal PAF As Long, ByVal F As String) As Long
Private Declare Function SelectObject Lib "gdi32.dll" (ByVal hdc As Long, ByVal hObject As Long) As Long
Private Declare Function DeleteObject Lib "gdi32.dll" (ByVal hObject As Long) As Long

Private Type RECT
  left As Long
  tOp As Long
  Right As Long
  Bottom As Long
End Type

Private Const WM_PAINT As Long = &HF
Private Const WM_GETTEXT As Long = &HD

Private Const BM_GETSTATE As Long = &HF2&
Private Const BST_FOCUS As Long = &H8
Private Const BST_PUSHED As Long = &H4

Private Const DT_CENTER As Long = &H1
Private Const DT_VCENTER As Long = &H4
Private Const DT_SINGLELINE As Long = &H20

Private m_Caption As String
Private m_Focus As Boolean
Private m_Down As Boolean
Private m_Icon As Integer
Private m_IconSize As Integer
Private m_ImageList As Long

Private SkinDC As Long
Event Click()
Attribute Click.VB_UserMemId = -600

Public Sub DrawWholeButton()
Attribute DrawWholeButton.VB_UserMemId = -550
  Dim rc As RECT, oldfont As Long, newfont As Long, grayed As Long
  rc.left = 0
  rc.tOp = 0
  rc.Bottom = ScaleHeight
  rc.Right = ScaleWidth
  grayed = Picture1.Point(6, 0)
  UserControl.Line (0, 0)-(ScaleWidth, ScaleHeight), 0, BF
  On Error Resume Next
  If Extender.Default Then
    rc.Bottom = rc.Bottom - 1
    rc.Right = rc.Right - 1
  End If
  If Not m_Down Then
    DrawSkinRect hdc, rc, SkinDC
  Else
    rc.tOp = rc.tOp + 1
    rc.left = rc.left + 1
    DrawSkinRect hdc, rc, SkinDC
    rc.Bottom = rc.Bottom + 1
    rc.Right = rc.Right + 1
  End If
  
  If m_Icon = 0 Then
    SetBkMode hdc, 0
    'newfont = CreateFont(-Font.Size - 3, 0, 0, 0, 400, 0, 0, 0, Font.Charset, 0, 0, 0, 0, Font.name)
    If Enabled = False Then
      ForeColor = grayed
    Else
      ForeColor = 0
    End If
    'oldfont = SelectObject(hdc, newfont)
    DrawText hdc, m_Caption, Len(m_Caption), rc, DT_CENTER Or DT_VCENTER Or DT_SINGLELINE
    'SelectObject hdc, oldfont
    'DeleteObject newfont
  Else
    'ImageListDrawIcon 0, hdc, m_ImageList, Icon, (rc.Right / 2) - (m_IconSize / 2), (rc.Bottom / 2) - (m_IconSize / 2), False, Not Enabled
    ImageList_Draw m_ImageList, Icon - 1, hdc, (rc.Right / 2) - (m_IconSize / 2), (rc.Bottom / 2) - (m_IconSize / 2), ILD_TRANSPARENT
  End If
  
  If m_Focus Then
    InflateRect rc, -3, -3
    DrawFocusRect hdc, rc
  End If
End Sub

Private Sub DrawSkinRect(hdc As Long, rc As RECT, pic As Long)
  BitBlt hdc, rc.left, rc.tOp, 2, 2, pic, 6, 0, vbSrcCopy
  StretchBlt hdc, rc.left + 2, rc.tOp, rc.Right - 4, 2, pic, 6, 2, 2, 2, vbSrcCopy
  BitBlt hdc, rc.Right - 2, rc.tOp, 2, 2, pic, 6, 4, vbSrcCopy
  StretchBlt hdc, rc.left, rc.tOp + 2, 2, rc.Bottom - 4, pic, 6, 6, 2, 2, vbSrcCopy
  StretchBlt hdc, rc.left + 2, rc.tOp + 2, rc.Right - 4, rc.Bottom - 4, pic, 0, 0, 5, 61, vbSrcCopy
  StretchBlt hdc, rc.Right - 2, rc.tOp + 2, 2, rc.Bottom - 4, pic, 6, 8, 2, 2, vbSrcCopy
  BitBlt hdc, rc.left, rc.Bottom - 2, 2, 2, pic, 6, 10, vbSrcCopy
  StretchBlt hdc, rc.left + 2, rc.Bottom - 2, rc.Right - 4, 2, pic, 6, 12, 2, 2, vbSrcCopy
  BitBlt hdc, rc.Right - 2, rc.Bottom - 2, 2, 2, pic, 6, 14, vbSrcCopy
End Sub

Private Sub UserControl_AccessKeyPress(KeyAscii As Integer)
  m_Down = True
  DrawWholeButton
  RaiseEvent Click
  m_Down = False
  DrawWholeButton
End Sub

Private Sub UserControl_EnterFocus()
  m_Focus = True
  DrawWholeButton
End Sub

Private Sub UserControl_ExitFocus()
  m_Focus = False
  DrawWholeButton
End Sub

Private Sub UserControl_Initialize()
  Picture1.Picture = LoadResPicture(100, vbResBitmap)
  SkinDC = Picture1.hdc
  MouseIcon = LoadResPicture("HAND", vbResCursor)
  MousePointer = 99
End Sub

Private Sub UserControl_KeyDown(KeyCode As Integer, Shift As Integer)
  'Trace "UserControl_KeyDown(" & KeyCode & ", " & Shift & ")"
End Sub

Private Sub UserControl_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  m_Down = True
  DrawWholeButton
End Sub

Private Sub UserControl_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
  m_Down = False
  DrawWholeButton
End Sub

Private Sub UserControl_Paint()
  DrawWholeButton
End Sub

Private Sub UserControl_Click()
  RaiseEvent Click
End Sub

Public Property Get Font() As Font
Attribute Font.VB_Description = "Returns a Font object."
Attribute Font.VB_UserMemId = -512
  Set Font = UserControl.Font
End Property

Public Property Set Font(ByVal New_Font As Font)
  Set UserControl.Font = New_Font
  PropertyChanged "Font"
  DrawWholeButton
End Property

Public Property Get Caption() As String
Attribute Caption.VB_UserMemId = -518
  Caption = m_Caption
End Property

Public Property Let Caption(ByVal New_Caption As String)
  m_Caption = New_Caption
  PropertyChanged "Caption"
  DrawWholeButton
End Property

Public Property Get ImageList() As Long
  ImageList = m_ImageList
End Property

Public Property Let ImageList(ByVal New_ImageList As Long)
  m_ImageList = New_ImageList
  PropertyChanged "ImageList"
  DrawWholeButton
End Property

Public Property Get Icon() As Integer
  Icon = m_Icon
End Property

Public Property Let Icon(ByVal New_Icon As Integer)
  m_Icon = New_Icon
  PropertyChanged "Icon"
  DrawWholeButton
End Property

Public Property Get IconSize() As Integer
  IconSize = m_IconSize
End Property

Public Property Let IconSize(ByVal New_IconSize As Integer)
  m_IconSize = New_IconSize
  PropertyChanged "IconSize"
  DrawWholeButton
End Property

Private Sub UserControl_InitProperties()
  Set UserControl.Font = Ambient.Font
  m_Caption = Ambient.DisplayName
  m_Icon = 0
  m_ImageList = 0
End Sub

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
  Set UserControl.Font = PropBag.ReadProperty("Font", Ambient.Font)
  m_Caption = PropBag.ReadProperty("Caption", Ambient.DisplayName)
  m_Icon = PropBag.ReadProperty("Icon", 0)
  m_IconSize = PropBag.ReadProperty("IconSize", 16)
  m_ImageList = PropBag.ReadProperty("ImageList", 0)
  UserControl.Enabled = PropBag.ReadProperty("Enabled", True)
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
  Call PropBag.WriteProperty("Font", UserControl.Font, Ambient.Font)
  Call PropBag.WriteProperty("Caption", m_Caption, Ambient.DisplayName)
  Call PropBag.WriteProperty("Icon", m_Icon, 0)
  Call PropBag.WriteProperty("IconSize", m_IconSize, 16)
  Call PropBag.WriteProperty("ImageList", m_ImageList, 0)
  Call PropBag.WriteProperty("Enabled", UserControl.Enabled, True)
End Sub

Public Property Get Enabled() As Boolean
Attribute Enabled.VB_Description = "Returns/sets a value that determines whether an object can respond to user-generated events."
  Enabled = UserControl.Enabled
End Property

Public Property Let Enabled(ByVal New_Enabled As Boolean)
  UserControl.Enabled() = New_Enabled
  PropertyChanged "Enabled"
  DrawWholeButton
End Property

Public Property Let value(ByVal New_Value As Boolean)
  If New_Value = True Then RaiseEvent Click
End Property

