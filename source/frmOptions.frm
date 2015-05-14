VERSION 5.00
Object = "{B6C8B132-5973-4983-AD46-8F3F10B04531}#1.0#0"; "vbalCbEx6.ocx"
Begin VB.Form frmOptions 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Settings"
   ClientHeight    =   3975
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8055
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmOptions.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   265
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   537
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.PictureBox picPage 
      Height          =   1335
      Index           =   3
      Left            =   1920
      ScaleHeight     =   1275
      ScaleWidth      =   5835
      TabIndex        =   17
      Top             =   1440
      Width           =   5895
      Begin vbalComboEx6.vbalCboEx cbxPresets 
         Height          =   330
         Left            =   3600
         TabIndex        =   29
         Top             =   840
         Width           =   2175
         _ExtentX        =   3836
         _ExtentY        =   661
         Style           =   2
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ExtendedUI      =   0   'False
         DropDownWidth   =   0
         DrawStyle       =   5
      End
      Begin VB.PictureBox picSkin 
         BackColor       =   &H80000010&
         BorderStyle     =   0  'None
         Height          =   240
         Index           =   2
         Left            =   2040
         ScaleHeight     =   15.36
         ScaleMode       =   0  'User
         ScaleWidth      =   15.36
         TabIndex        =   28
         Top             =   960
         Width           =   240
      End
      Begin VB.PictureBox picSkin 
         BackColor       =   &H80000010&
         BorderStyle     =   0  'None
         Height          =   240
         Index           =   1
         Left            =   1680
         ScaleHeight     =   15.36
         ScaleMode       =   0  'User
         ScaleWidth      =   15.36
         TabIndex        =   27
         Top             =   960
         Width           =   240
      End
      Begin VB.PictureBox picSkinLoad 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BackColor       =   &H8000000C&
         BorderStyle     =   0  'None
         Height          =   255
         Left            =   360
         ScaleHeight     =   17
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   25
         TabIndex        =   30
         Top             =   240
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.PictureBox picSkin 
         BackColor       =   &H80000010&
         BorderStyle     =   0  'None
         Height          =   240
         Index           =   0
         Left            =   1320
         ScaleHeight     =   15.36
         ScaleMode       =   0  'User
         ScaleWidth      =   15.36
         TabIndex        =   26
         Top             =   960
         Width           =   240
      End
      Begin VB.HScrollBar HScroll1 
         Height          =   255
         LargeChange     =   10
         Left            =   1320
         Max             =   50
         TabIndex        =   19
         Top             =   0
         Width           =   3975
      End
      Begin VB.HScrollBar HScroll2 
         Height          =   255
         LargeChange     =   2
         Left            =   1320
         Max             =   10
         TabIndex        =   23
         Top             =   480
         Width           =   3975
      End
      Begin VB.PictureBox Picture5 
         Height          =   240
         Left            =   1335
         ScaleHeight     =   1.091
         ScaleMode       =   0  'User
         ScaleWidth      =   1
         TabIndex        =   21
         Top             =   255
         Width           =   3975
      End
      Begin VB.Label Label4 
         Caption         =   "[6012]Skin"
         Height          =   255
         Left            =   0
         TabIndex        =   25
         Top             =   960
         Width           =   1215
      End
      Begin VB.Shape shpSkinSel 
         BorderColor     =   &H80000010&
         BorderStyle     =   6  'Inside Solid
         BorderWidth     =   2
         Height          =   330
         Left            =   1275
         Top             =   915
         Width           =   330
      End
      Begin VB.Label Label7 
         Caption         =   "[6013]Hue"
         Height          =   255
         Left            =   0
         TabIndex        =   18
         Top             =   0
         Width           =   1215
      End
      Begin VB.Label Label8 
         Caption         =   "[6014]Sat"
         Height          =   255
         Left            =   0
         TabIndex        =   22
         Top             =   480
         Width           =   1215
      End
      Begin VB.Label Label10 
         Caption         =   "0"
         Height          =   255
         Left            =   5400
         TabIndex        =   20
         Top             =   0
         Width           =   495
      End
      Begin VB.Label Label11 
         Caption         =   "0"
         Height          =   255
         Left            =   5400
         TabIndex        =   24
         Top             =   480
         Width           =   495
      End
   End
   Begin VB.PictureBox picPage 
      Height          =   1095
      Index           =   2
      Left            =   1920
      ScaleHeight     =   69
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   389
      TabIndex        =   12
      Top             =   360
      Width           =   5895
      Begin VB.PictureBox Picture3 
         Height          =   540
         Left            =   0
         ScaleHeight     =   32
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   32
         TabIndex        =   14
         Top             =   405
         Width           =   540
         Begin VB.Image Image1 
            Height          =   375
            Left            =   0
            Top             =   0
            Width           =   375
         End
      End
      Begin VB.CheckBox chkHideBar 
         Caption         =   "[6015]HideBar"
         Height          =   255
         Left            =   720
         TabIndex        =   16
         Top             =   720
         Width           =   5175
      End
      Begin VB.CheckBox chkSounds 
         Caption         =   "[6009]NoSounds"
         Height          =   255
         Left            =   0
         TabIndex        =   13
         Top             =   0
         Width           =   5895
      End
      Begin VB.CheckBox chkNiceBar 
         Caption         =   "[6010]NiceBar"
         Height          =   255
         Left            =   720
         TabIndex        =   15
         Top             =   360
         Width           =   5175
      End
   End
   Begin VB.PictureBox picPage 
      Height          =   735
      Index           =   1
      Left            =   360
      ScaleHeight     =   675
      ScaleWidth      =   5835
      TabIndex        =   9
      Top             =   1440
      Width           =   5895
      Begin VB.PictureBox Picture1 
         BorderStyle     =   0  'None
         Height          =   330
         Left            =   0
         ScaleHeight     =   22
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   17
         TabIndex        =   0
         Top             =   360
         Width           =   255
      End
      Begin VB.PictureBox Picture2 
         BorderStyle     =   0  'None
         Height          =   330
         Left            =   0
         ScaleHeight     =   22
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   17
         TabIndex        =   33
         Top             =   0
         Width           =   255
      End
      Begin VB.CheckBox chkMIRC 
         Caption         =   "[6006]Send to mIRC"
         Height          =   255
         Left            =   360
         TabIndex        =   10
         Top             =   0
         Width           =   5535
      End
      Begin VB.CheckBox chkMSN 
         Caption         =   "[6007]Send to MSN"
         Height          =   255
         Left            =   360
         TabIndex        =   11
         Top             =   360
         Width           =   5535
      End
   End
   Begin VB.PictureBox picPage 
      Height          =   1095
      Index           =   0
      Left            =   360
      ScaleHeight     =   1035
      ScaleWidth      =   5835
      TabIndex        =   2
      Top             =   360
      Width           =   5895
      Begin VB.TextBox txtXFile 
         Height          =   285
         Left            =   3120
         TabIndex        =   4
         Top             =   0
         Width           =   2775
      End
      Begin VB.CheckBox chkReload 
         Caption         =   "[6004]reload"
         Height          =   255
         Left            =   0
         TabIndex        =   8
         Top             =   720
         Width           =   5895
      End
      Begin VB.TextBox txtReps 
         Height          =   285
         Left            =   3120
         TabIndex        =   6
         Top             =   360
         Width           =   735
      End
      Begin VB.Label Label1 
         Caption         =   "[6001]ROM database"
         Height          =   255
         Left            =   0
         TabIndex        =   3
         Top             =   0
         Width           =   2295
      End
      Begin VB.Label Label2 
         Caption         =   "[6002]Repeats"
         Height          =   255
         Left            =   0
         TabIndex        =   5
         Top             =   360
         Width           =   2295
      End
      Begin VB.Label Label3 
         Caption         =   "[6003]infinite"
         Height          =   255
         Left            =   3960
         TabIndex        =   7
         Top             =   360
         Width           =   1935
      End
   End
   Begin Sappy2k6.MSNList MSNList1 
      Height          =   3735
      Left            =   120
      TabIndex        =   34
      Top             =   120
      Width           =   1815
      _ExtentX        =   3201
      _ExtentY        =   6588
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin Sappy2k6.SkinButton Command1 
      Cancel          =   -1  'True
      Height          =   375
      Left            =   6840
      TabIndex        =   32
      Top             =   3480
      Width           =   1095
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
      Caption         =   "[5]"
   End
   Begin Sappy2k6.SkinButton cmdOK 
      Default         =   -1  'True
      Height          =   375
      Left            =   5640
      TabIndex        =   31
      Top             =   3480
      Width           =   1095
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
      Caption         =   "[4]"
   End
   Begin VB.Line Line10 
      BorderColor     =   &H80000014&
      X1              =   136
      X2              =   529
      Y1              =   225
      Y2              =   225
   End
   Begin VB.Line Line9 
      BorderColor     =   &H80000010&
      X1              =   136
      X2              =   529
      Y1              =   224
      Y2              =   224
   End
   Begin VB.Label lblHeader 
      AutoSize        =   -1  'True
      Caption         =   "foo"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   2160
      TabIndex        =   1
      Top             =   135
      Width           =   270
   End
   Begin VB.Line Line6 
      BorderColor     =   &H80000010&
      X1              =   136
      X2              =   529
      Y1              =   16
      Y2              =   16
   End
   Begin VB.Line Line5 
      BorderColor     =   &H80000014&
      X1              =   136
      X2              =   529
      Y1              =   17
      Y2              =   17
   End
