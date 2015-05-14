VERSION 5.00
Begin VB.UserControl MSNList 
   BackColor       =   &H80000005&
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   FillColor       =   &H8000000D&
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   ScaleHeight     =   240
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   320
   ToolboxBitmap   =   "MSNOptionsList.ctx":0000
   Begin VB.ListBox List1 
      Height          =   1230
      Left            =   3360
      TabIndex        =   0
      Top             =   2040
      Visible         =   0   'False
      Width           =   1095
   End
End
Attribute VB_Name = "MSNList"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private Declare Function CreateFont Lib "gdi32.dll" Alias "CreateFontA" (ByVal H As Long, ByVal W As Long, ByVal e As Long, ByVal o As Long, ByVal W As Long, ByVal i As Long, ByVal u As Long, ByVal s As Long, ByVal c As Long, ByVal OP As Long, ByVal CP As Long, ByVal Q As Long, ByVal PAF As Long, ByVal F As String) As Long
Private Declare Function SelectObject Lib "gdi32.dll" (ByVal hdc As Long, ByVal hObject As Long) As Long
Private Declare Function DeleteObject Lib "gdi32.dll" (ByVal hObject As Long) As Long
Private Declare Function TextOut Lib "gdi32.dll" Alias "TextOutA" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal lpString As String, ByVal nCount As Long) As Long
Private Declare Function FillRect Lib "user32.dll" (ByVal hdc As Long, ByRef lpRect As RECT, ByVal hBrush As Long) As Long
Private Declare Function InvertRect Lib "user32.dll" (ByVal hdc As Long, ByRef lpRect As RECT) As Long
Private Declare Function InflateRect Lib "user32.dll" (ByRef lpRect As RECT, ByVal x As Long, ByVal y As Long) As Long
Private Type RECT
  left As Long
  tOp As Long
  Right As Long
  Bottom As Long
End Type
Private Const COLOR_HIGHLIGHTTEXT As Long = 14
Private Const COLOR_WINDOWFRAME As Long = 6

Private GotFocus As Boolean

Event Click()

Private Sub UserControl_InitProperties()
  Set UserControl.Font = Ambient.Font
End Sub

Private Sub UserControl_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = 38 Then
    If List1.ListIndex > 0 Then
      List1.ListIndex = List1.ListIndex - 1
      UserControl_Paint
    End If
  End If
  
  If KeyCode = 40 Then
    If List1.ListIndex < List1.ListCount - 1 Then
      List1.ListIndex = List1.ListIndex + 1
      UserControl_Paint
    End If
  End If
End Sub

Private Sub UserControl_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  y = Int(y / 25)
  If y < List1.ListCount Then
    List1.ListIndex = y
    RaiseEvent Click
    UserControl_Paint
  End If
End Sub

Private Sub UserControl_Paint()
  Dim i As Long
  Dim hilite As RECT
  Dim newfont As Long, oldfont As Long
  'newfont = CreateFont(-Font.Size - 3, 0, 0, 0, 400, 0, 0, 0, Font.Charset, 0, 0, 0, 0, Font.name)
  'oldfont = SelectObject(hdc, newfont)
  For i = 0 To List1.ListCount - 1
    hilite.left = 0
    hilite.tOp = i * 25
    hilite.Right = ScaleWidth
    hilite.Bottom = hilite.tOp + 25
    If i = List1.ListIndex Then
      FillRect hdc, hilite, COLOR_HIGHLIGHTTEXT
      If GotFocus Then
        InflateRect hilite, -1, -1
        InvertRect hdc, hilite
        InflateRect hilite, -1, -1
        InvertRect hdc, hilite
      End If
      ForeColor = &H8000000E
    Else
      FillRect hdc, hilite, COLOR_WINDOWFRAME
      ForeColor = &H80000008
    End If
  
    'CurrentX = 7
    'CurrentY = (i * 25) + 8
    'Print List1.List(i)
    TextOut hdc, 4, (i * 25) + 7, List1.List(i), Len(List1.List(i))
  Next i
  'SelectObject hdc, oldfont
  'DeleteObject newfont
End Sub

Public Property Get ListCount() As Integer
Attribute ListCount.VB_Description = "Returns the number of items in the list portion of a control."
Attribute ListCount.VB_MemberFlags = "400"
  ListCount = List1.ListCount
End Property
Public Property Get List(ByVal Index As Integer) As String
Attribute List.VB_Description = "Returns/sets the items contained in a control's list portion."
  List = List1.List(Index)
End Property
Public Property Let List(ByVal Index As Integer, ByVal New_List As String)
  List1.List(Index) = New_List
  PropertyChanged "List"
End Property
Public Property Get ListIndex() As Integer
Attribute ListIndex.VB_Description = "Returns/sets the index of the currently selected item in the control."
Attribute ListIndex.VB_MemberFlags = "600"
  ListIndex = List1.ListIndex
End Property
Public Property Let ListIndex(ByVal New_ListIndex As Integer)
  List1.ListIndex() = New_ListIndex
  PropertyChanged "ListIndex"
End Property
Private Sub List1_Click()
  RaiseEvent Click
End Sub
Public Sub AddItem(ByVal Item As String, Optional ByVal Index As Variant)
Attribute AddItem.VB_Description = "Adds an item to a Listbox or ComboBox control or a row to a Grid control."
  List1.AddItem Item, Index
End Sub
Public Sub RemoveItem(ByVal Index As Integer)
Attribute RemoveItem.VB_Description = "Removes an item from a ListBox or ComboBox control or a row from a Grid control."
  List1.RemoveItem Index
End Sub
Private Sub UserControl_Initialize()
  List1.Clear
End Sub
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
  Set UserControl.Font = PropBag.ReadProperty("Font", Ambient.Font)
End Sub

Private Sub UserControl_Show()
  If Ambient.UserMode Then BackColor = &H80000005
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
  Call PropBag.WriteProperty("Font", UserControl.Font, Ambient.Font)
End Sub

Private Sub UserControl_GotFocus()
  GotFocus = True
  UserControl_Paint
End Sub
Private Sub UserControl_LostFocus()
  GotFocus = False
  UserControl_Paint
End Sub

Public Property Get Font() As Font
  Set Font = UserControl.Font
End Property

Public Property Set Font(ByVal New_Font As Font)
  Set UserControl.Font = New_Font
  PropertyChanged "Font"
End Property

Public Sub Redraw()
  UserControl_Paint
End Sub
