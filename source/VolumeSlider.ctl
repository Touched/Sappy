VERSION 5.00
Begin VB.UserControl VolumeSlider 
   ClientHeight    =   1785
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3150
   ScaleHeight     =   119
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   210
   ToolboxBitmap   =   "VolumeSlider.ctx":0000
End
Attribute VB_Name = "VolumeSlider"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Private Declare Function DrawEdge Lib "user32.dll" (ByVal hdc As Long, ByRef qrc As RECT, ByVal edge As Long, ByVal grfFlags As Long) As Long
Private Declare Function FillRect Lib "user32.dll" (ByVal hdc As Long, ByRef lpRect As RECT, ByVal hBrush As Long) As Long
Private Declare Function DrawFocusRect Lib "user32.dll" (ByVal hdc As Long, ByRef lpRect As RECT) As Long

Private Declare Function CreateSolidBrush Lib "gdi32.dll" (ByVal crColor As Long) As Long
Private Declare Function SelectObject Lib "gdi32.dll" (ByVal hdc As Long, ByVal hObject As Long) As Long
Private Declare Function DeleteObject Lib "gdi32.dll" (ByVal hObject As Long) As Long

Private Type RECT
  left As Long
  tOp As Long
  Right As Long
  Bottom As Long
End Type

Private Const BDR_RAISEDINNER As Long = &H4
Private Const BDR_RAISEDOUTER As Long = &H1
Private Const BDR_SUNKENINNER As Long = &H8
Private Const BDR_SUNKENOUTER As Long = &H2
Private Const BF_BOTTOM As Long = &H8
Private Const BF_RIGHT As Long = &H4
Private Const BF_DIAGONAL As Long = &H10
Private Const BF_TOP As Long = &H2
Private Const BF_LEFT As Long = &H1
Private Const BF_TOPLEFT As Long = (BF_TOP Or BF_LEFT)
Private Const BF_BOTTOMRIGHT As Long = (BF_BOTTOM Or BF_RIGHT)
Private Const BF_DIAGONAL_ENDTOPRIGHT As Long = (BF_DIAGONAL Or BF_TOP Or BF_RIGHT)

Private Const COLOR_BTNFACE As Long = 16

Private Declare Function LineTo Lib "gdi32.dll" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long) As Long
Private Declare Function MoveToEx Lib "gdi32.dll" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByRef lpPoint As POINTAPI) As Long
Private Declare Function CreatePen Lib "gdi32.dll" (ByVal nPenStyle As Long, ByVal nWidth As Long, ByVal crColor As Long) As Long
Private Declare Function FloodFill Lib "gdi32.dll" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal crColor As Long) As Long
Private Type POINTAPI
  x As Long
  y As Long
End Type




Private mValue As Integer
Private Dragging As Boolean
Private DragOrigin As Integer
Private HasFocus As Boolean

Public Event Change(newValue As Integer)
Public Function GetValue() As Integer
  GetValue = mValue
End Function
Public Function SetValue(nV As Integer)
  If nV < 0 Then nV = 0
  If nV > 50 Then nV = 50
  mValue = nV
  UserControl_Paint
  RaiseEvent Change(mValue)
End Function

Private Sub UserControl_GotFocus()
  HasFocus = True
  UserControl_Paint
End Sub

Private Sub UserControl_Initialize()
  BackColor = QBColor(7)
  MouseIcon = LoadResPicture("HAND", vbResCursor)
End Sub

Private Sub UserControl_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = 37 Then 'left
    If mValue = 0 Then Exit Sub
    mValue = mValue - 1
    UserControl_Paint
    RaiseEvent Change(mValue)
  End If
  If KeyCode = 39 Then 'right
    If mValue = 50 Then Exit Sub
    mValue = mValue + 1
    UserControl_Paint
    RaiseEvent Change(mValue)
  End If
  If KeyCode = 38 Then 'up
    mValue = mValue + 10
    If mValue > 50 Then mValue = 50
    UserControl_Paint
    RaiseEvent Change(mValue)
  End If
  If KeyCode = 40 Then 'down
    mValue = mValue - 10
    If mValue < 0 Then mValue = 0
    UserControl_Paint
    RaiseEvent Change(mValue)
  End If
