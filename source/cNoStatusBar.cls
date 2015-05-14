VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cNoStatusBar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

' =========================================================================
' vbAccelerator NoStatusbar class
' Copyright © 1998-2002 Steve McMahon (steve@vbaccelerator.com)
'
' This class draws a status bar onto a PictureBox, UserControl
' or form.  Code derived from the vbAccelerator Status Bar
' control, a full VB implementation of the COMCTL32.DLL Status Bar.
'
' * Text and icons in panels
' * Simple mode support
' * Height calculation available
' * Size gripper
'
' Visit vbAccelerator at http://vbaccelerator.com
' =========================================================================


' =========================================================================
' Declares, constants and types required for fake status bar:
' =========================================================================
Private Type POINTAPI
   x As Long
   y As Long
End Type
Private Type RECT
   left As Long
   tOp As Long
   Right As Long
   Bottom As Long
End Type
Private Declare Function DrawStatusText Lib "COMCTL32" Alias "DrawStatusTextA" (ByVal hdc As Long, lprc As RECT, ByVal pszText As String, ByVal uFlags As Long) As Long
Private Declare Function ImageList_GetIcon Lib "COMCTL32" (ByVal hImageList As Long, ByVal ImgIndex As Long, ByVal fuFlags As Long) As Long
Private Declare Function ImageList_GetImageCount Lib "COMCTL32.DLL" ( _
        ByVal hIml As Long _
    ) As Long
Private Declare Function ImageList_GetImageRect Lib "COMCTL32.DLL" ( _
        ByVal hIml As Long, _
        ByVal i As Long, _
        prcImage As RECT _
    ) As Long
Private Declare Function ImageList_GetIconSize Lib "COMCTL32.DLL" ( _
        ByVal hIml As Long, _
        ByVal cX As Long, _
        ByVal cY As Long _
    ) As Long
Private Declare Function DrawIconEx Lib "user32" (ByVal hdc As Long, ByVal xLeft As Long, ByVal yTop As Long, ByVal hIcon As Long, ByVal cxWidth As Long, ByVal cyWidth As Long, ByVal istepIfAniCur As Long, ByVal hbrFlickerFreeDraw As Long, ByVal diFlags As Long) As Long
Private Const DI_MASK = &H1
Private Const DI_IMAGE = &H2
Private Const DI_NORMAL = &H3
Private Const DI_COMPAT = &H4
Private Const DI_DEFAULTSIZE = &H8
Private Declare Function DestroyIcon Lib "user32" (ByVal hIcon As Long) As Long
Private Declare Function DrawText Lib "user32" Alias "DrawTextA" (ByVal hdc As Long, ByVal lpStr As String, ByVal nCount As Long, lpRect As RECT, ByVal wFormat As Long) As Long
Private Const DT_CALCRECT = &H400
Private Const DT_CENTER = &H1
Private Const DT_VCENTER = &H4
Private Const DT_SINGLELINE = &H20
Private Const DT_RIGHT = &H2
Private Const DT_BOTTOM = &H8
Private Const DT_WORD_ELLIPSIS = &H40000
Private Declare Function GetClientRect Lib "user32" (ByVal hwnd As Long, lpRect As RECT) As Long
Private Declare Function OffsetRect Lib "user32" (lpRect As RECT, ByVal x As Long, ByVal y As Long) As Long
Private Const SBT_NOBORDERS = &H100
Private Const SBT_POPOUT = &H200
Private Const SBT_RTLREADING = &H400
Private Const SBT_OWNERDRAW = &H1000
Private Declare Function GetSysColorBrush Lib "user32" (ByVal nIndex As Long) As Long
Private Declare Function FillRect Lib "user32" (ByVal hdc As Long, lpRect As RECT, ByVal hBrush As Long) As Long
Private Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long
Private Const COLOR_BTNFACE = 15
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (pDest As Any, pSrc As Any, ByVal ByteLen As Long)

' XP DrawTheme declares for XP version
Private Declare Function GetVersion Lib "kernel32" () As Long
Private Declare Function OpenThemeData Lib "uxtheme.dll" _
   (ByVal hwnd As Long, ByVal pszClassList As Long) As Long
Private Declare Function CloseThemeData Lib "uxtheme.dll" _
   (ByVal hTheme As Long) As Long
Private Declare Function DrawThemeBackground Lib "uxtheme.dll" _
   (ByVal hTheme As Long, ByVal lHDC As Long, _
    ByVal iPartId As Long, ByVal iStateId As Long, _
    pRect As RECT, pClipRect As RECT) As Long
