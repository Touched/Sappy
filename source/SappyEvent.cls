VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "SappyEvent"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"No"
Public Key As String
Attribute Key.VB_VarDescription = "Event ID"

'local variable(s) to hold property value(s)
Private mvarTicks As Long 'local copy
Private mvarCommandByte As Byte 'local copy
Private mvarParam1 As Byte 'local copy
Private mvarParam2 As Byte 'local copy
Private mvarParam3 As Byte 'local copy
Public Property Let Param3(ByVal vData As Byte)
Attribute Param3.VB_Description = "Command Paramater 1"
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.Param3 = 5
    mvarParam3 = vData
End Property


Public Property Get Param3() As Byte
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.Param3
    Param3 = mvarParam3
End Property



Public Property Let Param2(ByVal vData As Byte)
Attribute Param2.VB_Description = "Command Paramater 2"
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.Param2 = 5
    mvarParam2 = vData
End Property


Public Property Get Param2() As Byte
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.Param2
    Param2 = mvarParam2
End Property



Public Property Let Param1(ByVal vData As Byte)
Attribute Param1.VB_Description = "Command Paramater 1"
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.Param1 = 5
    mvarParam1 = vData
End Property


Public Property Get Param1() As Byte
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.Param1
    Param1 = mvarParam1
End Property



Public Property Let CommandByte(ByVal vData As Byte)
Attribute CommandByte.VB_Description = "Sappy command byte:\r\nB1 - End Track \r\nB2 - Jump to position in event queue (Params: ticks)\r\nB3 - Jump to subroutine in event queue (Params: ticks)\r\nB4 - End of subroutine \r\nBB - Tempo (Params: BPM/2)\r\nBC - Transpose (Params: Signed Semitone)\r\nBD - Set Patch (Params: GM)\r\nBE - Set Volume (Params: GM)\r\nBF - Set Panning (Params: Signed GM)\r\nC0 - Set Pitch Bend (Params: Signed GM)\r\nC1 - Set Pitch Bend Range (Params: Semitones)\r\nC2 - Set vibrato depth (Params: Number)\r\nC4 - Set vibrato rate (Params: Number)\r\nCE - Note sustain off\r\nCF - Note sustain for long notes\r\nD1-FF - Play a note (Params: Note number, Velocity, ???)"
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.CommandByte = 5
    mvarCommandByte = vData
End Property


Public Property Get CommandByte() As Byte
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.CommandByte
    CommandByte = mvarCommandByte
End Property



Public Property Let Ticks(ByVal vData As Long)
Attribute Ticks.VB_Description = "Time in ticks when event occurs"
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.Ticks = 5
    mvarTicks = vData
End Property


Public Property Get Ticks() As Long
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.Ticks
    Ticks = mvarTicks
End Property