End Sub

Private Sub UserControl_LostFocus()
  HasFocus = False
  UserControl_Paint
End Sub

Private Sub UserControl_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  Trace "VolSlider_MouseDown -> X: " & x & ", mValue: " & mValue
  If x < mValue Or x > mValue Then mValue = x - 5
  Dragging = True
  DragOrigin = x - mValue
  UserControl_MouseMove Button, Shift, x, y
End Sub

Private Sub UserControl_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
  If (x >= mValue) And (x <= mValue + 10) Then
    MousePointer = 99
  Else
    MousePointer = 0
  End If
  If Dragging = False Then Exit Sub
  MousePointer = 99
  mValue = x - 5
  If mValue > 50 Then mValue = 50
  If mValue < 0 Then mValue = 0
  value = mValue
  RaiseEvent Change(mValue)
  UserControl_Paint
End Sub

Private Sub UserControl_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
  Dragging = False
End Sub

Private Sub UserControl_Paint()
  Dim myRect As RECT
  Dim MyColor As Long
  Dim OldColor As Long
  Dim ThreedHilite As Long
  Dim ThreedShadow As Long
  Dim oldPen As Long
  Dim foo As POINTAPI
  
  'ThreedHilite = CreatePen(0, 0, ChangeBrightness(BackColor, 0.4))
  'ThreedShadow = CreatePen(0, 0, ChangeBrightness(BackColor, -0.4))
  
  Cls
  
  MyColor = CreateSolidBrush(TranslateColor(BackColor))
  OldColor = SelectObject(hdc, MyColor)
  
  myRect.left = 0
  myRect.tOp = 0
  myRect.Bottom = 22
  myRect.Right = 60
  FillRect hdc, myRect, MyColor
  
  myRect.left = 5
  myRect.tOp = 2
  myRect.Bottom = 18
  myRect.Right = 55
'  oldPen = SelectObject(hdc, ThreedShadow)
'  MoveToEx hdc, myRect.Left, myRect.Bottom, foo
'  LineTo hdc, myRect.Right, myRect.Top
'  SelectObject hdc, ThreedHilite
'  LineTo hdc, myRect.Right, myRect.Bottom
'  LineTo hdc, myRect.Right, myRect.Top
  DrawEdge hdc, myRect, BDR_SUNKENINNER Or BDR_SUNKENINNER, BF_BOTTOMRIGHT
  DrawEdge hdc, myRect, BDR_SUNKENINNER, BF_DIAGONAL_ENDTOPRIGHT
  
  myRect.left = mValue
  myRect.Right = mValue + 10
  myRect.tOp = 0
  myRect.Bottom = 20
  FillRect hdc, myRect, MyColor 'COLOR_BTNFACE
  DrawEdge hdc, myRect, BDR_RAISEDOUTER Or BDR_RAISEDINNER, BF_TOPLEFT Or BF_BOTTOMRIGHT
  
  SelectObject hdc, OldColor
  DeleteObject MyColor

  If HasFocus = True Then
    myRect.left = mValue + 3
    myRect.tOp = 3
    myRect.Bottom = 17
    myRect.Right = mValue + 7
    'DrawFocusRect hdc, myRect
  End If
  
  'DeleteObject ThreedHilite
  'DeleteObject ThreedShadow
End Sub

Private Sub UserControl_Resize()
  Width = 975
  Height = 375
End Sub

Public Property Get BackColor() As OLE_COLOR
Attribute BackColor.VB_Description = "Returns/sets the background color used to display text and graphics in an object."
  BackColor = UserControl.BackColor
End Property

Public Property Let BackColor(ByVal New_BackColor As OLE_COLOR)
  UserControl.BackColor() = New_BackColor
  PropertyChanged "BackColor"
End Property

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
  UserControl.BackColor = PropBag.ReadProperty("BackColor", &H8000000F)
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
  Call PropBag.WriteProperty("BackColor", UserControl.BackColor, &H8000000F)
End Sub