Private Declare Function GetThemeBackgroundContentRect Lib "uxtheme.dll" _
   (ByVal hTheme As Long, ByVal hdc As Long, _
    ByVal iPartId As Long, ByVal iStateId As Long, _
    pBoundingRect As RECT, pContentRect As RECT) As Long
Private Declare Function DrawThemeText Lib "uxtheme.dll" _
   (ByVal hTheme As Long, ByVal hdc As Long, ByVal iPartId As Long, _
    ByVal iStateId As Long, ByVal pszText As Long, _
    ByVal iCharCount As Long, ByVal dwTextFlag As Long, _
    ByVal dwTextFlags2 As Long, pRect As RECT) As Long
Private Declare Function DrawThemeIcon Lib "uxtheme.dll" _
   (ByVal hTheme As Long, ByVal hdc As Long, ByVal iPartId As Long, _
    ByVal iStateId As Long, pRect As RECT, _
    ByVal hIml As Long, ByVal iImageIndex As Long) As Long
Private Const S_OK = 0

' =========================================================================
' Implementation of fake status bar:
' =========================================================================
Public Enum ENSBRPanelStyleConstants
   estbrStandard = &H0&
   estbrNoBorders = SBT_NOBORDERS
   estbrRaisedBorder = SBT_POPOUT
   estbrOwnerDraw = SBT_OWNERDRAW
End Enum
Private Type tStatusPanel
   lID As Long
   sKey As String
   lItemData As Long
   iImgIndex As Long
   hIcon As Long
   sText As String
   sToolTipText As String
   lMinWidth As Long
   lIdealWidth As Long
   lSetWidth As Long
   bSpring As Boolean
   bFit As Boolean
   eStyle As ENSBRPanelStyleConstants
   bState As Boolean
   tR As RECT
End Type
Private m_tPanels() As tStatusPanel
Private m_iPanelCount As Long
Private m_bSizeGrip As Boolean
Private m_hIml As Long
Private m_ptrVb6ImageList As Long
Private m_pic As PictureBox
Private m_lIconSize As Long
Private m_obj As Object
Private m_lLeft As Long, m_lTop As Long
Private m_lHeight As Long
Private m_bSimpleMode As Boolean
Private m_sSimpleText As String

Private m_bIsXpOrAbove As Boolean
Private m_bUseXpStyles As Boolean

Public Event OwnerDraw(ByVal hdc As Long, ByRef iLeft As Long, ByRef iTop As Long, ByRef iRight As Long, ByRef iBottom As Long, ByRef bDoDefault As Boolean)

Private Sub GetWindowsVersion( _
      Optional ByRef lMajor = 0, _
      Optional ByRef lMinor = 0, _
      Optional ByRef lRevision = 0, _
      Optional ByRef lBuildNumber = 0 _
   )
Dim lR As Long
   lR = GetVersion()
   lBuildNumber = (lR And &H7F000000) \ &H1000000
   If (lR And &H80000000) Then lBuildNumber = lBuildNumber Or &H80
   lRevision = (lR And &HFF0000) \ &H10000
   lMinor = (lR And &HFF00&) \ &H100
   lMajor = (lR And &HFF)
End Sub

Public Property Get SimpleMode() As Boolean
   SimpleMode = m_bSimpleMode
End Property
Public Property Let SimpleMode(ByVal bSimple As Boolean)
   m_bSimpleMode = bSimple
   Draw
End Property
Public Property Get SimpleText() As String
   SimpleText = m_sSimpleText
End Property
Public Property Let SimpleText(ByVal sText As String)
   m_sSimpleText = sText
   If (m_bSimpleMode) Then
      Draw
   End If
End Property

Public Property Get AllowXPStyles() As Boolean
   AllowXPStyles = m_bIsXpOrAbove
End Property
Public Property Let AllowXPStyles(ByVal bState As Boolean)
   If (bState) Then
      If Not (m_bIsXpOrAbove) Then
         Err.Raise vbObjectError + 1052, App.EXEName & ".vbalStatusBar", "XP Styles not supported on this Windows installation."
      Else
         m_bUseXpStyles = True
      End If
   Else
      m_bUseXpStyles = False
   End If

End Property

Public Property Let SizeGrip(ByVal bSizeGrip As Boolean)
   m_bSizeGrip = bSizeGrip
   Draw
End Property
Public Property Get SizeGrip() As Boolean
   SizeGrip = m_bSizeGrip
End Property

