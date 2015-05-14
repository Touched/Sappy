VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "SChannel"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"No"
Public Key As String
Attribute Key.VB_VarDescription = "Channel ID"

Private mvarNotes As SNotes 'local copy
Public Enum ChannelOutputTypes
    cotDirect = 0
    cotSquare1 = 1
    cotSquare2 = 2
    cotWave = 3
    cotNoise = 4
    cotUnk5 = 5
    cotUnk6 = 6
    cotUnk7 = 7
    cotMultiSample = 8
    cotDrumKit = 9
    cotNull = 255
End Enum
Private mvarEnabled As Boolean
Private mvarPatchNumber As Byte 'local copy
Private mvarPanning As Integer 'local copy
Private mvarMainVolume As Byte 'local copy
Private mvarPitchBend As Byte 'local copy
Private mvarVibratoDepth As Byte 'local copy
Private mvarVibratoRate As Byte 'local copy
Private mvarPitchBendRange As Integer 'local copy
Private mvarSustain As Boolean 'local copy
Private mvarTranspose As Integer 'local copy
Private mvarSubroutines As SSubroutines 'local copy
Private mvarEventQueue As SappyEventQueue 'local copy
Private mvarTrackPointer As Long 'local copy
Private mvarLoopPointer As Long 'local copy
Private mvarProgramCounter As Long 'local copy
Private mvarMute As Boolean
Private mvarOutputType As ChannelOutputTypes
Private mvarReturnPointer As Long 'local copy
Private mvarInSubroutine As Boolean 'localcopy
Private mvarSubroutineCounter As Integer 'localcopy
Private mvarSubCountAtLoop As Integer 'localcopy
Private mvarWaitTicks As Double 'localcopy
Private mvarTrackLengthInBytes As Long
'local variable(s) to hold property value(s)

Public Property Let outputtype(ByVal vData As ChannelOutputTypes)
Attribute outputtype.VB_Description = "Output Device"
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.OutputType = Form1
    Let mvarOutputType = vData
End Property


Public Property Get outputtype() As ChannelOutputTypes
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.OutputType
    Let outputtype = mvarOutputType
End Property


Public Property Let TrackPointer(ByVal vData As Long)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.TrackPointer = 5
    mvarTrackPointer = vData
End Property


Public Property Get TrackPointer() As Long
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.TrackPointer
    TrackPointer = mvarTrackPointer
End Property

Public Property Let LoopPointer(ByVal vData As Long)
Attribute LoopPointer.VB_Description = "Pointer to loop point in the event queue"
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.LoopPointer = 5
    mvarLoopPointer = vData
End Property


Public Property Get LoopPointer() As Long
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.LoopPointer
    LoopPointer = mvarLoopPointer
End Property

Public Property Get Enabled() As Boolean
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.LoopPointer
    Enabled = mvarEnabled
End Property

Public Property Let Enabled(ByVal vData As Boolean)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.LoopPointer = 5
    mvarEnabled = vData
End Property

Public Property Get mute() As Boolean
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.LoopPointer
    mute = mvarMute
End Property

Public Property Let mute(ByVal vData As Boolean)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.LoopPointer = 5
    mvarMute = vData
End Property



Public Property Let WaitTicks(ByVal vData As Double)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.LoopPointer = 5
    mvarWaitTicks = vData
End Property

Public Property Get WaitTicks() As Double
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.LoopPointer
    WaitTicks = mvarWaitTicks
End Property

Public Property Let ReturnPointer(ByVal vData As Long)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.LoopPointer = 5
    mvarReturnPointer = vData
End Property


Public Property Get ReturnPointer() As Long
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.LoopPointer
    ReturnPointer = mvarReturnPointer
End Property




Public Property Let InSubroutine(ByVal vData As Boolean)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.LoopPointer = 5
    mvarInSubroutine = vData
End Property


Public Property Get InSubroutine() As Boolean
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.LoopPointer
    InSubroutine = mvarInSubroutine
End Property

Public Property Let SubroutineCounter(ByVal vData As Integer)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.LoopPointer = 5
    mvarSubroutineCounter = vData
End Property


