VERSION 5.00
Begin VB.Form fDropShadow 
   AutoRedraw      =   -1  'True
   BorderStyle     =   0  'None
   ClientHeight    =   2085
   ClientLeft      =   6315
   ClientTop       =   4785
   ClientWidth     =   1755
   ControlBox      =   0   'False
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2085
   ScaleWidth      =   1755
   ShowInTaskbar   =   0   'False
   Visible         =   0   'False
End
Attribute VB_Name = "fDropShadow"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" ( _
    lpvDest As Any, lpvSource As Any, ByVal cbCopy As Long)

Private Type SAFEARRAYBOUND
    cElements As Long
    lLbound As Long
End Type
Private Type SAFEARRAY2D
    cDims As Integer
    fFeatures As Integer
    cbElements As Long
    cLocks As Long
    pvData As Long
    Bounds(0 To 1) As SAFEARRAYBOUND
End Type
Private Declare Function VarPtrArray Lib "msvbvm60.dll" Alias "VarPtr" (Ptr() As Any) As Long

Private Type RGBQUAD
    rgbBlue As Byte
    rgbGreen As Byte
    rgbRed As Byte
    rgbReserved As Byte
End Type
Private Type BITMAPINFOHEADER '40 bytes
    biSize As Long
    biWidth As Long
    biHeight As Long
    biPlanes As Integer
    biBitCount As Integer
    biCompression As Long
    biSizeImage As Long
    biXPelsPerMeter As Long
    biYPelsPerMeter As Long
    biClrUsed As Long
    biClrImportant As Long
End Type
Private Type BITMAPINFO
    bmiHeader As BITMAPINFOHEADER
    bmiColors As RGBQUAD
End Type
Private Declare Function CreateCompatibleDC Lib "gdi32" (ByVal hdc As Long) As Long
Private Declare Function GetDC Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function GetDesktopWindow Lib "user32" () As Long
' Note - this is not the declare in the API viewer - modify lplpVoid to be
' Byref so we get the pointer back:
Private Declare Function CreateDIBSection Lib "gdi32" _
    (ByVal hdc As Long, _
    pBitmapInfo As BITMAPINFO, _
    ByVal un As Long, _
    lplpVoid As Long, _
    ByVal handle As Long, _
    ByVal dw As Long) As Long

Private Type SIZEAPI
   cx As Long
   cy As Long
End Type

Private Type POINTAPI
   x As Long
   y As Long
End Type

Private Type RECT
   Left As Long
   Top As Long
   Right As Long
   Bottom As Long
End Type

Private Type BLENDFUNCTION
   BlendOp As Byte
   BlendFlags As Byte
   SourceConstantAlpha As Byte
   AlphaFormat As Byte
End Type

Private Const AC_SRC_OVER As Long = &H0&
Private Const ULW_COLORKEY As Long = &H1&
Private Const ULW_ALPHA As Long = &H2&
Private Const ULW_OPAQUE As Long = &H4&
Private Const AC_SRC_ALPHA = &H1


Private Const WS_EX_TOPMOST As Long = &H8&
Private Const WS_EX_TRANSPARENT  As Long = &H20&
Private Const WS_EX_TOOLWINDOW As Long = &H80&
Private Const WS_EX_LAYERED As Long = &H80000
Private Const WS_POPUP = &H80000000
Private Const WS_VISIBLE = &H10000000
Private Const SPI_GETDROPSHADOW  As Long = &H1024&