Public Function AddPanel( _
      Optional ByVal eStyle As ENSBRPanelStyleConstants = estbrStandard, _
      Optional ByVal sText As String = "", _
      Optional ByVal iImgIndex As Long = -1, _
      Optional ByVal lMinWidth As Long = 64, _
      Optional ByVal bSpring As Boolean = False, _
      Optional ByVal bFitContents As Boolean = False, _
      Optional ByVal lItemData As Long = 0, _
      Optional ByVal sKey As String = "", _
      Optional ByVal vKeyBefore As Variant _
   ) As Long
Dim iIndex As Long
Dim i As Long
Dim bEnabled As Boolean
Dim tR As RECT
   
   If (m_iPanelCount >= &HFF) Then
      Err.Raise vbObjectError + 1051, App.EXEName & ".vbalStatusBar", "Too many panels."
      Exit Function
   End If
      
   If Not IsMissing(vKeyBefore) Then
      ' Determine if vKeyBefore is valid:
      iIndex = PanelIndex(vKeyBefore)
      If (iIndex > 0) Then
         ' ok. Insert a space:
         m_iPanelCount = m_iPanelCount + 1
         ReDim Preserve m_tPanels(1 To m_iPanelCount) As tStatusPanel
         For i = m_iPanelCount To iIndex + 1 Step -1
            LSet m_tPanels(i) = m_tPanels(i - 1)
         Next i
         m_tPanels(iIndex).hIcon = 0
      Else
         ' Failed
         Exit Function
      End If
   Else
      ' Insert a space at the end:
      m_iPanelCount = m_iPanelCount + 1
      ReDim Preserve m_tPanels(1 To m_iPanelCount) As tStatusPanel
      iIndex = m_iPanelCount
   End If
   
   ' Set up the info:
   If (bSpring) Then
      For i = 1 To m_iPanelCount
         If (i <> iIndex) Then
            m_tPanels(i).bSpring = False
         End If
      Next i
   End If
   
   With m_tPanels(iIndex)
      .bFit = bFitContents
      .bSpring = bSpring
      .eStyle = eStyle
      .iImgIndex = iImgIndex
      .lMinWidth = lMinWidth
      .lItemData = lItemData
      .sKey = sKey
      .sText = sText
   End With
   
   ' Add the information to the status bar:
   pEvaluateIdealSize iIndex
   pResizeStatus
   
   ' Now ensure the text, style, tooltip and icon are actually correct:
   PanelText(iIndex) = m_tPanels(iIndex).sText
   PanelIcon(iIndex) = m_tPanels(iIndex).iImgIndex
      
   Draw
   
End Function

