Attribute VB_Name = "modSappy"
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
' __________________________________
'|  Support functions and API shit  |
'|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|
'| Code-by-Kawa % impossible to gauge.                |
'| Last update: September 21st, 2006                  |
'|____________________________________________________|
'
'###########################################################################################

Option Explicit

Public Declare Function BitBlt Lib "gdi32.dll" (ByVal hDestDC As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Public Declare Function StretchBlt Lib "gdi32.dll" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal nSrcWidth As Long, ByVal nSrcHeight As Long, ByVal dwRop As Long) As Long
Public Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)
Public Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Public Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Public Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal y As Long, ByVal cX As Long, ByVal cY As Long, ByVal wFlags As Long) As Long
Public Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long
Public Declare Function GetComputerName Lib "kernel32.dll" Alias "GetComputerNameA" (ByVal lpBuffer As String, ByRef nSize As Long) As Long
Public Declare Function GetWindowsDirectory Lib "kernel32.dll" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Public Declare Function GetUserName Lib "advapi32.dll" Alias "GetUserNameA" (ByVal lpBuffer As String, ByRef nSize As Long) As Long
Public Declare Function GetVersion Lib "kernel32.dll" () As Long
Public Declare Function InitCommonControlsEx Lib "COMCTL32.DLL" (iccex As tagInitCommonControlsEx) As Boolean
Public Declare Function LoadImageAsString Lib "user32" Alias "LoadImageA" (ByVal hInst As Long, ByVal lpsz As String, ByVal uType As Long, ByVal cxDesired As Long, ByVal cyDesired As Long, ByVal fuLoad As Long) As Long
Public Declare Function SendMessageLong Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Public Declare Function GetWindow Lib "user32" (ByVal hwnd As Long, ByVal wCmd As Long) As Long
Public Declare Function GetSystemMetrics Lib "user32" (ByVal nIndex As Long) As Long
Public Declare Function GetUserDefaultLCID Lib "kernel32" () As Long
Public Declare Function FillRect Lib "user32.dll" (ByVal hdc As Long, ByRef lpRect As RECT, ByVal hBrush As Long) As Long

Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Private Declare Function FindWindowEx Lib "user32" Alias "FindWindowExA" (ByVal hWnd1 As Long, ByVal hWnd2 As Long, ByVal lpsz1 As String, ByVal lpsz2 As String) As Long

Public Type RECT
  left As Long
  tOp As Long
  Right As Long
  Bottom As Long
End Type

Private Type COPYDATASTRUCT
 dwData As Long
 cbData As Long
 lpData As Long
End Type

Private Const WM_COPYDATA = &H4A

Public Declare Function sndPlaySound Lib "winmm.dll" Alias "sndPlaySoundA" (ByVal lpszSoundName As String, ByVal uFlags As Long) As Long
Public Const SND_ASYNC As Long = &H1

Public Const SWP_NOMOVE = &H2
Public Const SWP_NOSIZE = &H1
Public Const GWL_EXSTYLE = (-20)
Public Const WS_EX_CLIENTEDGE = &H200
Public Const WS_EX_STATICEDGE = &H20000
Public Const SWP_FRAMECHANGED = &H20
Public Const SWP_NOACTIVATE = &H10
Public Const SWP_NOZORDER = &H4

'XP styles stuff
Public Type tagInitCommonControlsEx
   lngSize As Long
   lngICC As Long
End Type
Public Const ICC_USEREX_CLASSES = &H200

'Pretty icon stuff
Public Const SM_CXICON = 11
Public Const SM_CYICON = 12

Public Const SM_CXSMICON = 49
Public Const SM_CYSMICON = 50

Public Const LR_DEFAULTCOLOR = &H0
Public Const LR_MONOCHROME = &H1
Public Const LR_COLOR = &H2
Public Const LR_COPYRETURNORG = &H4
Public Const LR_COPYDELETEORG = &H8
Public Const LR_LOADFROMFILE = &H10
Public Const LR_LOADTRANSPARENT = &H20
Public Const LR_DEFAULTSIZE = &H40
Public Const LR_VGACOLOR = &H80
Public Const LR_LOADMAP3DCOLORS = &H1000
Public Const LR_CREATEDIBSECTION = &H2000
Public Const LR_COPYFROMRESOURCE = &H4000
Public Const LR_SHARED = &H8000&

Public Const IMAGE_ICON = 1