Private Declare Function CreateWindowEX Lib "user32" Alias "CreateWindowExA" (ByVal dwExStyle As Long, ByVal lpClassName As String, ByVal lpWindowName As String, ByVal dwStyle As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hWndParent As Long, ByVal hMenu As Long, ByVal hInstance As Long, lpParam As Any) As Long
Private Declare Function DestroyWindow Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function SystemParametersInfo Lib "user32" Alias "SystemParametersInfoA" (ByVal uAction As Long, ByVal uParam As Long, ByRef lpvParam As Any, ByVal fuWinIni As Long) As Long
Private Declare Function UpdateLayeredWindow Lib "user32" ( _
    ByVal hwnd As Long, _
    ByVal hdcDst As Long, _
    pptDst As Any, _
    psize As Any, _
    ByVal hdcSrc As Long, _
    pptSrc As Any, _
    ByVal crKey As Long, _
    pblend As BLENDFUNCTION, _
    ByVal dwFlags As Long) As Long
Private Const GWL_STYLE = (-16)
Private Const GWL_EXSTYLE = (-20)
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long

Private Declare Function IsWindowVisible Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function GetWindowRect Lib "user32" (ByVal hwnd As Long, lpRect As RECT) As Long

' Set the position of a window:
Private Const HWND_NOTOPMOST = -2
Private Const HWND_TOP = 0
Private Const HWND_TOPMOST = -1
Private Const HWND_BOTTOM = 1
Private Const SWP_NOACTIVATE = &H10
Private Const SWP_SHOWWINDOW = &H40
Private Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long

Private Declare Function CreateDCAsNull Lib "gdi32" Alias "CreateDCA" (ByVal lpDriverName As String, lpDeviceName As Any, lpOutput As Any, lpInitData As Any) As Long
Private Declare Function DeleteDC Lib "gdi32" (ByVal hdc As Long) As Long

Private Declare Function LoadImageString Lib "user32" Alias "LoadImageA" (ByVal hInst As Long, ByVal lpsz As String, ByVal uType As Long, ByVal cx As Long, ByVal cy As Long, ByVal uFlags As Long) As Long
Private Const IMAGE_BITMAP = 0
Private Const IMAGE_ICON = 1
Private Const IMAGE_CURSOR = 2
Private Const LR_LOADFROMFILE = &H10
Private Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long

Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long

Private Declare Function SelectObject Lib "gdi32" (ByVal hdc As Long, ByVal hObject As Long) As Long
Private Declare Function LoadImage Lib "user32" Alias "LoadImageA" (ByVal hInst As Long, ByVal lpsz As String, ByVal un1 As Long, ByVal n1 As Long, ByVal n2 As Long, ByVal un2 As Long) As Long
Private Const BI_RGB = 0&
Private Const BI_RLE4 = 2&
Private Const BI_RLE8 = 1&
Private Const DIB_RGB_COLORS = 0 '  color table in RGBs

Private Type BITMAP
    bmType As Long
    bmWidth As Long
    bmHeight As Long
    bmWidthBytes As Long
    bmPlanes As Integer
    bmBitsPixel As Integer
    bmBits As Long
End Type
Private Declare Function GetObjectAPI Lib "gdi32" Alias "GetObjectA" (ByVal hObject As Long, ByVal nCount As Long, lpObject As Any) As Long

' Start of structure:
Private Const BITMAPTYPE As Integer = &H4D42
Private Type BITMAPFILEHEADER
   bfType As Integer '- type  ="BM" i.e &H4D42 - 2
   bfSize As Long ' - size in bytes of file - 6
   bfReserved1 As Integer ' - reserved, must be 0 - 8
   bfReserved2 As Integer ' - reserved, must be 0 - 10
   bfOffBits As Long ' offset from this structure to the bitmap bits - 14
End Type

Private Const WM_DESTROY = &H2
Private Const WM_SIZE = &H5
Private Const WM_SIZING = &H214
Private Const WM_MOVING = &H216&
Private Const WM_ENTERSIZEMOVE = &H231&
Private Const WM_EXITSIZEMOVE = &H232&

Private m_hDIb As Long
Private m_hBmpOld As Long
Private m_hDC As Long
Private m_hDD As Long
Private m_lPtr As Long
Private m_tBI As BITMAPINFO

Public Enum EShadowType
   RightShadow
   BottomShadow