Public Sub Draw()
Dim i As Long, iEnd As Long
Dim lHDC As Long
Dim lX As Long, lY As Long
Dim hBr As Long, tR As RECT, tOR As RECT, tBR As RECT
Dim fntThis As StdFont
Dim bEnd As Boolean
Dim hTheme As Long
Dim hR As Long
Dim rc As RECT
Dim rcContent As RECT
Dim bUseXpStyles As Boolean
Dim bDoDefault As Boolean
   bDoDefault = True
   
   GetClientRect m_obj.hwnd, tR
   
   If (m_bUseXpStyles) Then
      bUseXpStyles = True
      hTheme = OpenThemeData(m_obj.hwnd, StrPtr("Status"))
      If (hTheme = 0) Then
         bUseXpStyles = False
      Else
         ' draw the background for the status bar:
         hR = DrawThemeBackground(hTheme, m_obj.hdc, 4, 0, tR, tR)
         If (hR <> S_OK) Then
            bUseXpStyles = False
         End If
      End If
   End If
   
   If Not (bUseXpStyles) Then
      hBr = GetSysColorBrush(COLOR_BTNFACE)
      FillRect m_obj.hdc, tR, hBr
      DeleteObject hBr
   End If

   LSet tOR = tR

   pResizeStatus
   lHDC = m_obj.hdc
   If (m_bSimpleMode) Then
      If (bUseXpStyles) Then
         hR = DrawThemeBackground(hTheme, m_obj.hdc, 2, _
                0, tR, tR)
         hR = GetThemeBackgroundContentRect(hTheme, _
                m_obj.hdc, 2, 0, tR, rcContent)
         hR = DrawThemeText(hTheme, m_obj.hdc, 2, 0, _
                StrPtr(" " & m_sSimpleText), -1, _
                DT_VCENTER Or DT_SINGLELINE, _
                0, rcContent)
      Else
         DrawText lHDC, m_sSimpleText, -1, _
            tR, DT_VCENTER Or DT_SINGLELINE
      End If
   Else
      Dim iPart As Long
      For i = 1 To m_iPanelCount
         If (i = m_iPanelCount) Then
            iPart = 2
         Else
            iPart = 1
         End If
         With m_tPanels(i)
            LSet tBR = .tR
            If (tBR.Right > tOR.Right) Then
               tBR.Right = tOR.Right - 1
               bEnd = True
            End If
            If (.hIcon <> 0) Then
               If Not (bUseXpStyles) Then
                  DrawStatusText lHDC, tBR, "", .eStyle
                  If (.eStyle And estbrOwnerDraw) = estbrOwnerDraw Then
                     RaiseEvent OwnerDraw(lHDC, tBR.left, tBR.tOp, tBR.Right, tBR.Bottom, bDoDefault)
                  End If
                  If bDoDefault Then
                     ' Draw the icon:
                     lY = tBR.tOp + 1 + (tBR.Bottom - tBR.tOp - 2 - m_lIconSize) \ 2
                     lX = tBR.left + 2
                     DrawIconEx lHDC, lX, lY, .hIcon, m_lIconSize, m_lIconSize, 0, 0, DI_NORMAL
                     ' Draw the text:
                     If (Len(.sText) > 0) Then
                        tBR.left = tBR.left + m_lIconSize + 4
                        DrawText lHDC, .sText, -1, tBR, DT_VCENTER Or DT_SINGLELINE Or DT_WORD_ELLIPSIS
                     End If
                  End If
               Else
                  hR = DrawThemeBackground(hTheme, m_obj.hdc, iPart, _
                               0, tBR, tBR)
                  If (.eStyle And estbrOwnerDraw) = estbrOwnerDraw Then
                     RaiseEvent OwnerDraw(lHDC, tBR.left, tBR.tOp, tBR.Right, tBR.Bottom, bDoDefault)
                  End If
                  If bDoDefault Then
                     hR = GetThemeBackgroundContentRect(hTheme, _
                               m_obj.hdc, iPart, 0, tBR, rcContent)
                     
                     ' Fails...
                     'hR = DrawThemeIcon(hTheme, m_obj.hdc, 0, _
                     '            0, tBR, m_hIml, .iImgIndex)
                     lY = tBR.tOp + 2 + (tBR.Bottom - tBR.tOp - 2 - m_lIconSize) \ 2
                     lX = tBR.left + 2
                     DrawIconEx lHDC, lX, lY, .hIcon, m_lIconSize, m_lIconSize, 0, 0, DI_NORMAL
                     rcContent.left = rcContent.left + m_lIconSize + 4
                     hR = DrawThemeText(hTheme, m_obj.hdc, 1, 0, _
                               StrPtr(" " & .sText), -1, _
                               DT_VCENTER Or DT_SINGLELINE Or DT_WORD_ELLIPSIS, _
                               0, rcContent)
                  End If
               End If
            Else
               If Not (bUseXpStyles) Then
                  If (.eStyle And estbrOwnerDraw) = estbrOwnerDraw Then
                     DrawStatusText lHDC, tBR, "", .eStyle
                     RaiseEvent OwnerDraw(lHDC, tBR.left, tBR.tOp, tBR.Right, tBR.Bottom, bDoDefault)
                  End If
                  If bDoDefault Then
                     DrawStatusText lHDC, tBR, .sText, .eStyle
                  End If
               Else
                  hR = DrawThemeBackground(hTheme, m_obj.hdc, iPart, _
                               0, tBR, tBR)
                  If (.eStyle And estbrOwnerDraw) = estbrOwnerDraw Then
                     RaiseEvent OwnerDraw(lHDC, tBR.left, tBR.tOp, tBR.Right, tBR.Bottom, bDoDefault)
                  End If
                  If bDoDefault Then
                     hR = GetThemeBackgroundContentRect(hTheme, _
                               m_obj.hdc, iPart, 0, tBR, rcContent)
               
                     hR = DrawThemeText(hTheme, m_obj.hdc, 1, 0, _
                               StrPtr(" " & .sText), -1, _
                               DT_VCENTER Or DT_SINGLELINE, _
                               0, rcContent)
                  End If
               End If
            End If
            If bEnd Then
               Exit For
            End If
         End With
      Next i
   
   End If
   
   If (m_bSizeGrip) Then
      If (bUseXpStyles) Then
         LSet tOR = tR
         tOR.left = tR.Right - (tR.Bottom - tR.tOp)
         hR = DrawThemeBackground(hTheme, m_obj.hdc, 3, _
                  0, tOR, tOR)
      Else
         Set fntThis = New StdFont
         With fntThis
            .name = m_obj.Font.name
            .Size = m_obj.Font.Size
            .Bold = m_obj.Font.Bold
            .Italic = m_obj.Font.Italic
            .Underline = m_obj.Font.Underline
         End With
         m_obj.Font.name = "Marlett"
         m_obj.Font.Size = fntThis.Size * 4 / 3
         m_obj.ForeColor = vb3DHighlight
         OffsetRect tOR, -2, -1
         DrawText lHDC, "o", 1, tOR, DT_BOTTOM Or DT_RIGHT Or DT_SINGLELINE
         m_obj.ForeColor = vbButtonShadow
         'OffsetRect tOR, 1, 0
         DrawText lHDC, "p", 1, tOR, DT_BOTTOM Or DT_RIGHT Or DT_SINGLELINE
         Set m_obj.Font = fntThis
         m_obj.ForeColor = vbWindowText
      End If
   End If
   
   If (hTheme) Then
      CloseThemeData hTheme
   End If
   
