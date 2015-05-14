VERSION 5.00
Begin VB.UserControl FakeCheck 
   ClientHeight    =   525
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   1050
   ScaleHeight     =   35
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   70
   ToolboxBitmap   =   "fakecheck.ctx":0000
   Begin VB.PictureBox Picture1 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   180
      Left            =   360
      Picture         =   "fakecheck.ctx":0312
      ScaleHeight     =   180
      ScaleWidth      =   540
      TabIndex        =   0
      Top             =   240
      Width           =   540
   End
End
Attribute VB_Name = "FakeCheck"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Dim m_Value As CheckBoxConstants
Dim m_Checked As Boolean

Event Click()

Private Sub UserControl_Paint()
  PaintPicture Picture1.Picture, 0, 0, 12, 12, 12 * m_Value, 0, 12, 12, vbSrcCopy
End Sub

Private Sub UserControl_Click()
  Checked = Not Checked
  RaiseEvent Click
End Sub

Public Property Get Value() As CheckBoxConstants
  Value = m_Value
End Property
Public Property Let Value(ByVal New_Value As CheckBoxConstants)
  If New_Value > 2 Then New_Value = 2
  m_Value = New_Value
  m_Checked = (m_Value = 1)
  Refresh
  PropertyChanged "Value"
End Property

Public Property Get Checked() As Boolean
  Checked = m_Checked
End Property
Public Property Let Checked(ByVal New_Checked As Boolean)
  m_Checked = New_Checked
  m_Value = IIf(m_Checked, 1, 0)
  Refresh
  PropertyChanged "Checked"
End Property

Private Sub UserControl_InitProperties()
  m_Value = 0
  m_Checked = False
End Sub

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
  m_Value = PropBag.ReadProperty("Value", 0)
  m_Checked = PropBag.ReadProperty("Checked", False)
  UserControl.Enabled = PropBag.ReadProperty("Enabled", True)
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
  Call PropBag.WriteProperty("Value", m_Value, 0)
  Call PropBag.WriteProperty("Checked", m_Checked, False)
  Call PropBag.WriteProperty("Enabled", UserControl.Enabled, True)
End Sub

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=UserControl,UserControl,-1,Enabled
Public Property Get Enabled() As Boolean
Attribute Enabled.VB_Description = "Returns/sets a value that determines whether an object can respond to user-generated events."
  Enabled = UserControl.Enabled
End Property

Public Property Let Enabled(ByVal New_Enabled As Boolean)
  UserControl.Enabled() = New_Enabled
  PropertyChanged "Enabled"
End Property

