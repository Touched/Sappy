VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "SChannels"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Holds collection of channels"
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"SChannel"
Attribute VB_Ext_KEY = "Member0" ,"SChannel"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'local variable to hold collection
Private mCol As Collection
Public Sub Clear()
    While mCol.count > 0
     mCol.Remove 1
    Wend

End Sub
Public Function Add(Optional sKey As String) As SChannel
    'create a new object
    Dim objNewMember As SChannel
    Set objNewMember = New SChannel


    'set the properties passed into the method
    objNewMember.Key = sKey
    Set objNewMember.Notes = New SNotes
    objNewMember.PatchNumber = 0
    objNewMember.Panning = &H40
    objNewMember.MainVolume = 100
    objNewMember.mute = False
    objNewMember.Enabled = True
    objNewMember.PitchBend = &H40
    objNewMember.PitchBendRange = 2
    objNewMember.Sustain = False
    objNewMember.Transpose = 0
    Set objNewMember.Subroutines = New SSubroutines
    Set objNewMember.EventQueue = New SappyEventQueue
    objNewMember.LoopPointer = 0
    objNewMember.SubCountAtLoop = 1
    objNewMember.SubroutineCounter = 1
    objNewMember.ProgramCounter = 1
    objNewMember.WaitTicks = -1
    mCol.Add objNewMember

    'return the object created
    Set Add = objNewMember
    Set objNewMember = Nothing


End Function

Public Property Get Item(vntIndexKey As Variant) As SChannel
Attribute Item.VB_UserMemId = 0

    'used when referencing an element in the collection
    'vntIndexKey contains either the Index or Key to the collection,
    'this is why it is declared as a Variant
    'Syntax: Set foo = x.Item(xyz) or Set foo = x.Item(5)
  Set Item = mCol(vntIndexKey)
End Property



Public Property Get count() As Long
    'used when retrieving the number of elements in the
    'collection. Syntax: Trace x.Count
    count = mCol.count
End Property


Public Sub Remove(vntIndexKey As Variant)
    'used when removing an element from the collection
    'vntIndexKey contains either the Index or Key, which is why
    'it is declared as a Variant
    'Syntax: x.Remove(xyz)


    mCol.Remove vntIndexKey
End Sub


Public Property Get NewEnum() As IUnknown
Attribute NewEnum.VB_UserMemId = -4
Attribute NewEnum.VB_MemberFlags = "40"
    'this property allows you to enumerate
    'this collection with the For...Each syntax
    Set NewEnum = mCol.[_NewEnum]
End Property


Private Sub Class_Initialize()
    'creates the collection when this class is created
    Set mCol = New Collection
End Sub


Private Sub Class_Terminate()
    'destroys collection when this class is terminated
    Set mCol = Nothing
End Sub