Public Property Get SubroutineCounter() As Integer
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.LoopPointer
    SubroutineCounter = mvarSubroutineCounter
End Property


Public Property Let SubCountAtLoop(ByVal vData As Integer)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.LoopPointer = 5
    mvarSubCountAtLoop = vData
End Property


Public Property Get SubCountAtLoop() As Integer
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.LoopPointer
    SubCountAtLoop = mvarSubCountAtLoop
End Property



Public Property Let ProgramCounter(ByVal vData As Long)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.LoopPointer = 5
    mvarProgramCounter = vData
End Property


Public Property Get ProgramCounter() As Long
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.LoopPointer
    ProgramCounter = mvarProgramCounter
End Property



Public Property Set EventQueue(ByVal vData As SappyEventQueue)
Attribute EventQueue.VB_Description = "Channel's event queue"
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.EventQueue = Form1
    Set mvarEventQueue = vData
End Property


Public Property Get EventQueue() As SappyEventQueue
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.EventQueue
    Set EventQueue = mvarEventQueue
End Property



Public Property Set Subroutines(ByVal vData As SSubroutines)
Attribute Subroutines.VB_Description = "Collection of the channel's subroutines"
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.Subroutines = Form1
    Set mvarSubroutines = vData
End Property


Public Property Get Subroutines() As SSubroutines
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.Subroutines
    Set Subroutines = mvarSubroutines
End Property



Public Property Let Transpose(ByVal vData As Integer)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.Transpose = 5
    mvarTranspose = vData
End Property


Public Property Get Transpose() As Integer
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.Transpose
    Transpose = mvarTranspose
End Property



Public Property Let Sustain(ByVal vData As Boolean)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.Sustain = 5
    mvarSustain = vData
End Property


Public Property Get Sustain() As Boolean
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.Sustain
    Sustain = mvarSustain
End Property



Public Property Let PitchBendRange(ByVal vData As Integer)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.PitchBendRange = 5
    mvarPitchBendRange = vData
End Property


Public Property Get PitchBendRange() As Integer
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.PitchBendRange
    PitchBendRange = mvarPitchBendRange
End Property



Public Property Let PitchBend(ByVal vData As Byte)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.PitchBend = 5
    mvarPitchBend = vData
End Property


Public Property Get PitchBend() As Byte
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.PitchBend
    PitchBend = mvarPitchBend
End Property

Public Property Let VibratoRate(ByVal vData As Byte)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.VibratoRate = 5
    mvarVibratoRate = vData
End Property


Public Property Get VibratoRate() As Byte
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.VibratoRate
    VibratoRate = mvarVibratoRate
End Property
Public Property Let VibratoDepth(ByVal vData As Byte)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.VibratoDepth = 5
    mvarVibratoDepth = vData
End Property


Public Property Get VibratoDepth() As Byte
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.VibratoDepth
    VibratoDepth = mvarVibratoDepth
End Property
Public Property Let MainVolume(ByVal vData As Byte)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.MainVolume = 5
    mvarMainVolume = vData
End Property


Public Property Get MainVolume() As Byte
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.MainVolume
    MainVolume = mvarMainVolume
End Property



Public Property Let Panning(ByVal vData As Integer)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.Panning = 5
    mvarPanning = vData
End Property


Public Property Get Panning() As Integer
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.Panning
    Panning = mvarPanning
End Property



Public Property Let PatchNumber(ByVal vData As Byte)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.PatchNumber = 5
    mvarPatchNumber = vData
End Property


Public Property Get PatchNumber() As Byte
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.PatchNumber
    PatchNumber = mvarPatchNumber
End Property




Public Property Set Notes(ByVal vData As SNotes)
Attribute Notes.VB_Description = "Collection of Notes"
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.Notes = Form1
    Set mvarNotes = vData
End Property


Public Property Get Notes() As SNotes
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.Notes
    Set Notes = mvarNotes
End Property




Public Property Let TrackLengthInBytes(ByVal vData As Long)
  mvarTrackLengthInBytes = vData
End Property


Public Property Get TrackLengthInBytes() As Long
  TrackLengthInBytes = mvarTrackLengthInBytes
End Property

