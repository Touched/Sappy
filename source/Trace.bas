Attribute VB_Name = "mTrace"
Option Explicit

Private Declare Function GetProp Lib "user32" Alias "GetPropA" (ByVal hwnd As Long, ByVal lpString As String) As Long
Private Declare Function EnumWindows Lib "user32" (ByVal lpEnumFunc As Long, ByVal lParam As Long) As Long
Private Declare Function SendMessageTimeout Lib "user32" Alias "SendMessageTimeoutA" (ByVal hwnd As Long, ByVal msg As Long, ByVal wParam As Long, lParam As Any, ByVal fuFlags As Long, ByVal uTimeout As Long, lpdwResult As Long) As Long
Private Const SMTO_NORMAL = &H0
Public Const WM_COPYDATA = &H4A
Public Type COPYDATASTRUCT
   dwData As Long
   cbData As Long
   lpData As Long
End Type
Private Const THISAPPID = "vbAcceleratorVBTRACER"


Private m_hWnd As Long
Private m_bInitialised As Boolean

#If TRACEMODE = 1 Then
Public Sub Trace(ParamArray args() As Variant)
   If (DoTrace) Then
      Dim sPrint As String
      SendTraceMessage args()
   End If
End Sub

Public Sub Assert(ByVal condition As Boolean, ParamArray args() As Variant)
   If Not (m_hWnd = 0) Then
      Debug.Assert condition
      SendTraceMessage args(), "Assert Failed"
   End If
End Sub

Private Function DoTrace() As Boolean
   If Not (m_bInitialised) Then
      FindTraceWindow
      m_bInitialised = True
   End If
   DoTrace = Not (m_hWnd = 0)
End Function

Private Function SendTraceMessage(ParamArray args() As Variant)
   
   On Error Resume Next
   Dim i As Long
   Dim j As Long
   Dim sPrint As String
   For i = LBound(args) To UBound(args)
      If ((VarType(args(i)) And vbArray) = vbArray) Then
         For j = LBound(args(i)) To UBound(args(i))
            sPrint = sPrint & args(i)(j) & vbTab
         Next j
      Else
         sPrint = sPrint & args(i) & vbTab
      End If
   Next i
   sPrint = App.EXEName & ": " & App.hInstance & ": " & App.ThreadID & ": " & Format$(Now, "yyyymmdd hhnnss") & ": " & sPrint

   Dim tCDS As COPYDATASTRUCT, b() As Byte, lR As Long
   b = StrConv(sPrint, vbFromUnicode)
   tCDS.dwData = 0
   tCDS.cbData = UBound(b) + 1
   tCDS.lpData = VarPtr(b(0))
            
   ' Give in if not response
   lR = SendMessageTimeout(m_hWnd, WM_COPYDATA, 0, tCDS, SMTO_NORMAL, 5000, lR)
   
   
End Function

Private Function FindTraceWindow() As Long
   ' Enumerate top-level windows:
   m_hWnd = 0
   EnumWindows AddressOf EnumWindowsProc, 0
End Function
Private Function EnumWindowsProc( _
        ByVal hwnd As Long, _
        ByVal lParam As Long _
    ) As Long
Dim bStop As Boolean
   ' Customised windows enumeration procedure.  Stops
   ' when it finds another application with the Window
   ' property set, or when all windows are exhausted.
   bStop = False
   If IsTraceWindow(hwnd) Then
      EnumWindowsProc = 0
      m_hWnd = hwnd
   Else
      EnumWindowsProc = 1
   End If
End Function

Private Function IsTraceWindow(ByVal hwnd As Long) As Boolean
   IsTraceWindow = (GetProp(hwnd, THISAPPID & "_TRACEWIN") = 1)
End Function


#Else
Public Sub Trace(ParamArray args() As Variant)

End Sub
Public Sub Assert(ByVal condition As Boolean)

End Sub
#End If