Public Const WM_SETICON = &H80

Public Const ICON_SMALL = 0
Public Const ICON_BIG = 1

Public Const GW_OWNER = 4

Private MSNPlaying As Boolean
Private ProperFont As String
Private ProperFontS As Integer

Public Declare Function SetPixel Lib "gdi32.dll" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal crColor As Long) As Long
Public Declare Function GetPixel Lib "gdi32.dll" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long) As Long

Public Sub Main()
  Trace "This is " & App.ProductName & " version " & App.Major & "." & App.Minor & "." & App.Revision
  Trace "----------------------------------------"
  Trace "Startup Procedure Engaged!"
  Trace "Calling InitCommonControlsVB"
  InitCommonControlsVB
  Trace "Retrieving font data from Registry"
  ProperFont = GetSetting("Window Font")
  If ProperFont = "" Then ProperFont = "Lucida Sans Unicode"
  ProperFontS = GetSettingI("Window Font Size")
  If ProperFontS = 0 Then ProperFontS = 8
  Trace "On to the main form..."
  frmSappy.Show
End Sub

'-------------------------------
'  SetIcon
'  -------
'
'  Replaces the given window's icon with one loaded from a resource file, and loaded -properly-
'  as to include proper scaling and shadows. VB6 doesn't quite cut it.
'  Does not work in IDE mode, wherein it turns the icon into a generic Windows app icon.
'
'  Found on vbAccellerator.
'
Public Sub SetIcon(ByVal hwnd As Long, ByVal sIconResName As String, Optional ByVal bSetAsAppIcon As Boolean = True)
  Dim lhWndTop As Long
  Dim lhWnd As Long
  Dim cX As Long
  Dim cY As Long
  Dim hIconLarge As Long
  Dim hIconSmall As Long
  
  If (bSetAsAppIcon) Then
    ' Find VB's hidden parent window:
    lhWnd = hwnd
    lhWndTop = lhWnd
    Do While Not (lhWnd = 0)
      lhWnd = GetWindow(lhWnd, GW_OWNER)
      If Not (lhWnd = 0) Then
        lhWndTop = lhWnd
      End If
    Loop
  End If
  
  cX = GetSystemMetrics(SM_CXICON)
  cY = GetSystemMetrics(SM_CYICON)
  hIconLarge = LoadImageAsString(App.hInstance, sIconResName, IMAGE_ICON, cX, cY, LR_SHARED)
  If (bSetAsAppIcon) Then
    SendMessageLong lhWndTop, WM_SETICON, ICON_BIG, hIconLarge
  End If
  SendMessageLong hwnd, WM_SETICON, ICON_BIG, hIconLarge
  
  cX = GetSystemMetrics(SM_CXSMICON)
  cY = GetSystemMetrics(SM_CYSMICON)
  hIconSmall = LoadImageAsString(App.hInstance, sIconResName, IMAGE_ICON, cX, cY, LR_SHARED)
  If (bSetAsAppIcon) Then
    SendMessageLong lhWndTop, WM_SETICON, ICON_SMALL, hIconSmall
  End If
  SendMessageLong hwnd, WM_SETICON, ICON_SMALL, hIconSmall
End Sub

'-------------------------------
'  InitCommonControlsVB
'  --------------------
'
'  Allows the use of XP styles without using any Common Controls.
'
'  Found on vbAccellerator.
'
Public Function InitCommonControlsVB() As Boolean
  On Error Resume Next
  Dim iccex As tagInitCommonControlsEx
  With iccex
    .lngSize = LenB(iccex)
    .lngICC = ICC_USEREX_CLASSES
  End With
  InitCommonControlsEx iccex
  InitCommonControlsVB = (Err.Number = 0)
  On Error GoTo 0
End Function

'-------------------------------
'  FixHex
'  ------
'
'  Given a value and the padding length, returns a padded Hex value.
'
Public Function FixHex(s As Variant, i As Integer)
  Dim Bleh As String
  Bleh = Replace(s, "0x", "&H")
  If left(Bleh, 2) <> "&H" Then
    Bleh = "&H" & Hex(Val(s))
  End If
  FixHex = Right("00000000" & Bleh, i)
  FixHex = Replace(FixHex, "&", "")
  FixHex = Replace(FixHex, "H", "")
End Function