End Sub

Public Function RemovePanel( _
      ByVal vKey As Variant _
   )
Dim iIndex As Long
Dim i As Long
   iIndex = PanelIndex(vKey)
   If (iIndex > 0) Then
      If (m_tPanels(iIndex).hIcon <> 0) Then
         DestroyIcon m_tPanels(iIndex).hIcon
      End If
      For i = iIndex To m_iPanelCount - 1
         LSet m_tPanels(i) = m_tPanels(i + 1)
      Next i
      m_iPanelCount = m_iPanelCount - 1
      If (m_iPanelCount > 0) Then
         ReDim Preserve m_tPanels(1 To m_iPanelCount) As tStatusPanel
      End If
      Draw
   End If
End Function


Public Sub SetLeftTopOffsets(ByVal lLeft As Long, ByVal lTop As Long)
   m_lLeft = lLeft
   m_lTop = lTop
End Sub

Public Property Let ImageList( _
        ByRef vImageList As Variant _
    )
    m_hIml = 0
    m_ptrVb6ImageList = 0
    If (VarType(vImageList) = vbLong) Then
        ' Assume a handle to an image list:
        m_hIml = vImageList
    ElseIf (VarType(vImageList) = vbObject) Then
        ' Assume a VB image list:
        On Error Resume Next
        ' Get the image list initialised..
        vImageList.ListImages(1).Draw 0, 0, 0, 1
        m_hIml = vImageList.hImageList
        If (Err.Number = 0) Then
            ' Check for VB6 image list:
            If (TypeName(vImageList) = "ImageList") Then
                If (vImageList.ListImages.count <> ImageList_GetImageCount(m_hIml)) Then
                    Dim O As Object
                    Set O = vImageList
                    m_ptrVb6ImageList = ObjPtr(O)
                End If
            End If
        Else
            Trace "Failed to Get Image list Handle", "cVGrid.ImageList"
        End If
        On Error GoTo 0
    End If
    If (m_hIml <> 0) Then
        If (m_ptrVb6ImageList <> 0) Then
            m_lIconSize = vImageList.ImageHeight
        Else
            Dim rc As RECT
            ImageList_GetImageRect m_hIml, 0, rc
            m_lIconSize = rc.Bottom - rc.tOp
        End If
    End If
End Property

Public Sub Create(ByRef objThis As Object)
Dim lHDC As Long
Dim lWidth As Long
Dim lHeight As Long
Dim tR As RECT

   Set m_obj = objThis
   
   ' Check if required methods are supported:
   On Error Resume Next
   lHDC = m_obj.hdc
   lWidth = m_obj.ScaleWidth
   lHeight = m_obj.ScaleHeight
   If (Err.Number <> 0) Then
      Set m_obj = Nothing
      Err.Raise 9, App.EXEName & ".cNoStatusBar", "Invalid object passed to Create."
   Else
      ' Get the height of the font and store:
      DrawText lHDC, "Xy", 2, tR, DT_CALCRECT
      m_lHeight = tR.Bottom - tR.tOp + 10
   End If
   
End Sub

Public Property Set Font(ByRef fntThis As StdFont)
Dim tR As RECT
   Set m_obj.Font = fntThis
   ' Get the height of the font and store:
   DrawText m_obj.hdc, "Xy", 2, tR, DT_CALCRECT
   m_lHeight = tR.Bottom - tR.tOp + 10
End Property
Public Property Get Font() As StdFont
   Font = m_obj.Font
End Property

Public Property Get Height() As Long
   Height = m_lHeight * Screen.TwipsPerPixelY
End Property

Public Property Get PanelCount() As Long
   PanelCount = m_iPanelCount
