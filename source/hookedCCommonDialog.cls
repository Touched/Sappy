VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cCommonDialog"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

' ==========================================================================
' Class:    cCommonDialog
' Filename: cCommonDialog.cls
' Author:   Steve McMahon
' Date:     24 May 1998
'
' A wrapper around GCommonDialog to make it look more
' like the standard common dialog control.
' ==========================================================================

Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" ( _
    lpvDest As Any, lpvSource As Any, ByVal cbCopy As Long)
Private Const FORMAT_MESSAGE_ALLOCATE_BUFFER = &H100
Private Const FORMAT_MESSAGE_ARGUMENT_ARRAY = &H2000
Private Const FORMAT_MESSAGE_FROM_HMODULE = &H800
Private Const FORMAT_MESSAGE_FROM_STRING = &H400
Private Const FORMAT_MESSAGE_FROM_SYSTEM = &H1000
Private Const FORMAT_MESSAGE_IGNORE_INSERTS = &H200
Private Const FORMAT_MESSAGE_MAX_WIDTH_MASK = &HFF
Private Declare Function FormatMessage Lib "kernel32" Alias "FormatMessageA" (ByVal dwFlags As Long, lpSource As Any, ByVal dwMessageId As Long, ByVal dwLanguageId As Long, ByVal lpBuffer As String, ByVal nSize As Long, Arguments As Long) As Long
Private Declare Function OleTranslateColor Lib "olepro32.dll" (ByVal OLE_COLOR As Long, ByVal HPALETTE As Long, pccolorref As Long) As Long
Private Declare Function SystemParametersInfo Lib "user32" Alias "SystemParametersInfoA" (ByVal uAction As Long, ByVal uParam As Long, lpvParam As Any, ByVal fuWinIni As Long) As Long
Private Const SPI_GETWORKAREA = 48&

' Properties to emulate the CommonDialog control:
Private m_bCancelError As Boolean
Private m_sFilter As String
Private m_lFilterIndex As Long
Private m_sFileName As String
Private m_oColor As OLE_COLOR
Private m_lCopies As Long
Private m_lFlags As Long
Private m_sDialogTitle As String
Private m_sDefaultExt As String
Private m_font As New StdFont
Private m_oFontColor As OLE_COLOR
Private m_lFromPage As Long
Private m_lhWnd As Long
Private m_eHelpCommand As EShowHelpCommands
Private m_sHelpContext As String
Private m_sHelpFile As String
Private m_sHelpKey As String
Private m_sInitDir As String
Private m_lMax As Long
Private m_lMaxFileSize As Long
Private m_lMin As Long
Private m_objObject As Object
Private m_iPrinterDefault As Integer
Private m_lToPage As Long
Private m_sFileTitle As String
Private m_hDC As Long
Private m_bHookDialog As Boolean
Private mCommonDialog As New GCommonDialog

'API function inside ShowHelp method
Private Declare Function WinHelp Lib "user32" Alias "WinHelpA" (ByVal hwnd As Long, ByVal lpHelpFile As String, ByVal wCommand As Long, ByVal dwData As Long) As Long
' WinHelp Commands:
Public Enum EShowHelpCommands
    HELP_COMMAND = &H102&
    HELP_CONTENTS = &H3&
    HELP_CONTEXT = &H1          '  Display topic in ulTopic
    HELP_CONTEXTPOPUP = &H8&
    HELP_FORCEFILE = &H9&
    HELP_HELPONHELP = &H4       '  Display help on using help
    HELP_INDEX = &H3            '  Display index
    HELP_KEY = &H101            '  Display topic for keyword in offabData
    HELP_MULTIKEY = &H201&
    HELP_PARTIALKEY = &H105&
    HELP_QUIT = &H2             '  Terminate help
    HELP_SETCONTENTS = &H5&
    HELP_SETINDEX = &H5         '  Set current Index for multi index help
    HELP_SETWINPOS = &H203&
        
    HELP_FINDER = &HB           ' Win95 version of HELP_CONTENTS
End Enum
Private Type HELPWININFO
    wStructSize As Long
    x As Long
    y As Long
    dx As Long
    dy As Long
    wMax As Long
    rgchMember As String * 2
