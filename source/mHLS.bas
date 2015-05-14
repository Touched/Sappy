Attribute VB_Name = "mColorUtils"
Option Explicit

Private Declare Function OleTranslateColor Lib "OLEPRO32.DLL" (ByVal OLE_COLOR As Long, ByVal HPALETTE As Long, pccolorref As Long) As Long
Public Const CLR_INVALID = -1

Public Sub RGBToHLS(ByVal r As Long, ByVal g As Long, ByVal b As Long, h As Single, s As Single, l As Single)
  Dim Max As Single, Min As Single, delta As Single, rR As Single, rG As Single, rB As Single
  rR = r / 255: rG = g / 255: rB = b / 255
  Max = Maximum(rR, rG, rB)
  Min = Minimum(rR, rG, rB)
  l = (Max + Min) / 2
  If Max = Min Then
    s = 0
    h = 0
  Else
    If l <= 0.5 Then
      s = (Max - Min) / (Max + Min)
    Else
      s = (Max - Min) / (2 - Max - Min)
    End If
    delta = Max - Min
    If rR = Max Then
      h = (rG - rB) / delta
    ElseIf rG = Max Then
      h = 2 + (rB - rR) / delta
    ElseIf rB = Max Then
      h = 4 + (rR - rG) / delta
    End If
  End If
End Sub

Public Sub HLSToRGB(ByVal h As Single, ByVal s As Single, ByVal l As Single, r As Long, g As Long, b As Long)
  Dim rR As Single, rG As Single, rB As Single, Min As Single, Max As Single
  If s = 0 Then
    rR = l: rG = l: rB = l
  Else
    If l <= 0.5 Then
      Min = l * (1 - s)
    Else
      Min = l - s * (1 - l)
    End If
    Max = 2 * l - Min
    If (h < 1) Then
      rR = Max
      If (h < 0) Then
        rG = Min
        rB = rG - h * (Max - Min)
      Else
        rB = Min
        rG = h * (Max - Min) + rB
      End If
    ElseIf (h < 3) Then
      rG = Max
      If (h < 2) Then
        rB = Min
        rR = rB - (h - 2) * (Max - Min)
      Else
        rR = Min
        rB = (h - 2) * (Max - Min) + rR
      End If
    Else
      rB = Max
      If (h < 4) Then
        rR = Min
        rG = rR - (h - 4) * (Max - Min)
      Else
        rG = Min
        rR = (h - 4) * (Max - Min) + rG
      End If
    End If
  End If
  r = rR * 255: g = rG * 255: b = rB * 255
End Sub

Private Function Maximum(rR As Single, rG As Single, rB As Single) As Single
  If (rR > rG) Then
    If (rR > rB) Then
      Maximum = rR
    Else
      Maximum = rB
    End If
  Else
    If (rB > rG) Then
      Maximum = rB
    Else
      Maximum = rG
    End If
  End If
End Function
Private Function Minimum(rR As Single, rG As Single, rB As Single) As Single
  If (rR < rG) Then
    If (rR < rB) Then
      Minimum = rR
    Else
      Minimum = rB
    End If
  Else
    If (rB < rG) Then
      Minimum = rB
    Else
      Minimum = rG
    End If
  End If
End Function

Public Sub SplitRGB(lColor As Long, ByRef lRed As Long, ByRef lGreen As Long, ByRef lBlue As Long)
  lRed = (lColor And &HFF&)
  lGreen = (lColor And &HFF00&) \ &H100&
  lBlue = (lColor And &HFF0000) \ &H100& \ &H100&
End Sub

Public Function TranslateColor(ByVal oClr As OLE_COLOR, Optional hPal As Long = 0) As Long
  If OleTranslateColor(oClr, hPal, TranslateColor) Then TranslateColor = CLR_INVALID
End Function

Public Sub SplitTest(lColor As Long)
  Dim lRed As Long, lGreen As Long, lBlue As Long
  lRed = (lColor And &HFF&)
  lGreen = (lColor And &HFF00&) \ &H100&
  lBlue = (lColor And &HFF0000) \ &H100& \ &H100&
End Sub

Public Sub Colorize(Victim As PictureBox, hue As Single, Optional sat As Single = 1)
  Dim X As Integer
  Dim Y As Integer
  Dim r As Long
  Dim g As Long
  Dim b As Long
  Dim h As Single
  Dim l As Single
  Dim s As Single
  Dim C As Long
  
  For X = 0 To Victim.ScaleWidth
    For Y = 0 To Victim.ScaleHeight
      'c = Victim.point(x, y)
      C = GetPixel(Victim.hdc, X, Y)
      SplitRGB C, r, g, b
      RGBToHLS r, g, b, h, s, l
      HLSToRGB hue, sat, l, r, g, b
      C = RGB(r, g, b)
      SetPixel Victim.hdc, X, Y, C
      'Victim.PSet (x, y), c
    Next Y
  Next X
End Sub

Public Function ChangeBrightness(lColor As Long, iDelta As Single) As Long
  Dim X As Integer
  Dim Y As Integer
  Dim r As Long
  Dim g As Long
  Dim b As Long
  Dim h As Single
  Dim l As Single
  Dim s As Single
  SplitRGB lColor, r, g, b
  RGBToHLS r, g, b, h, s, l
  l = l + iDelta
  If l < 0 Then l = 0
  If l > 1 Then l = 1
  HLSToRGB h, s, l, r, g, b
  ChangeBrightness = RGB(r, g, b)
End Function

