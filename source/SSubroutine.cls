VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "SSubroutine"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"No"
Public Key As String
Attribute Key.VB_VarDescription = "Subroutine ID"

Private mvarEventQueuePointer As Long 'local copy
Public Property Let EventQueuePointer(ByVal vData As Long)
Attribute EventQueuePointer.VB_Description = "Pointer to the subroutine in the event queue"
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.EventQueuePointer = 5
    mvarEventQueuePointer = vData
End Property


Public Property Get EventQueuePointer() As Long
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.EventQueuePointer
    EventQueuePointer = mvarEventQueuePointer
End Property