End Type
Public Enum EShowHelpWindowPos
    SW_HIDE = 0
    SW_MAXIMIZE = 3
    SW_MINIMIZE = 6
    SW_SHOW = 5
    SW_SHOWMAXIMIZED = 3
    SW_SHOWMINIMIZED = 2
    SW_SHOWMINNOACTIVE = 7
    SW_SHOWNA = 8
    SW_SHOWNOACTIVATE = 4
    SW_SHOWNORMAL = 1
End Enum
Private Declare Function GetParent Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function GetWindowRect Lib "user32" (ByVal hwnd As Long, lpRect As RECT) As Long
Private Declare Function MoveWindow Lib "user32" (ByVal hwnd As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal bRepaint As Long) As Long
Private Declare Function ClientToScreen Lib "user32" (ByVal hwnd As Long, lpPoint As POINTAPI) As Long
Private Type RECT
    Left As Long
    Top As Long
    Right As Long
    Bottom As Long
End Type
Private Type POINTAPI
    x As Long
    y As Long
End Type
Private m_bFileDialog As Boolean

' For template support
Private Declare Function LoadLibrary Lib "kernel32" Alias "LoadLibraryA" (ByVal lpLibFileName As String) As Long
Private Declare Function FreeLibrary Lib "kernel32" (ByVal hLibModule As Long) As Long
Private m_lhInstance As Long
Private m_lTemplateName As Long
Private m_bMakeTBarFlat As Boolean

Public Event InitDialog(ByVal hDlg As Long)
Public Event FileChange(ByVal hDlg As Long)
Public Event FolderChange(ByVal hDlg As Long)
Public Event DialogOK(ByRef bCancel As Boolean)
Public Event TypeChange(ByVal hDlg As Long)
Public Event DialogClose()
Public Event WMCommand(ByVal hDlg As Long, wParam As Long, lParam As Long)

Public Sub WMCommand(ByVal hDlg As Long, wParam As Long, lParam As Long)
    RaiseEvent WMCommand(hDlg, wParam, lParam)
End Sub

Public Sub ParseMultiFileName( _
      ByRef sDir As String, _
      ByRef sFiles() As String, _
      ByRef iFileCount As Long _
   )
Dim iPos As Long
Dim iNextPos As Long
Dim sAllFiles As String
Dim i As Long

   iPos = InStr(m_sFileName, vbNullChar & vbNullChar)
   If iPos <> 0 Then
      ' multi names
      sAllFiles = Left$(m_sFileName, iPos - 1)
      iPos = 1
      iNextPos = InStr(sAllFiles, vbNullChar)
      Do While iNextPos <> 0
         If (sDir = "") Then
            sDir = Mid$(sAllFiles, iPos, iNextPos - iPos)
         Else
            iFileCount = iFileCount + 1
            ReDim Preserve sFiles(1 To iFileCount) As String
            sFiles(iFileCount) = Mid$(sAllFiles, iPos, iNextPos - iPos)
         End If
         iPos = iNextPos + 1
         iNextPos = InStr(iPos, sAllFiles, vbNullChar)
      Loop
      iFileCount = iFileCount + 1
      ReDim Preserve sFiles(1 To iFileCount) As String
      sFiles(iFileCount) = Mid$(sAllFiles, iPos)
   Else
      ' single file
      iFileCount = 1
      ReDim sFiles(1 To 1) As String
      For i = Len(m_sFileName) To 1 Step -1
         If Mid$(m_sFileName, i, 1) = "\" Then
            If (i > 1) Then
               sDir = Left$(m_sFileName, i - 1)
               sFiles(1) = Mid$(m_sFileName, i + 1)
            Else
               sDir = ""
               sFiles(1) = m_sFileName
            End If
            Exit Sub
         End If
      Next i
      sDir = ""
      sFiles(1) = m_sFileName
   End If
End Sub

Public Sub DialogClose()
    RaiseEvent DialogClose
End Sub

Public Function TypeChange(ByVal hDlg As Long) As Long
    RaiseEvent TypeChange(hDlg)
End Function

Public Function InitDialog(ByVal hDlg As Long) As Long
   RaiseEvent InitDialog(hDlg)
End Function
Public Function FileChange(ByVal hDlg As Long) As Long
   RaiseEvent FileChange(hDlg)
End Function
Public Function FolderChange(ByVal hDlg As Long) As Long
   RaiseEvent FolderChange(hDlg)