End
Attribute VB_Name = "frmOptions"
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
'|  Options dialog  |
'|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|
'| Code 100% by Kyoufu Kawa.                          |
'| Last update: April 1st, 2006                       |
'|____________________________________________________|
'
'###########################################################################################
Option Explicit

Implements ISubclass
Private e_mr As EMsgResponse
Private Const WM_MOUSEWHEEL As Long = &H20A

Private Sub cbxPresets_Click()
  Dim r As Long, g As Long, b As Long, H As Single, l As Single, s As Single
  SplitRGB cbxPresets.ItemData(cbxPresets.ListIndex), r, g, b
  RGBToHLS r, g, b, H, l, s
  HScroll1.Value = (H * 10) ' - 1
  HScroll2.Value = (s * 10) ' - 1
End Sub

Private Sub chkNiceBar_Click()
  Image1.left = IIf(chkNiceBar.Value = 1, -32, 0)
End Sub

Private Sub cmdOK_Click()
  Dim i As Integer
  
  i = Int(txtReps.Text)
  
  frmSappy.xfile = App.Path & "\" & txtXFile.Text
  WriteSetting "XML File", txtXFile.Text
  WriteSettingI "Reload ROM", chkReload.Value
  WriteSettingI "mIRC Now Playing", chkMIRC.Value
  WriteSettingI "MSN Now Playing", chkMSN.Value
  WriteSettingI "Incessant Sound Override", chkSounds.Value
  WriteSettingI "Force Nice Bar", chkNiceBar.Value
  WriteSettingI "Hide Bar", chkHideBar.Value
  WriteSettingI "Song Repeats", i
  
  WriteSetting "Skin", picSkin(0).Tag
  WriteSetting "Skin Hue", HScroll1.Value / 10
  WriteSetting "Skin Saturation", HScroll2.Value / 10
  
  frmSappy.HandleClassicMode
  frmSappy.FixStatusBar
  frmSappy.ebr.UseExplorerStyle = (chkNiceBar.Value = 0)
  frmSappy.picSkin.Picture = LoadResPicture(100 + Val(picSkin(0).Tag), 0)
  Colorize frmSappy.picSkin, HScroll1.Value / 10, HScroll2.Value / 10
  frmSappy.RedrawSkin
  frmSappy.ebr.Redraw = False
  frmSappy.ebr.BackColorStart = frmSappy.picSkin.point(6, 16)
  frmSappy.ebr.BackColorEnd = frmSappy.picSkin.point(6, 32)
  frmSappy.ebr.Redraw = True
  
  ClickSound
  Unload Me
