VERSION 5.00
Begin VB.UserControl ChanView 
   BackColor       =   &H00000000&
   ClientHeight    =   795
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4815
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   6.75
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ScaleHeight     =   53
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   321
   ToolboxBitmap   =   "sapChannelViewer.ctx":0000
   Begin Sappy2k6.FakeCheck chkMute 
      Height          =   180
      Left            =   30
      TabIndex        =   7
      ToolTipText     =   "Mute this Track"
      Top             =   45
      Width           =   180
      _ExtentX        =   318
      _ExtentY        =   318
   End
   Begin VB.Label lblType 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "Direct"
      ForeColor       =   &H0000C000&
      Height          =   150
      Left            =   3840
      TabIndex        =   6
      Top             =   240
      Width           =   735
   End
   Begin VB.Label lblExpand 
      BackStyle       =   0  'Transparent
      Caption         =   "6"
      BeginProperty Font 
         Name            =   "Marlett"
         Size            =   9.75
         Charset         =   2
         Weight          =   500
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000C000&
      Height          =   420
      Left            =   4575
      MouseIcon       =   "sapChannelViewer.ctx":0312
      MousePointer    =   99  'Custom
      TabIndex        =   3
      Top             =   0
      Width           =   240
   End
   Begin VB.Label lblNote 
      BackStyle       =   0  'Transparent
      ForeColor       =   &H00C0C000&
      Height          =   150
      Left            =   1320
      TabIndex        =   2
      Top             =   45
      Width           =   3015
   End
   Begin VB.Label lblVol 
      BackStyle       =   0  'Transparent
      Caption         =   "0"
      ForeColor       =   &H0080C0FF&
      Height          =   150
      Left            =   600
      TabIndex        =   5
      Top             =   240
      Width           =   255
   End
   Begin VB.Label lblPat 
      BackStyle       =   0  'Transparent
      Caption         =   "0"
      ForeColor       =   &H008080FF&
      Height          =   150
      Left            =   240
      TabIndex        =   4
      Top             =   240
      Width           =   255
   End
   Begin VB.Label lblDel 
      BackStyle       =   0  'Transparent
      Caption         =   "0"
      ForeColor       =   &H000040C0&
      Height          =   150
      Left            =   960
      TabIndex        =   1
      Top             =   45
      Width           =   255
   End
   Begin VB.Label lblPC 
      BackStyle       =   0  'Transparent
      Caption         =   "0x000000"
      ForeColor       =   &H0000C000&
      Height          =   150
      Left            =   270
      TabIndex        =   0
      Top             =   45
      Width           =   735
   End
   Begin VB.Shape shpMeter 
      BackColor       =   &H00004000&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00008000&
      Height          =   225
      Left            =   960
      Top             =   15
      Width           =   3840
   End
End
Attribute VB_Name = "ChanView"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
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
'|  Channel bar control  |
'|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|
'| Done with the ActiveX Control Interface Wizard.    |
'| Last update: Juli 26th, 2006                       |
'|____________________________________________________|
'
'###########################################################################################
Option Explicit

Dim m_Velocity As Variant
Dim m_Vibrato As Variant
Dim m_Pan As Variant

Event Resize()
Event MuteChanged()

Public Property Get mute() As Integer
Attribute mute.VB_ProcData.VB_Invoke_Property = ";Music"
  mute = chkMute.Value
End Property
Public Property Let mute(ByVal New_Mute As Integer)
  If New_Mute = 2 Then New_Mute = 1
  chkMute.Value() = New_Mute
  PropertyChanged "Mute"
  RaiseEvent MuteChanged
End Property

Public Property Get iType() As String
  iType = lblType.Caption
End Property

Public Property Let iType(ByVal New_Type As String)
  lblType.Caption() = New_Type
  PropertyChanged "Type"
End Property

Public Property Get Location() As Long
Attribute Location.VB_ProcData.VB_Invoke_Property = ";Music"
  Location = Val(Replace(lblPC.Caption, "0x", "&H"))
End Property
Public Property Let Location(ByVal New_Location As Long)
  lblPC.Caption = "0x" & Right("000000" & Hex(New_Location), 6)
  PropertyChanged "Location"
End Property

Public Property Get Delay() As String
Attribute Delay.VB_ProcData.VB_Invoke_Property = ";Music"
  Delay = lblDel.Caption
End Property
Public Property Let Delay(ByVal New_Delay As String)
  lblDel.Caption() = New_Delay
  PropertyChanged "Delay"
End Property

Public Property Get patch() As String
Attribute patch.VB_ProcData.VB_Invoke_Property = ";Music"
  patch = lblPat.Caption
End Property
Public Property Let patch(ByVal New_Patch As String)
  lblPat.Caption() = New_Patch
  PropertyChanged "Patch"