End Function
Public Function ConfirmOK() As Boolean
Dim bCancel As Boolean
    bCancel = False
    RaiseEvent DialogOK(bCancel)
    If (bCancel) Then
        ConfirmOK = False
    Else
        ConfirmOK = True
    End If
End Function

Public Sub CentreDialog(ByVal hDlg As Long, ByRef oCentreTo As Object)
Dim lHwnd As Long
Dim tWR As RECT, tDR As RECT
Dim tp As POINTAPI
Dim lHwndCentreTo As Long
Dim lL As Long
Dim lT As Long
Dim lR As Long

    ' If we're showing a file dialog, then the rectangle is the
    ' parent of the dialog itself:
    If (m_bFileDialog) Then
        lHwnd = GetParent(hDlg)
    Else
        lHwnd = hDlg
    End If
    GetWindowRect lHwnd, tDR
    Debug.Print tDR.Right - tDR.Left, tDR.Bottom - tDR.Top
    
    On Error Resume Next
    lHwndCentreTo = oCentreTo.hwnd
    If (Err.Number = 0) Then
        GetWindowRect lHwndCentreTo, tWR
    Else
      ' Assume the screen object:
      lR = SystemParametersInfo(SPI_GETWORKAREA, 0, tWR, 0)
      If (lR = 0) Then
         ' Call failed - just use standard screen:
         tWR.Left = 0
         tWR.Top = 0
         tWR.Right = Screen.Width \ Screen.TwipsPerPixelX
         tWR.Bottom = Screen.Height \ Screen.TwipsPerPixelY
      End If
    End If
    On Error GoTo 0
    If (tWR.Right > 0) And (tWR.Bottom > 0) Then
        lL = tWR.Left + (((tWR.Right - tWR.Left) - (tDR.Right - tDR.Left)) \ 2)
        lT = tWR.Top + (((tWR.Bottom - tWR.Top) - (tDR.Bottom - tDR.Top)) \ 2)
        Debug.Print tDR.Right - tDR.Left, tDR.Bottom - tDR.Top
        MoveWindow lHwnd, lL, lT, (tDR.Right - tDR.Left), (tDR.Bottom - tDR.Top), 1
    End If
End Sub
Public Sub GetDialogSize( _
        ByVal hDlg As Long, _
        ByRef lL As Long, _
        ByRef lT As Long, _
        ByRef lW As Long, _
        ByRef lH As Long _
    )
Dim lHwnd As Long
Dim tDR As RECT
    If (m_bFileDialog) Then
        lHwnd = GetParent(hDlg)
    Else
        lHwnd = hDlg
    End If
    GetWindowRect lHwnd, tDR
    lL = tDR.Left
    lT = tDR.Top
    lW = tDR.Right - tDR.Left
    lH = tDR.Bottom - tDR.Top
End Sub


Public Sub SetHelpPosition(x As Long, y As Long, dx As Long, dy As Long, eWindowType As EShowHelpWindowPos)
Dim tW As HELPWININFO
Dim lPtr As Long

    With tW
        .x = x
        .y = y
        .dx = dx
        .dy = dy
        .wMax = eWindowType
        .wStructSize = Len(tW)
    End With
    Dim cM As New cMemory
    cM.AllocateMemory tW.wStructSize
    lPtr = cM.Pointer
    CopyMemory ByVal lPtr, tW, tW.wStructSize
    WinHelp m_lhWnd, m_sHelpFile, HELP_SETWINPOS, lPtr
    cM.FreeMemory
    
End Sub

Public Property Get CancelError() As Boolean
    CancelError = m_bCancelError
End Property
Public Property Let CancelError(ByVal bCancelError As Boolean)
    m_bCancelError = bCancelError
End Property
Public Property Get Filename() As String
    'return object's FileName property
    Filename = m_sFileName
End Property
Public Property Let Filename(ByVal sFileName As String)
    'assign object's FileName property
    m_sFileName = sFileName
End Property
Public Property Get Filter() As String
    'return object's Filter property
    Filter = m_sFilter
End Property
Public Property Let Filter(ByVal sFilter As String)
    'assign object's Filter property
    m_sFilter = sFilter
End Property
Public Property Get FilterIndex() As Long
    'return object's FilterIndex property
    FilterIndex = m_lFilterIndex