End Sub

Private Sub Command1_Click()
  ClickSound
  Unload Me
End Sub

Private Sub Form_Load()
  Dim i As Integer
  For i = 0 To picPage.UBound
    picPage(i).BorderStyle = 0
    picPage(i).Visible = False
    picPage(i).Move 136, 32
  Next i
  MSNList1.AddItem LoadResString(6011) 'Playback
  MSNList1.AddItem LoadResString(6005) 'Now Playing
  MSNList1.AddItem LoadResString(6008) 'Interface
  MSNList1.AddItem LoadResString(6012) 'Skin
  'MSNList1.ListIndex = 0
  On Error Resume Next
  i = GetSettingI("Settings Page")
  If i > MSNList1.ListCount - 1 Then i = 0
  MSNList1.ListIndex = i

  AttachMessage Me, hwnd, WM_MOUSEWHEEL
  
  picPage(3).ScaleMode = 3

  SetCaptions Me
  Caption = LoadResString(6000)
  Picture1.Picture = frmSappy.imlStatusbar.ItemPicture(3)
  Picture2.Picture = frmSappy.imlStatusbar.ItemPicture(4)
  
  txtXFile.Text = GetSetting("XML File")
  If txtXFile.Text = "" Then txtXFile.Text = "sappy.xml"
  On Error Resume Next
  chkReload.Value = GetSettingI("Reload ROM")
  chkMIRC.Value = GetSettingI("mIRC Now Playing")
  chkMSN.Value = GetSettingI("MSN Now Playing")
  chkSounds.Value = GetSettingI("Incessant Sound Override")
  chkNiceBar.Value = GetSettingI("Force Nice Bar")
  chkHideBar.Value = GetSettingI("Hide Bar")
  txtReps = GetSettingI("Song Repeats")
  If txtReps = "" Then txtReps = 2
  
  Dim hue As Single, sat As Single, regset As String, skinno As Integer
  'skinno = GetSettingI("Skin")
  regset = GetSetting("Skin")
  If regset <> "" Then skinno = Val(regset) Else skinno = 0
  regset = GetSetting("Skin Hue")
  If regset <> "" Then hue = Val(Replace(regset, ",", ".")) Else hue = 3.4
  regset = GetSetting("Skin Saturation")
  If regset <> "" Then sat = Val(Replace(regset, ",", ".")) Else sat = 0.4
  
  On Error GoTo 0

  Image1.Picture = LoadResPicture("BARSAMPLES", 0)
  Image1.left = IIf(chkNiceBar.Value = 1, -32, 0)
  
  HScroll1.Value = hue * 10
  HScroll2.Value = sat * 10
  
  picSkin(0).Tag = skinno
  shpSkinSel.Move picSkin(skinno).left - 3
  
  Dim r As Long, g As Long, b As Long
  HLSToRGB 3.4, 0.5, 0.4, r, g, b
  cbxPresets.AddItemAndData "MSN-style", , , RGB(r, g, b) '&HB47C30 '508CB4
  HLSToRGB 0, 1, 0, r, g, b
  cbxPresets.AddItemAndData "Grayscale", , , RGB(r, g, b)
  HLSToRGB 0.4, 1, 0.2, r, g, b
  cbxPresets.AddItemAndData "Rusty Nailz", , , RGB(r, g, b)
  HLSToRGB 2.4, 1, 0.3, r, g, b
  cbxPresets.AddItemAndData "Green Dreem", , , RGB(r, g, b)