End Property
Public Sub GetPanelRect( _
      ByVal vKey As Variant, _
      Optional ByRef iLeftPixels As Long, _
      Optional ByRef iTopPixels As Long, _
      Optional ByRef iRightPixels As Long, _
      Optional ByRef iBottomPixels As Long _
   )
Dim iPanel As Long
Dim tR As RECT
   iPanel = PanelIndex(vKey)
   If (iPanel > 0) Then
      With m_tPanels(iPanel).tR
         iLeftPixels = .left
         iTopPixels = .tOp
         iRightPixels = .Right
         iBottomPixels = .Bottom
      End With
   End If
End Sub

Public Property Get PanelKey(ByVal lIndex As Long) As Variant
Dim iPanel As Long
   If (lIndex > 0) And (lIndex <= m_iPanelCount) Then
      PanelKey = m_tPanels(lIndex).sKey
   Else
      Err.Raise vbObjectError + 1050, App.EXEName & ".vbalStatusBar", "Invalid Panel Index: " & lIndex
   End If
   
End Property
Public Property Let PanelKey(ByVal lIndex As Long, ByVal vKey As Variant)
   If (lIndex > 0) And (lIndex <= m_iPanelCount) Then
      m_tPanels(lIndex).sKey = vKey
   Else
      Err.Raise vbObjectError + 1050, App.EXEName & ".vbalStatusBar", "Invalid Panel Index: " & lIndex
   End If
   
End Property
Public Property Get PanelExists(ByVal vKey As Variant) As Long
   On Error Resume Next
   Dim i As Long
   i = PanelIndex(vKey)
   PanelExists = ((i > 0) And (Err.Number = 0))
   Err.Clear
   On Error GoTo 0
End Property
Public Property Get PanelIndex(ByVal vKey As Variant) As Long
Dim i As Long
Dim iFound As Long

   If (IsNumeric(vKey)) Then
      If (vKey > 0) And (vKey <= m_iPanelCount) Then
         PanelIndex = vKey
      Else
         Err.Raise vbObjectError + 1050, App.EXEName & ".vbalStatusBar", "Invalid Panel Index: " & vKey
      End If
   Else
      For i = 1 To m_iPanelCount
         If m_tPanels(i).sKey = vKey Then
            iFound = i
            Exit For
         End If
      Next i
      If (iFound > 0) Then
         PanelIndex = iFound
      Else
         Err.Raise vbObjectError + 1050, App.EXEName & ".vbalStatusBar", "Invalid Panel Index: " & vKey
      End If
   End If
   
End Property
Public Property Let PanelText(ByVal vKey As Variant, ByVal sText As String)
Dim iPanel As Long
Dim iPartuType As Long
Dim lR As Long
   iPanel = PanelIndex(vKey)
   If (iPanel > 0) Then
      m_tPanels(iPanel).sText = sText
      Draw
   End If
End Property
Public Property Get PanelText(ByVal vKey As Variant) As String
Dim iPanel As Long
   iPanel = PanelIndex(vKey)
   If (iPanel > 0) Then
      PanelText = m_tPanels(iPanel).sText
   End If
End Property
Public Property Let PanelSpring(ByVal vKey As Variant, ByVal bState As Boolean)
Dim iPanel As Long
Dim i As Long
   iPanel = PanelIndex(vKey)
   If (iPanel > 0) Then
      If (m_tPanels(iPanel).bSpring <> bState) Then
         For i = 1 To m_iPanelCount
            If i = iPanel Then
               m_tPanels(iPanel).bSpring = bState
            Else
               m_tPanels(iPanel).bSpring = False
            End If
         Next i
         pEvaluateIdealSize iPanel
         pResizeStatus
      End If
   End If
End Property
Public Property Get PanelSpring(ByVal vKey As Variant) As Boolean
Dim iPanel As Long
   iPanel = PanelIndex(vKey)
   If (iPanel > 0) Then
      PanelSpring = m_tPanels(iPanel).bSpring
   End If
End Property
Public Property Let PanelFitToContents(ByVal vKey As Variant, ByVal bState As Boolean)
Dim iPanel As Long
   iPanel = PanelIndex(vKey)
   If (iPanel > 0) Then
      If (m_tPanels(iPanel).bFit <> bState) Then
         m_tPanels(iPanel).bFit = bState
         pEvaluateIdealSize iPanel
         pResizeStatus
      End If
   End If
End Property
Public Property Get PanelFitToContents(ByVal vKey As Variant) As Boolean
Dim iPanel As Long
   iPanel = PanelIndex(vKey)
   If (iPanel > 0) Then
      PanelFitToContents = m_tPanels(iPanel).bFit
   End If