'-------------------------------
'  SetCaptions
'  -----------
'
'  Loads resource strings for each suitable control on a given form and sets its font
'  to whatever your locale needs.
'
Public Sub SetCaptions(target As Form)
  Dim i As Long
  Dim ctl As Object
  On Error Resume Next
  For Each ctl In target.Controls
    If ctl.Tag <> "[NoLocal]" Then
      If left(ctl.Caption, 1) = "[" Then
        i = Val(Mid(ctl.Caption, 2, 4))
        ctl.Caption = LoadResString(i)
      End If
      SetProperFont ctl.Font
    End If
  Next
  On Error GoTo 0
End Sub

'-------------------------------
'  SetProperFont
'  -------------
'
'  Sets a control to the Japanese codepage if running on a Japanese system.
'  This allows the use of DBCS strings in their captions.
'
'  Adapted from an article in the VB docs on MSDN.
'
Public Sub SetProperFont(obj As Object)
  On Error GoTo ErrorSetProperFont
  'If GetUserDefaultLCID = &H411 Then
  If (LoadResString(10000)) = "<JAPPLZ>" Then
    obj.Charset = 128
    obj.name = "MS Gothic" 'ChrW(&HFF2D) + ChrW(&HFF33) + ChrW(&H20) + _
    ChrW(&HFF30) + ChrW(&H30B4) + ChrW(&H30B7) + ChrW(&H30C3) + _
    ChrW(&H30AF)
    obj.Size = 9
  Else 'If (LoadResString(10000)) = "<NLPLZ>" Then
    obj.name = ProperFont '"Lucida Sans Unicode" '"Comic Sans MS"
    obj.Size = ProperFontS
  End If
  Exit Sub
ErrorSetProperFont:
  Err.Number = Err
End Sub

'-------------------------------
'  ClickSound
'  ----------
'
'  Just a macro...
'
Public Sub ClickSound()
  IncessantNoises "ButtonClick"
End Sub

'-------------------------------
'  IncessantNoises
'  ---------------
'
'  Plays the given sound, as specified in the Sounds CPL.
'
Public Sub IncessantNoises(n As String)
  Dim myReg As New cRegistry
  
  If GetSettingI("Incessant Sound Override") Then Exit Sub
  
  With myReg
    .ClassKey = HKEY_CURRENT_USER
    .SectionKey = "AppEvents\Schemes\Apps\Sappy2k5\Sappy2k5-" & n & "\.current"
    .ValueKey = ""
    .ValueType = REG_SZ
    sndPlaySound .Value, SND_ASYNC
  End With
  'Dim s As String
  's = GetSetting("Incessant Sound Override")
  'If s = " 1" Then Exit Sub
  
  's = GetKeyValue(HKEY_CURRENT_USER, "AppEvents\Schemes\Apps\Sappy2k5\Sappy2k5-" & n & "\.current", "")
  'If Trim(s) <> "" Then
  '  sndPlaySound s, SND_ASYNC
  'End If
End Sub

'-------------------------------
'  TellMSN and ShutMSN
'  -------------------
'
'  Wrappers around SetMusicInfo to better manage Now Playing information in MSN Messenger.
'
Public Sub TellMSN(sTitle As String, sArtist As String, sAlbum As String)
  MSNPlaying = True
  SetMusicInfo sArtist, sAlbum, sTitle, "", "{0} - {2} - {1}", True
End Sub
Public Sub ShutMSN()
  If MSNPlaying = False Then
    Trace "Spurious ShutMSN."
    Exit Sub
  End If
  SetMusicInfo "", "", "", "", "", False
  MSNPlaying = False
End Sub

