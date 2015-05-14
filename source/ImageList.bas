Attribute VB_Name = "Module1"
Option Explicit

Private Declare Function ImageList_Draw Lib "comctl32.dll" (ByVal hIml As Long, ByVal i As Long, ByVal hdcDst As Long, ByVal x As Long, ByVal y As Long, ByVal fStyle As Long) As Long

Private Const ILD_NORMAL = 0
Private Const ILD_TRANSPARENT = 1
Private Const ILD_BLEND25 = 2
Private Const ILD_SELECTED = 4
Private Const ILD_FOCUS = 4

Public Sub ImageListDrawIcon(ByVal ptrVb6ImageList As Long, ByVal hdc As Long, ByVal hIml As Long, ByVal iIconIndex As Long, ByVal lX As Long, ByVal lY As Long, Optional ByVal bSelected As Boolean = False, Optional ByVal bBlend25 As Boolean = False)
  Dim lFlags As Long
  Dim lR As Long
  
  lFlags = ILD_TRANSPARENT
  If (bSelected) Then lFlags = lFlags Or ILD_SELECTED
  If (bBlend25) Then lFlags = lFlags Or ILD_BLEND25
  If (ptrVb6ImageList <> 0) Then
    Dim o As Object
    On Error Resume Next
    Set o = ObjectFromPtr(ptrVb6ImageList)
    If Not (o Is Nothing) Then o.ListImages(iIconIndex + 1).Draw hdc, lX * Screen.TwipsPerPixelX, lY * Screen.TwipsPerPixelY, lFlags
    On Error GoTo 0
  Else
    lR = ImageList_Draw(hIml, iIconIndex, hdc, lX, lY, lFlags)
    If (lR = 0) Then
    Debug.Print "Failed to draw Image: " & iIconIndex & " onto hDC " & hdc, "ImageListDrawIcon"
    End If
  End If
End Sub

Private Property Get ObjectFromPtr(ByVal lPtr As Long) As Object
  ' Author: Bruce McKinney
  ' Turn the pointer into an illegal, uncounted interface
  Dim objT As Object
  If Not (lPtr = 0) Then
    CopyMemory objT, lPtr, 4
    ' Do NOT hit the End button here! You will crash!
    ' Assign to legal reference
    Set ObjectFromPtr = objT
    ' Still do NOT hit the End button here! You will still crash!
    ' Destroy the illegal reference
    CopyMemory objT, 0&, 4
  End If
End Property