End Enum

Private m_eShadowType As EShadowType
Private m_oShadow As Object
Private m_lShadowSize As Long
Private m_hWndAttach As Long
Private m_bInSizeMove As Boolean

Implements ISubclass

Public Property Get ShadowSize() As Long
   ShadowSize = m_lShadowSize
End Property
Public Property Let ShadowSize(ByVal lSize As Long)
   m_lShadowSize = lSize
End Property

Public Property Get Shadow() As Object
   Set Shadow = m_oShadow
End Property

Public Property Let Shadow(ByVal oShadow As Object)
   Set m_oShadow = oShadow
End Property
Public Property Set Shadow(ByVal oShadow As Object)
   Set m_oShadow = oShadow
End Property

Public Property Get ShadowType() As EShadowType
   ShadowType = m_eShadowType
End Property

Public Property Let ShadowType(ByVal value As EShadowType)
   m_eShadowType = value
End Property



Private Function CreateDIB( _
        ByVal lhDC As Long, _
        ByVal lWidth As Long, _
        ByVal lHeight As Long, _
        ByRef hDib As Long _
    ) As Boolean
    With m_tBI.bmiHeader
        .biSize = Len(m_tBI.bmiHeader)
        .biWidth = lWidth
        .biHeight = lHeight
        .biPlanes = 1
        .biBitCount = 32
        .biCompression = BI_RGB
        .biSizeImage = BytesPerScanLine * .biHeight
    End With
    hDib = CreateDIBSection( _
            lhDC, _
            m_tBI, _
            DIB_RGB_COLORS, _
            m_lPtr, _
            0, 0)
    CreateDIB = (hDib <> 0)
End Function

Private Function Create( _
        ByVal lWidth As Long, _
        ByVal lHeight As Long _
    ) As Boolean
   ClearUp
   m_hDC = CreateCompatibleDC(0)
   If (m_hDC <> 0) Then
       If (CreateDIB(m_hDC, lWidth, lHeight, m_hDIb)) Then
           m_hBmpOld = SelectObject(m_hDC, m_hDIb)
           Create = True
       Else
           DeleteObject m_hDC
           m_hDC = 0
       End If
   End If
End Function
Private Sub ClearUp()
    If (m_hDC <> 0) Then
        If (m_hDIb <> 0) Then
            SelectObject m_hDC, m_hBmpOld
            DeleteObject m_hDIb
        End If
        DeleteObject m_hDC
    End If
    m_hDC = 0: m_hDIb = 0: m_hBmpOld = 0: m_lPtr = 0
End Sub

Private Property Get BytesPerScanLine() As Long
    ' Scans must align on dword boundaries; easy with an alpha bitmap!
    BytesPerScanLine = m_tBI.bmiHeader.biWidth * 4
End Property

Private Property Get DibWidth() As Long
    DibWidth = m_tBI.bmiHeader.biWidth
End Property
Private Property Get DibHeight() As Long
    DibHeight = m_tBI.bmiHeader.biHeight
End Property

Private Sub CreateDropShadow( _
      ByVal bHorizontal As Boolean, _
      ByVal bLeftTop As Boolean _
   )