End Property
Public Property Get PanelIcon(ByVal vKey As Variant) As Long
Dim iPanel As Long
   iPanel = PanelIndex(vKey)
   If (iPanel > 0) Then
      PanelIcon = m_tPanels(iPanel).iImgIndex
   End If
End Property
Public Property Get PanelhIcon(ByVal vKey As Variant) As Long
Dim iPanel As Long
   iPanel = PanelIndex(vKey)
   If (iPanel > 0) Then
      ' Returns a hIcon if any:
      PanelhIcon = m_tPanels(iPanel).hIcon
   End If
End Property
Public Property Let PanelIcon(ByVal vKey As Variant, ByVal iImgIndex As Long)
Dim iPanel As Long
   iPanel = PanelIndex(vKey)
   If (iPanel > 0) Then
      If (m_tPanels(iPanel).hIcon <> 0) Then
         DestroyIcon m_tPanels(iPanel).hIcon
      End If
      m_tPanels(iPanel).hIcon = 0
      m_tPanels(iPanel).iImgIndex = iImgIndex
      If (iImgIndex > -1) Then
         Dim hIcon As Long
         If Not (m_ptrVb6ImageList = 0) Then
            Dim O As Object
            On Error Resume Next
            Set O = ObjectFromPtr(m_ptrVb6ImageList)
            If Not (O Is Nothing) Then
                hIcon = O.ListImages(iImgIndex + 1).ExtractIcon()
            End If
            On Error GoTo 0
         Else
            ' extract a copy of the icon and add to sbar:
            hIcon = ImageList_GetIcon(m_hIml, iImgIndex, 0)
         End If
         m_tPanels(iPanel).hIcon = hIcon
      End If
      Draw
   End If
End Property
Private Property Get ObjectFromPtr(ByVal lPtr As Long) As Object
Dim oTemp As Object
   CopyMemory oTemp, lPtr, 4
   Set ObjectFromPtr = oTemp
   CopyMemory oTemp, 0&, 4
End Property
Public Property Let PanelhIcon(ByVal vKey As Variant, ByVal hIcon As Long)
Dim iPanel As Long
   iPanel = PanelIndex(vKey)
   If (iPanel > 0) Then
      ' Destroy existing hIcon:
      If (m_tPanels(iPanel).hIcon <> 0) Then
         DestroyIcon m_tPanels(iPanel).hIcon
      End If
      m_tPanels(iPanel).hIcon = hIcon
      Draw
   End If
End Property
Public Property Let PanelStyle(ByVal vKey As Variant, ByVal eStyle As ENSBRPanelStyleConstants)
Dim iPanel As Long
   iPanel = PanelIndex(vKey)
   If (iPanel > 0) Then
      iPanel = iPanel - 1
      m_tPanels(iPanel).eStyle = eStyle
      Draw
   End If
End Property
Public Property Get PanelStyle(ByVal vKey As Variant) As ENSBRPanelStyleConstants
Dim iPanel As Long
   iPanel = PanelIndex(vKey)
   If (iPanel > 0) Then
      PanelStyle = m_tPanels(iPanel).eStyle
   End If
End Property
Public Property Get PanelMinWidth(ByVal vKey As Variant) As Long
Dim iPanel As Long
   iPanel = PanelIndex(vKey)
   If (iPanel > 0) Then
      PanelMinWidth = m_tPanels(iPanel).lMinWidth
   End If
End Property
Public Property Get PanelIdealWidth(ByVal vKey As Variant) As Long
Dim iPanel As Long
   iPanel = PanelIndex(vKey)
   If (iPanel > 0) Then
      PanelIdealWidth = m_tPanels(iPanel).lIdealWidth
   End If
End Property
Public Property Let PanelIdealWidth(ByVal vKey As Variant, ByVal lWidth As Long)
Dim iPanel As Long
   iPanel = PanelIndex(vKey)
   If (iPanel > 0) Then
      m_tPanels(iPanel).lIdealWidth = lWidth
      pResizeStatus
   End If
End Property
Private Sub pEvaluateIdealSize( _
      ByVal iStartPanel As Long, _
      Optional ByVal iEndPanel As Long = -1 _
   )
Dim i As Long
Dim tR As RECT
Dim lHDC As Long

   If (m_iPanelCount > 0) Then
      If (iEndPanel < iStartPanel) Then
         iEndPanel = iStartPanel
      End If
      lHDC = m_obj.hdc
      For i = iStartPanel To iEndPanel
         DrawText lHDC, m_tPanels(i).sText, Len(m_tPanels(i).sText), tR, DT_CALCRECT
         m_tPanels(i).lIdealWidth = tR.Right - tR.left + 12
         If (m_tPanels(i).lIdealWidth < m_tPanels(i).lMinWidth) Then
            m_tPanels(i).lIdealWidth = m_tPanels(i).lMinWidth
         End If
      Next i
   End If
