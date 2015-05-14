VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cFormShadow"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private BottomShadow As fDropShadow
Private RightShadow As fDropShadow

Public Sub Attach(Victim As Form)
  Set BottomShadow = New fDropShadow
  BottomShadow.ShadowSize = 8
  'BottomShadow.ShadowType = BottomShadow
  BottomShadow.Shadow = Victim
  BottomShadow.Show , Victim

  Set RightShadow = New fDropShadow
  RightShadow.ShadowSize = 8
  'RightShadow.ShadowType = RightShadow
  RightShadow.Shadow = Victim
  RightShadow.Show , Victim
End Sub

Private Sub Class_Terminate()
  Unload BottomShadow
  Unload RightShadow
  Set BottomShadow = Nothing
  Set RightShadow = Nothing
End Sub