Dim bDib() As Byte
Dim x As Long, y As Long
Dim lC As Long, lInitC As Long, lSize As Long
Dim tSA As SAFEARRAY2D
    
    ' Get the bits in the from DIB section:
    With tSA
        .cbElements = 1
        .cDims = 2
        .Bounds(0).lLbound = 0
        .Bounds(0).cElements = m_tBI.bmiHeader.biHeight
        .Bounds(1).lLbound = 0
        .Bounds(1).cElements = BytesPerScanLine()
        .pvData = m_lPtr
    End With
    CopyMemory ByVal VarPtrArray(bDib()), VarPtr(tSA), 4
    
   If (bHorizontal) Then
      ' horizontal:
      lSize = DibHeight
      If (bLeftTop) Then
      
      Else
         ' at bottom:
         For x = 0 To BytesPerScanLine - 1 Step 4
            ' if x is within lSize of the start or end, then
            ' it contributes to alpha:
            
            If (x < lSize * 4) Then
               lInitC = (255 * x) \ (lSize * 4)
            ElseIf (x >= (BytesPerScanLine - lSize * 4)) Then
               lInitC = (((BytesPerScanLine - x) * 255) \ (4 * lSize))
            Else
               lInitC = 255
            End If
            
            For y = 0 To DibHeight - 1
               lC = (lInitC * y) \ DibHeight
               bDib(x + 3, y) = lC
               bDib(x + 2, y) = 0
               bDib(x + 1, y) = 0
               bDib(x, y) = 0
            Next y
            
         Next x
      End If
   Else
      ' vertical:
      lSize = BytesPerScanLine \ 4
      If (bLeftTop) Then
      Else
         ' at right:
         For y = 0 To DibHeight - 1
            ' if y is within lSize of the start or end, then
            ' it contributes to the alpha:
            
            'If (y < lSize) Then
            '   lInitC = (255 * y) \ lSize
            If (y >= (DibHeight - lSize)) Then
               lInitC = (255 * (DibHeight - y)) \ lSize
            Else
               lInitC = 255
            End If
            
            For x = 0 To BytesPerScanLine - 1 Step 4
               ' the amount of alpha depends on how far we are from the left:
               lC = (lInitC * (BytesPerScanLine - x)) \ BytesPerScanLine
               'Debug.Print lC
               bDib(x + 3, y) = lC
               bDib(x + 2, y) = 0
               bDib(x + 1, y) = 0
               bDib(x, y) = 0
            Next x
         Next y
      End If
   End If
    
    ' Clear the temporary array descriptor
    ' (This does not appear to be necessary, but
    ' for safety do it anyway)
    CopyMemory ByVal VarPtrArray(bDib), 0&, 4
    
End Sub

Private Sub Form_Initialize()
   m_lShadowSize = 5
End Sub

Private Sub Form_Load()
   
   ' set as shadow form:
   Dim lExStyle As Long
   Dim lStyle As Long
   lExStyle = WS_EX_LAYERED Or WS_EX_TRANSPARENT Or WS_EX_TOPMOST Or WS_EX_TOOLWINDOW
   lStyle = WS_POPUP Or WS_VISIBLE
   SetWindowLong Me.hwnd, GWL_STYLE, lStyle
   SetWindowLong Me.hwnd, GWL_EXSTYLE, lExStyle
   
   ' Setup size:
   Dim tR As RECT
   GetWindowRect m_oShadow.hwnd, tR
      
   renderShadow tR, True
   
   ' Subclass:
   Attach
   
End Sub

Private Sub renderShadow(tR As RECT, ByVal bChange As Boolean)
   
   If bChange Then
      Dim tSize As SIZEAPI
      If (m_eShadowType = BottomShadow) Then
         tSize.cx = (tR.Right - tR.Left)
         tSize.cy = m_lShadowSize
      Else
         tSize.cx = m_lShadowSize
         tSize.cy = (tR.Bottom - tR.Top) - m_lShadowSize
      End If
      Create tSize.cx, tSize.cy
      If (m_eShadowType = BottomShadow) Then
         CreateDropShadow True, False
      Else
         CreateDropShadow False, False
      End If
      
      ' Draw:
      Dim tBlend As BLENDFUNCTION
      tBlend.BlendOp = AC_SRC_OVER
      tBlend.BlendFlags = 0
      tBlend.AlphaFormat = AC_SRC_ALPHA
      tBlend.SourceConstantAlpha = 96
      Dim tPtSrc As POINTAPI
      tPtSrc.x = 0
      tPtSrc.y = 0
      
      UpdateLayeredWindow Me.hwnd, ByVal 0&, ByVal 0&, tSize, m_hDC, tPtSrc, 0, _
               tBlend, ULW_ALPHA
   End If
   
   If (m_eShadowType = RightShadow) Then
      On Error Resume Next
      Me.Move _
         tR.Right * Screen.TwipsPerPixelX, _
         (tR.Top + m_lShadowSize) * Screen.TwipsPerPixelY, _
         m_lShadowSize * Screen.TwipsPerPixelX, _
         (tR.Bottom - tR.Top) * Screen.TwipsPerPixelY
   Else
      On Error Resume Next
      Me.Move _
         (tR.Left + m_lShadowSize) * Screen.TwipsPerPixelX, _
         tR.Bottom * Screen.TwipsPerPixelY, _
         (tR.Right - tR.Left) * Screen.TwipsPerPixelX, _
         m_lShadowSize * Screen.TwipsPerPixelY
   End If