End Sub

Private Sub Form_Resize()
  If Tag = "repsplz" Then
    MSNList1.ListIndex = 0
    txtReps.SetFocus
    Tag = ""
  End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
  DetachMessage Me, hwnd, WM_MOUSEWHEEL
End Sub

Private Sub HScroll1_Change()
  HScroll1_Scroll
End Sub
Private Sub HScroll2_Change()
  HScroll2_Scroll
End Sub

Private Sub HScroll1_Scroll()
  Dim i As Single
  i = HScroll1.Value / 10
  Label10.Caption = i
  DrawColorBar
End Sub
Private Sub HScroll2_Scroll()
  Dim i As Single
  i = HScroll2.Value / 10
  Label11.Caption = i
  DrawColorBar
End Sub

Private Property Let ISubclass_MsgResponse(ByVal RHS As SSubTimer6.EMsgResponse)
  'This property procedure must exist to properly implement
  'the Subclassing Assistant, even though it does nothing.
End Property

Private Property Get ISubclass_MsgResponse() As SSubTimer6.EMsgResponse
  ISubclass_MsgResponse = emrPostProcess
End Property

Private Function ISubclass_WindowProc(ByVal hwnd As Long, ByVal iMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
  If iMsg = WM_MOUSEWHEEL Then
    If wParam > 0 Then
      MSNList1.ListIndex = IIf(MSNList1.ListIndex > 0, MSNList1.ListIndex - 1, 0)
      MSNList1.Redraw
    ElseIf wParam < 0 Then
      MSNList1.ListIndex = IIf(MSNList1.ListIndex < MSNList1.ListCount - 1, MSNList1.ListIndex + 1, MSNList1.ListCount - 1)
      MSNList1.Redraw
    End If
  End If
End Function

Private Sub MSNList1_Click()
  Dim i As Integer
  For i = 0 To picPage.UBound
    picPage(i).Visible = False
  Next i
  picPage(MSNList1.ListIndex).Visible = True
  lblHeader = " " & MSNList1.List(MSNList1.ListIndex) & " "
  WriteSettingI "Settings Page", MSNList1.ListIndex
End Sub

Private Sub picSkin_Click(Index As Integer)
  shpSkinSel.Move picSkin(Index).left - 3
  picSkin(0).Tag = Index
End Sub

Private Sub picSkin_Paint(Index As Integer)
  picSkinLoad.Picture = LoadResPicture(100 + Index, 0)
  BitBlt picSkin(Index).hdc, 0, 0, 16, 16, picSkinLoad.hdc, 8, 0, vbSrcCopy
End Sub

Private Sub Picture5_Paint()
  DrawColorBar
End Sub

Private Sub txtReps_LostFocus()
  txtReps = Val(txtReps)
End Sub

Private Sub DrawColorBar()
  Dim i As Single
  Dim r As Long, g As Long, b As Long, H As Single, s As Single, c As Long
  Picture5.ScaleWidth = 1
  Picture5.ScaleHeight = 1
  For i = 0 To 1 Step 0.01
    HLSToRGB HScroll1.Value / 10, HScroll2.Value / 10, i, r, g, b
    Picture5.Line (i, 0)-(i + 0.01, 1), RGB(r, g, b), BF
  Next i
End Sub
