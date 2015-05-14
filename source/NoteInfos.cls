VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "NoteInfos"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"NoteInfo"
Attribute VB_Ext_KEY = "Member0" ,"NoteInfo"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Private mCol As Collection

Public Sub Clear()
  While mCol.count > 0
    mCol.Remove 1
  Wend
End Sub

Public Function Add(ByVal Enabled As Boolean, ByVal FModChannel As Long, ByVal NoteNumber As Byte, ByVal Frequency As Long, ByVal Velocity As Byte, ByVal ParentChannel As Long, ByVal UnknownValue As Byte, ByVal outputtype As NoteOutputTypes, ByVal EnvAttenuation As Byte, ByVal EnvDecay As Byte, ByVal EnvSustain As Byte, ByVal EnvRelease As Byte, ByVal WaitTicks As Long, ByVal PatchNumber As Byte, Optional ByVal sKey As String) As NoteInfo
  Dim objNewMember As NoteInfo
  Set objNewMember = New NoteInfo
  
  objNewMember.Key = sKey
  objNewMember.NoteOff = False
  objNewMember.Enabled = Enabled
  objNewMember.FModChannel = FModChannel
  objNewMember.NoteNumber = NoteNumber
  objNewMember.Frequency = Frequency
  objNewMember.Velocity = Velocity
  objNewMember.PatchNumber = PatchNumber
  objNewMember.ParentChannel = ParentChannel
  objNewMember.SampleID = SampleID
  objNewMember.UnknownValue = UnknownValue
  objNewMember.outputtype = outputtype
  objNewMember.Notephase = npInitial
  objNewMember.EnvDestination = 0
  objNewMember.EnvStep = 0
  objNewMember.EnvPosition = 0
  objNewMember.EnvAttenuation = EnvAttenuation
  objNewMember.EnvDecay = EnvDecay
  objNewMember.EnvSustain = EnvSustain
  objNewMember.EnvRelease = EnvRelease
  objNewMember.WaitTicks = WaitTicks
  If Len(sKey) = 0 Then
    mCol.Add objNewMember
  Else
  mCol.Add objNewMember, sKey
  End If
  
  Set Add = objNewMember
  Set objNewMember = Nothing
End Function

Public Property Get Item(vntIndexKey As Variant) As NoteInfo
Attribute Item.VB_UserMemId = 0
  Set Item = mCol(vntIndexKey)
End Property

Public Property Get count() As Long
  count = mCol.count
End Property

Public Sub Remove(vntIndexKey As Variant)
  mCol.Remove vntIndexKey
End Sub

Public Property Get NewEnum() As IUnknown
Attribute NewEnum.VB_UserMemId = -4
Attribute NewEnum.VB_MemberFlags = "40"
  Set NewEnum = mCol.[_NewEnum]
End Property

Private Sub Class_Initialize()
  Set mCol = New Collection
End Sub

Private Sub Class_Terminate()
  Set mCol = Nothing
End Sub