Public Sub SetMusicInfo(ByRef r_sArtist As String, ByRef r_sAlbum As String, ByRef r_sTitle As String, Optional ByRef r_sWMContentID As String = vbNullString, Optional ByRef r_sFormat As String = "{0} - {1}", Optional ByRef r_bShow As Boolean = True)
  Dim udtData As COPYDATASTRUCT
  Dim sBuffer As String
  Dim hMSGRUI As Long
  
  sBuffer = "\0Music\0" & Abs(r_bShow) & "\0" & r_sFormat & "\0" & r_sArtist & "\0" & r_sTitle & "\0" & r_sAlbum & "\0" & r_sWMContentID & "\0" & vbNullChar
  Trace "Sending to Messenger: """ & sBuffer & """"
  
  udtData.dwData = &H547
  udtData.lpData = StrPtr(sBuffer)
  udtData.cbData = LenB(sBuffer)
  
  Do
    hMSGRUI = FindWindowEx(0&, hMSGRUI, "MsnMsgrUIManager", vbNullString)
    If (hMSGRUI > 0) Then Call SendMessage(hMSGRUI, WM_COPYDATA, 0, VarPtr(udtData))
  Loop Until (hMSGRUI = 0)
End Sub

Public Sub DrawSkin(Victim As Object)
  With Victim
    .ScaleMode = 3
    BitBlt .hdc, 0, 0, 2, 2, frmSappy.picSkin.hdc, 6, 0, vbSrcCopy
    StretchBlt .hdc, 2, 0, .ScaleWidth - 4, 2, frmSappy.picSkin.hdc, 6, 2, 2, 2, vbSrcCopy
    BitBlt .hdc, .ScaleWidth - 2, 0, 2, 2, frmSappy.picSkin.hdc, 6, 4, vbSrcCopy
    StretchBlt .hdc, 0, 2, 2, .ScaleHeight - 4, frmSappy.picSkin.hdc, 6, 6, 2, 2, vbSrcCopy
    StretchBlt .hdc, 2, 2, .ScaleWidth - 4, .ScaleHeight - 4, frmSappy.picSkin.hdc, 0, 0, 6, 62, vbSrcCopy
    StretchBlt .hdc, .ScaleWidth - 2, 2, 2, .Height - 4, frmSappy.picSkin.hdc, 6, 8, 2, 2, vbSrcCopy
    BitBlt .hdc, 0, .ScaleHeight - 2, 2, 2, frmSappy.picSkin.hdc, 6, 10, vbSrcCopy
    StretchBlt .hdc, 2, .ScaleHeight - 2, .ScaleWidth - 4, 2, frmSappy.picSkin.hdc, 6, 12, 2, 2, vbSrcCopy
    BitBlt .hdc, .ScaleWidth - 2, .ScaleHeight - 2, 2, 2, frmSappy.picSkin.hdc, 6, 14, vbSrcCopy
  End With
End Sub

Public Sub SetAllSkinButtons(Victim As Form)
'  Dim ct As Control
'  For Each ct In Victim.Controls
'    If TypeName(ct) = "SkinButton" Then ct.SkinDC = frmSappy.picSkin.hdc
'  Next
  Trace "Stop calling SetAllSkinButtons! You don't have to do that anymore! --> Victim: " & Victim.name
End Sub

Public Function InputBox(Prompt As String, Optional Title As String, Optional Default As String) As String
  If Title = "" Then Title = App.Title
  frmInputBox.Label1 = Prompt
  frmInputBox.Caption = Title
  frmInputBox.Text1 = Default
  frmInputBox.Text1.SelStart = 0
  frmInputBox.Text1.SelLength = Len(frmInputBox.Text1)
  frmInputBox.Show 1
  InputBox = frmInputBox.Text1
End Function

Public Function GetSetting(name As String) As String
  Dim myReg As New cRegistry
  With myReg
    .ClassKey = HKEY_CURRENT_USER
    .SectionKey = "Software\Helmeted Rodent\Sappy 2006"
    .ValueKey = name
    .ValueType = REG_SZ
    GetSetting = .Value
  End With
End Function
Public Function GetSettingI(name As String) As Integer
  Dim myReg As New cRegistry
  With myReg
    .ClassKey = HKEY_CURRENT_USER
    .SectionKey = "Software\Helmeted Rodent\Sappy 2006"
    .ValueKey = name
    .ValueType = REG_DWORD
    GetSettingI = .Value
  End With
End Function
Public Sub WriteSetting(name As String, Value)
  Dim myReg As New cRegistry
  With myReg
    .ClassKey = HKEY_CURRENT_USER
    .SectionKey = "Software\Helmeted Rodent\Sappy 2006"
    .ValueKey = name
    .ValueType = REG_SZ
    .Value = Value
  End With
End Sub
Public Sub WriteSettingI(name As String, Value)
  Dim myReg As New cRegistry
  With myReg
    .ClassKey = HKEY_CURRENT_USER
    .SectionKey = "Software\Helmeted Rodent\Sappy 2006"
    .ValueKey = name
    .ValueType = REG_DWORD
    .Value = Int(Value)
  End With
End Sub