End Property
Public Property Let FilterIndex(ByVal lFilterIndex As Long)
    'assign object's FilterIndex property
    m_lFilterIndex = lFilterIndex
End Property
Public Property Get Color() As OLE_COLOR
    'return object's Color property
    Color = m_oColor
End Property
Public Property Let Color(ByVal oColor As OLE_COLOR)
    'assign object's Color property
    m_oColor = oColor
End Property
Public Property Get Copies() As Long
    'return object's Copies property
    Copies = m_lCopies
End Property
Public Property Let Copies(ByVal vNewValue As Long)
    'assign object's Copies property
    m_lCopies = vNewValue
End Property
Public Property Get DefaultExt() As String
    'return object's DefaultExt property
    DefaultExt = m_sDefaultExt
End Property
Public Property Let DefaultExt(ByVal vNewValue As String)
    'assign object's DefaultExt property
    m_sDefaultExt = vNewValue
End Property
Public Property Get DialogTitle() As String
    'return object's FileName property
    DialogTitle = m_sDialogTitle
End Property
Public Property Let DialogTitle(ByVal vNewValue As String)
    'assign object's DialogTitle property
    m_sDialogTitle = vNewValue
End Property
Public Property Get flags() As Long
    'return object's Flags property
    flags = m_lFlags
End Property
Public Property Let flags(ByVal vNewValue As Long)
    'assign object's Flags property
    m_lFlags = vNewValue
End Property
Public Property Get FontBold() As Boolean
    'return object's FontBold property
    FontBold = m_font.Bold
End Property
Public Property Let FontBold(ByVal vNewValue As Boolean)
    'Assign object's FontBold property
    m_font.Bold = vNewValue
End Property
Public Property Get FontItalic() As Boolean
    'Return object's FontItalic property
    FontItalic = m_font.Italic
End Property
Public Property Let FontItalic(ByVal vNewValue As Boolean)
    'Assign object's FontItalic property
    m_font.Italic = vNewValue
End Property
Public Property Get FontName() As String
    'Return object's Fontname property
    FontName = m_font.name
End Property
Public Property Let FontName(ByVal vNewValue As String)
    'Assign object's FontName property
    m_font.name = vNewValue
End Property
Public Property Get FontSize() As Long
    'Return object's FontSize property
    FontSize = m_font.Size
End Property
Public Property Let FontSize(ByVal vNewValue As Long)
    'Assign object's FontSize property
    m_font.Size = vNewValue
End Property
Public Property Get FontStrikethru() As Boolean
    'Return object's FontStrikethru property
    FontStrikethru = m_font.Strikethrough
End Property
Public Property Let FontStrikethru(ByVal vNewValue As Boolean)
    'Assign object's - property
    m_font.Strikethrough = vNewValue
End Property
Public Property Get FontUnderline() As Boolean
    'Return object's FontUnderline property
    FontUnderline = m_font.Underline
End Property
Public Property Let FontUnderline(ByVal vNewValue As Boolean)
    'Assign object's FontUnderline property
    m_font.Underline = vNewValue
End Property
Public Property Get Font() As StdFont
    Set Font = m_font
End Property
Public Property Let Font(sFont As StdFont)
    Set m_font = sFont
End Property
Public Property Get FontColor() As OLE_COLOR
    FontColor = m_oFontColor
End Property
Public Property Let FontColor(oColor As OLE_COLOR)
    m_oFontColor = oColor
End Property
Public Property Get FromPage() As Long
    'Return object's FromPAge property
    FromPage = m_lFromPage
End Property
Public Property Let FromPage(ByVal vNewValue As Long)
    'Assign object's FromPage property
    m_lFromPage = vNewValue
End Property
Public Property Get hwnd() As Long
    'Return object's hWnd property
    hwnd = m_lhWnd
End Property
Public Property Let hwnd(ByVal vNewValue As Long)
    'Assign object's hWnd property
    m_lhWnd = vNewValue
End Property
Public Property Get HelpCommand() As EShowHelpCommands
    'Return object's HelpCommand property
    HelpCommand = m_eHelpCommand
End Property
Public Property Let HelpCommand(ByVal vNewValue As EShowHelpCommands)
    'Assign object's HelpCommand property
    m_eHelpCommand = vNewValue
