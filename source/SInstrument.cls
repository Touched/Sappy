VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "SInstrument"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"No"
Public Key As String

Private mvarKeyMaps As SKeyMaps 'local copy
Private mvarDirects As SDirects 'local copy
Public Property Set Directs(ByVal vData As SDirects)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.Directs = Form1
    Set mvarDirects = vData
End Property


Public Property Get Directs() As SDirects
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.Directs
    Set Directs = mvarDirects
End Property



Public Property Set KeyMaps(ByVal vData As SKeyMaps)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.KeyMaps = Form1
    Set mvarKeyMaps = vData
End Property


Public Property Get KeyMaps() As SKeyMaps
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.KeyMaps
    Set KeyMaps = mvarKeyMaps
End Property