End Sub


Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
   ClearUp
   Detach
End Sub

Private Sub Attach()
   Detach
   On Error Resume Next
   m_hWndAttach = m_oShadow.Parent.hwnd
   If Not (Err.Number = 0) Then
      m_hWndAttach = m_oShadow.hwnd
   End If
   On Error GoTo 0
   AttachMessage Me, m_hWndAttach, WM_DESTROY
   AttachMessage Me, m_hWndAttach, WM_MOVING
   AttachMessage Me, m_hWndAttach, WM_SIZING
   AttachMessage Me, m_hWndAttach, WM_SIZE
End Sub
Private Sub Detach()
   If Not m_hWndAttach = 0 Then
      DetachMessage Me, m_hWndAttach, WM_DESTROY
      DetachMessage Me, m_hWndAttach, WM_MOVING
      DetachMessage Me, m_hWndAttach, WM_SIZING
      DetachMessage Me, m_hWndAttach, WM_SIZE
   End If
End Sub


Private Property Let ISubClass_MsgResponse(ByVal RHS As EMsgResponse)
   '
End Property

Private Property Get ISubClass_MsgResponse() As EMsgResponse
   ' Process before windows:
   ISubClass_MsgResponse = emrPostProcess
End Property

Private Function ISubClass_WindowProc(ByVal hwnd As Long, ByVal iMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Dim lR As Long
Dim tR As RECT
Dim lWidth As Long
Dim lHeight As Long

   Select Case iMsg
   Case WM_MOVING
      ' Form is moving:
      If (m_oShadow.hwnd = m_hWndAttach) Then
         CopyMemory tR, ByVal lParam, Len(tR)
         renderShadow tR, False
      Else
         GetWindowRect m_oShadow.hwnd, tR
         renderShadow tR, False
      End If
      
   Case WM_SIZING
      ' Form is sizing:
      If (m_oShadow.hwnd = m_hWndAttach) Then
         CopyMemory tR, ByVal lParam, Len(tR)
         renderShadow tR, True
      Else
         GetWindowRect m_oShadow.hwnd, tR
         renderShadow tR, False
      End If
      
   Case WM_SIZE
      ' This ensures that you don't have to separately
      ' check for maximize/minimize/restore/in code
      ' movement, as these aren't
      ' controlled by the UI sizing loop:
      If Not (m_bInSizeMove) Or Not (m_oShadow.hwnd = m_hWndAttach) Then
         GetWindowRect m_oShadow.hwnd, tR
         lWidth = tR.Right - tR.Left
         lHeight = tR.Bottom - tR.Top
         renderShadow tR, True
      End If
      
   Case WM_ENTERSIZEMOVE
      ' Enter modal sizing/moving loop
      m_bInSizeMove = True
   
   Case WM_EXITSIZEMOVE
      m_bInSizeMove = False
      
   Case WM_DESTROY
      ' Ensures the class terminates regardless
      ' of whether the user explicitly detaches
      ' it or not:
      Detach
      
   End Select
   
End Function