End Property
Public Property Get HelpContext() As String
    'Return object's HelpContext property
    HelpContext = m_sHelpContext
End Property
Public Property Let HelpContext(ByVal vNewValue As String)
    'Assign object's HelpContext property
    m_sHelpContext = vNewValue
End Property
Public Property Get HelpFile() As String
    'Return object's HelpFile property
    HelpFile = m_sHelpFile
End Property
Public Property Let HelpFile(ByVal vNewValue As String)
    'Assign object's HelpFile property
    m_sHelpFile = vNewValue
End Property
Public Property Get HelpKey() As String
    'Return object's HelpKey property
    HelpKey = m_sHelpKey
End Property
Public Property Let HelpKey(ByVal vNewValue As String)
    'Assign object's HelpKey property
    m_sHelpKey = vNewValue
End Property
Public Property Get InitDir() As String
    'Return object's InitDir property
    InitDir = m_sInitDir
End Property
Public Property Let InitDir(ByVal vNewValue As String)
    'Assign object's InitDir property
    m_sInitDir = vNewValue
End Property
Public Property Get Max() As Long
    'Return object's Max property
    Max = m_lMax
End Property
Public Property Let Max(ByVal vNewValue As Long)
    'Assign object's - property
    m_lMax = vNewValue
End Property
Public Property Get MaxFileSize() As Long
    'Return object's MaxFileSize property
    MaxFileSize = m_lMaxFileSize
End Property
Public Property Let MaxFileSize(ByVal vNewValue As Long)
    'Assign object's MaxFileSize property
    m_lMaxFileSize = vNewValue
End Property
Public Property Get Min() As Long
    'Return object's Min property
    Min = m_lMin
End Property
Public Property Let Min(ByVal vNewValue As Long)
    'Assign object's Min property
    m_lMin = vNewValue
End Property
Public Property Get Object() As Object
    'Return object's Object property
    Object = m_objObject
End Property
Public Property Let Object(ByVal vNewValue As Object)
    'Assign object's Object property
    Set m_objObject = vNewValue
End Property
Public Property Get PrinterDefault() As Integer
    'Return object's PrinterDefault property
    PrinterDefault = m_iPrinterDefault
End Property
Public Property Let PrinterDefault(ByVal vNewValue As Integer)
    'Assign object's PrinterDefault property
    m_iPrinterDefault = vNewValue
End Property
Public Property Get ToPage() As Long
    'Return object's ToPage property
    ToPage = m_lToPage
End Property
Public Property Let ToPage(ByVal vNewValue As Long)
    'Assign object's ToPage property
    m_lToPage = vNewValue
End Property
Public Property Get FileTitle() As String
    'return object's FileTitle property
    FileTitle = m_sFileTitle
End Property
Public Property Let FileTitle(ByVal vNewValue As String)
    'assign object's FileTitle property
    m_sFileTitle = vNewValue
End Property
Property Get CustomColor(ByVal i As Integer) As OLE_COLOR
    CustomColor = mCommonDialog.CustomColor(i)
End Property
Property Let CustomColor(ByVal i As Integer, oValue As OLE_COLOR)
    mCommonDialog.CustomColor(i) = oValue
End Property
Public Sub ShowOpen()
Dim bFileMustExist As Boolean
Dim bMultiSelect As Boolean
Dim bReadOnly As Boolean
Dim bHideReadOnly As Boolean

   m_bFileDialog = True
   bFileMustExist = FlagSet(m_lFlags, OFN_FILEMUSTEXIST)
   bMultiSelect = FlagSet(m_lFlags, OFN_ALLOWMULTISELECT)
   bReadOnly = FlagSet(m_lFlags, OFN_READONLY)
   bHideReadOnly = FlagSet(m_lFlags, OFN_HIDEREADONLY)
    
   If FlagSet(m_lFlags, OFN_ENABLETEMPLATE) Then
      If m_lhInstance < 1 Then
         m_lFlags = m_lFlags Xor OFN_ENABLETEMPLATE
      End If
   End If
    
   If (m_lFilterIndex = 0) Then m_lFilterIndex = 1
   
   If Not (mCommonDialog.VBGetOpenFileName2( _
      m_sFileName, _
      m_sFileTitle, _
      bFileMustExist, bMultiSelect, bReadOnly, bHideReadOnly, _
      m_sFilter, m_lFilterIndex, _
      m_sInitDir, _
      m_sDialogTitle, _
      m_sDefaultExt, _
      m_lhWnd, _
      m_lFlags, _
      m_bHookDialog, _
      m_lhInstance, m_lTemplateName, _
      Me)) Then
        pCommonDialogError
   End If
   