End Property

Public Property Get volume() As String
Attribute volume.VB_ProcData.VB_Invoke_Property = ";Music"
  volume = lblVol.Caption
End Property
Public Property Let volume(ByVal New_Volume As String)
  lblVol.Caption() = New_Volume
  DoMeter
  PropertyChanged "Volume"
End Property

Public Property Get Note() As String
Attribute Note.VB_ProcData.VB_Invoke_Property = ";Music"
Attribute Note.VB_UserMemId = -518
  Note = lblNote.Caption
End Property
Public Property Let Note(ByVal New_Note As String)
  lblNote.Caption() = New_Note
  PropertyChanged "Note"
End Property

Public Property Get Velocity() As Variant
Attribute Velocity.VB_ProcData.VB_Invoke_Property = ";Music"
  Velocity = m_Velocity
End Property
Public Property Let Velocity(ByVal New_Velocity As Variant)
  m_Velocity = New_Velocity
  PropertyChanged "Velocity"
End Property

Public Property Get Vibrato() As Variant
Attribute Vibrato.VB_ProcData.VB_Invoke_Property = ";Music"
  Vibrato = m_Vibrato
End Property
Public Property Let Vibrato(ByVal New_Vibrato As Variant)
  m_Vibrato = New_Vibrato
  PropertyChanged "Vibrato"
End Property

Public Property Get pan() As Variant
Attribute pan.VB_ProcData.VB_Invoke_Property = ";Music"
  pan = m_Pan
End Property
Public Property Let pan(ByVal New_Pan As Variant)
  m_Pan = New_Pan
  DoMeter
  PropertyChanged "Pan"
End Property

Private Sub chkMute_Click()
  mute = chkMute.Value
End Sub

Private Sub lblExpand_Click()
  If lblExpand.Caption = "6" Then
    lblExpand.Caption = "5"
    UserControl.Height = 450
  Else
    lblExpand.Caption = "6"
    UserControl.Height = 246
  End If
  RaiseEvent Resize
End Sub

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
  chkMute.Value = PropBag.ReadProperty("Mute", 0)
  lblPC.Caption = PropBag.ReadProperty("Location", "0x000000")
  lblDel.Caption = PropBag.ReadProperty("Delay", "0")
  lblPat.Caption = PropBag.ReadProperty("Patch", "0")
  lblVol.Caption = PropBag.ReadProperty("Volume", "0")
  lblNote.Caption = PropBag.ReadProperty("Note", "0")
  m_Velocity = PropBag.ReadProperty("Velocity", 0)
  m_Vibrato = PropBag.ReadProperty("Vibrato", 0)
  m_Pan = PropBag.ReadProperty("Pan", 0)
  
  DoMeter
  lblType.Caption = PropBag.ReadProperty("IType", "Blah")
End Sub

Private Sub UserControl_Resize()
  UserControl.Width = 4815
  UserControl.Height = IIf(lblExpand.Caption = "6", 246, 450)
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
  Call PropBag.WriteProperty("Mute", chkMute.Value, 0)
  Call PropBag.WriteProperty("Location", lblPC.Caption, "0xFFFFFF")
  Call PropBag.WriteProperty("Delay", lblDel.Caption, "99")
  Call PropBag.WriteProperty("Patch", lblPat.Caption, "99")
  Call PropBag.WriteProperty("Volume", lblVol.Caption, "99")
  Call PropBag.WriteProperty("Note", lblNote.Caption, "99")
  Call PropBag.WriteProperty("Velocity", m_Velocity, 0)
  Call PropBag.WriteProperty("Vibrato", m_Vibrato, 0)
  Call PropBag.WriteProperty("Pan", m_Pan, 0)
  Call PropBag.WriteProperty("IType", lblType.Caption, "Blah")
End Sub

Public Sub Expand(out As Boolean)
  If out = True Then
    lblExpand.Caption = "5"
    UserControl.Height = 450
  Else
    lblExpand.Caption = "6"
    UserControl.Height = 246
  End If
End Sub

Private Sub DoMeter()
  If m_Pan = 0 Then
    shpMeter.left = 64 + 128 - (Val(lblVol.Caption) / 2)
    shpMeter.Width = Val(lblVol.Caption)
  ElseIf m_Pan < 0 Then
    shpMeter.left = 64 + 128 - Int(Val(lblVol.Caption) / 2)
    shpMeter.Width = Int((Val(lblVol.Caption) / 2)) + 1
  ElseIf m_Pan > 0 Then
    shpMeter.left = 64 + 128
    shpMeter.Width = Val(lblVol.Caption) / 2
  End If
  shpMeter.BackColor = RGB(0, 32 + (Val(lblVol.Caption) / 3), 0)
End Sub