End Sub
Private Sub pResizeStatus()
Dim tR As RECT
Dim i As Long
Dim iSpringIndex As Long
Dim lpParts() As Long
   
   If (m_iPanelCount > 0) Then
      
      GetClientRect m_obj.hwnd, tR
      tR.left = tR.left + m_lLeft
      tR.tOp = tR.tOp + m_lTop
      
      ' Initiallly set to minimum widths:
      ReDim lpParts(0 To m_iPanelCount - 1) As Long
      If (m_tPanels(1).bFit) Then
         lpParts(0) = m_tPanels(1).lIdealWidth
      Else
         lpParts(0) = m_tPanels(1).lMinWidth
      End If
      If (m_tPanels(1).hIcon) Then
         lpParts(0) = lpParts(0) + m_lIconSize
      End If
      If (m_tPanels(1).bSpring) Then
         iSpringIndex = 1
      End If
      For i = 2 To m_iPanelCount
         If (m_tPanels(i).bFit) Then
            lpParts(i - 1) = lpParts(i - 2) + m_tPanels(i).lIdealWidth
         Else
            lpParts(i - 1) = lpParts(i - 2) + m_tPanels(i).lMinWidth
         End If
         If (m_tPanels(i).bSpring) Then
            iSpringIndex = i
         End If
         If (m_tPanels(i).hIcon <> 0) Then
            ' Add space for the icon:
            lpParts(i - 1) = lpParts(i - 1) + m_lIconSize
         End If
         If (i = m_iPanelCount) Then
            lpParts(i - 1) = lpParts(i - 1) + (tR.Bottom - tR.tOp) \ 2
         End If
      Next i
      
      ' Will all bars fit in at maximum size?
      If (lpParts(m_iPanelCount - 1) > tR.Right) Then
         ' Draw all panels at min width
      Else
         ' Spring the spring panel to fit:
         If (iSpringIndex = 0) Then
            iSpringIndex = m_iPanelCount
         End If
         lpParts(iSpringIndex - 1) = lpParts(iSpringIndex - 1) + (tR.Right - lpParts(m_iPanelCount - 1))
         For i = iSpringIndex + 1 To m_iPanelCount
            If (m_tPanels(i).bFit) Then
               lpParts(i - 1) = lpParts(i - 2) + m_tPanels(i).lIdealWidth
            Else
               lpParts(i - 1) = lpParts(i - 2) + m_tPanels(i).lMinWidth
            End If
            If (m_tPanels(i).hIcon <> 0) Then
               ' Add space for the icon:
               lpParts(i - 1) = lpParts(i - 1) + m_lIconSize
            End If
            If (i = m_iPanelCount) Then
               lpParts(i - 1) = lpParts(i - 1) + (tR.Bottom - tR.tOp) \ 2
            End If
         Next i
      End If
      
      m_tPanels(1).lSetWidth = lpParts(0)
      For i = 2 To m_iPanelCount
         m_tPanels(i).lSetWidth = lpParts(i - 1) - lpParts(i - 2)
      Next i
      
      ' Set the sizes:
      For i = 1 To m_iPanelCount
         With m_tPanels(i).tR
            If (i = 1) Then
               .left = tR.left
            Else
               .left = lpParts(i - 2)
            End If
            If (i = m_iPanelCount) Then
               .Right = lpParts(i - 1)
            Else
               .Right = lpParts(i - 1) - 1
            End If
            .tOp = tR.tOp
            .Bottom = tR.Bottom
         End With
      Next i
      
   End If
   
End Sub


Private Sub Class_Initialize()
   Dim lMajor As Long
   Dim lMinor As Long
   GetWindowsVersion lMajor, lMinor
   If (lMajor > 5) Then
      m_bIsXpOrAbove = True
   ' Fix for W2k bug:
   ElseIf (lMajor = 5) And (lMinor >= 1) Then
      m_bIsXpOrAbove = True
   End If
   If (m_bIsXpOrAbove) Then
      m_bUseXpStyles = True
   End If
End Sub

Private Sub Class_Terminate()
Dim i As Long
Dim lR As Long
   ' Delete any icons owned by the sbar:
   For i = 1 To m_iPanelCount
      If (m_tPanels(i).hIcon <> 0) Then
         lR = DestroyIcon(m_tPanels(i).hIcon)
         m_tPanels(i).hIcon = 0
      End If
   Next i
End Sub