End Sub
Public Sub ShowSave()
Dim bOverWritePrompt As Boolean
    
   m_bFileDialog = True
   bOverWritePrompt = FlagSet(m_lFlags, OFN_OVERWRITEPROMPT)
   If FlagSet(m_lFlags, OFN_ENABLETEMPLATE) Then
      If m_lhInstance < 1 Then
         m_lFlags = m_lFlags Xor OFN_ENABLETEMPLATE
      End If
   End If
   If Not (mCommonDialog.VBGetSaveFileName2( _
      m_sFileName, _
      m_sFileTitle, _
      bOverWritePrompt, _
      m_sFilter, m_lFilterIndex, _
      m_sInitDir, _
      m_sDialogTitle, _
      m_sDefaultExt, _
      m_lhWnd, _
      m_lFlags, _
      m_bHookDialog, _
      m_lhInstance, m_lTemplateName, _
      Me)) Then
         pCommonDialogError
   End If
   
End Sub
Public Sub ShowColor()
Dim bAnyColor As Boolean
Dim bFullOpen As Boolean
Dim bDisableFullOpen As Boolean
Dim lColor As Long

    m_bFileDialog = False
    lColor = TranslateColor(m_oColor)
    bAnyColor = FlagSet(m_lFlags, CC_AnyColor)
    bFullOpen = FlagSet(m_lFlags, CC_FullOpen)
    bDisableFullOpen = FlagSet(m_lFlags, CC_PreventFullOpen)
    If Not (mCommonDialog.VBChooseColor( _
            lColor, _
            bAnyColor, bFullOpen, bDisableFullOpen, _
            m_lhWnd, m_lFlags, _
            m_bHookDialog, _
            Me)) Then
        pCommonDialogError
    Else
        m_oColor = lColor
    End If
End Sub
Public Sub ShowFont()
    m_bFileDialog = False
    If Not (mCommonDialog.VBChooseFont( _
        m_font, _
        -1, _
        m_lhWnd, _
        m_oFontColor, _
        m_lMin, _
        m_lMax, _
        m_lFlags, _
        m_bHookDialog, _
        Me)) Then
        pCommonDialogError
    End If
End Sub
Public Sub ShowPrinter()
Dim bDisablePageNumbers As Boolean
Dim bShowPrintToFile As Boolean
Dim bPrintToFile As Boolean
Dim bDisablePrintToFile As Boolean
Dim bCollate As Boolean
Dim bPreventWarning As Boolean
Dim bDisableSelection As Boolean
Dim ePR As EPrintRange
Dim iCopies As Integer

    m_bFileDialog = False
    iCopies = m_lCopies
    bDisablePageNumbers = Not (FlagSet(m_lFlags, PD_PAGENUMS))
    bDisableSelection = FlagSet(m_lFlags, PD_NOSELECTION)
    bShowPrintToFile = Not (FlagSet(m_lFlags, PD_HIDEPRINTTOFILE))
    bDisablePrintToFile = FlagSet(m_lFlags, PD_DISABLEPRINTTOFILE)
    bPrintToFile = FlagSet(m_lFlags, PD_PRINTTOFILE)
    bCollate = FlagSet(m_lFlags, PD_COLLATE)
    bPreventWarning = FlagSet(m_lFlags, PD_NOWARNING)
    
    If (mCommonDialog.VBPrintDlg( _
        m_hDC, _
        ePR, _
        bDisablePageNumbers, _
        m_lFromPage, _
        m_lToPage, _
        bDisableSelection, _
        iCopies, _
        bShowPrintToFile, _
        bDisablePrintToFile, _
        bPrintToFile, _
        bCollate, _
        bPreventWarning, _
        m_lhWnd, _
        m_objObject, _
        m_lFlags, _
        m_bHookDialog, _
        Me)) Then
        ' Success
        m_lCopies = iCopies
    End If
