VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "SNote"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"No"
Public Key As String
Attribute Key.VB_VarDescription = "Note ID from Channel perspective"


'local variable(s) to hold property value(s)
Private mvarNoteID As Byte 'local copy
'local variable(s) to hold property value(s)



Public Property Let NoteID(ByVal vData As Byte)
Attribute NoteID.VB_Description = "Note ID in polyphony list"
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.NoteID = 5
    mvarNoteID = vData
End Property


Public Property Get NoteID() As Byte
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.NoteID
    NoteID = mvarNoteID
End Property