End Sub
Public Sub ShowHelp()
    'run winhelp.exe with the specified help file
    Dim sHelpFileBuff As String
    Dim lData As Long
    Dim lR As Long
    
    On Error GoTo ShowHelpError
    
    m_bFileDialog = False
    '***    prepare the buffers and parameters for the API function
    'sHelpFile is a null terminated string
    sHelpFileBuff = m_sHelpFile & Chr$(0)
    
    'sData is dependent on lHelpCommand
    Select Case m_eHelpCommand
    Case HELP_CONTEXT, HELP_CONTEXTPOPUP, HELP_SETCONTENTS, HELP_SETINDEX
        ' lData should be an unsigned long integer pointing to the context identifier
        
    Case HELP_COMMAND, HELP_PARTIALKEY
        ' lData is an address of a string
        
    Case HELP_CONTENTS, HELP_FORCEFILE, HELP_HELPONHELP, HELP_INDEX, HELP_QUIT
        ' lData is not required
        lData = 0
    Case HELP_SETWINPOS, HELP_MULTIKEY
        ' lData should point to a structure.  Can't call here - use separate functions to perform
        Err.Raise eeBaseCommonDialog + &HFF, App.EXEName, "Invalid WinHelp Command Passed to ShowHelp function."
    End Select
    
    '***    call the API function
    lR = WinHelp(m_lhWnd, m_sHelpFile, m_eHelpCommand, lData)    ' - Store to APIReturn property
    If (lR <> 0) Then
        ' Success
    Else
        Err.Raise LastApiError, App.EXEName & ".cCommonDialog", ApiError(LastApiError)
    End If
        
Exit Sub

ShowHelpError:
    Err.Raise Err.Number, App.EXEName & ".cCommonDialog"
    Exit Sub

End Sub
Public Property Get HookDialog() As Boolean
    HookDialog = m_bHookDialog
End Property
Public Property Let HookDialog(ByVal bHook As Boolean)
    m_bHookDialog = bHook
End Property
Private Function ApiError(ByVal e As Long) As String
    Dim s As String, c As Long
    s = String(256, 0)
    c = FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM Or _
                      FORMAT_MESSAGE_IGNORE_INSERTS, _
                      0, e, 0&, s, Len(s), ByVal 0)
    If c Then ApiError = Left$(s, c)
End Function

Private Function LastApiError() As String
    LastApiError = ApiError(Err.LastDllError)
End Function
Private Function FlagSet(ByVal lWord As Long, ByVal lFlagValue As Long)
    FlagSet = ((lWord And lFlagValue) = lFlagValue)
End Function
Private Function TranslateColor(ByVal clr As OLE_COLOR, _
                        Optional hPal As Long = 0) As Long
    If OleTranslateColor(clr, hPal, TranslateColor) Then
        TranslateColor = -1
    End If
End Function
Private Sub pCommonDialogError()
    ' We have an error:
    If (mCommonDialog.APIReturn = 0) Then
        ' Cancelled:
        If (m_bCancelError) Then
            ' Note if your code stops here, that is because your error
            ' options in VB are "Break in Class Module".  Change your
            ' error option to "Break on Unhandled Errors" to see how
            ' this works at runtime.
            Err.Raise 20001, App.EXEName & ".cCommonDialog", "User selected cancel."
        End If
    Else
        Err.Raise eeBaseCommonDialog Or mCommonDialog.ExtendedError, App.EXEName & ".cCommonDialog"
    End If
End Sub
Private Sub Class_Initialize()
    m_lFilterIndex = 1
End Sub

Private Sub Class_Terminate()
    Set mCommonDialog = Nothing
End Sub

Public Property Get hInstance() As Long
    hInstance = m_lhInstance
End Property

Public Property Let hInstance(ByVal lNewValue As Long)
    m_lhInstance = lNewValue
End Property

Public Sub cdLoadLibrary(DllName As String)
    m_lhInstance = LoadLibrary(DllName)
End Sub

Public Sub cdFreeLibrary()
    If m_lhInstance > 0 Then FreeLibrary m_lhInstance
End Sub

Public Property Get TemplateName() As Long
    TemplateName = m_lTemplateName
End Property

Public Property Let TemplateName(ByVal lNewValue As Long)
    m_lTemplateName = lNewValue
End Property



