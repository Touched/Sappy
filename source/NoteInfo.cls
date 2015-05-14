VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "NoteInfo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Private mvarEnabled As Boolean
Private mvarFModChannel As Long
Private mvarNoteNumber As Byte
Private mvarFrequency As Long
Private mvarVelocity As Byte
Private mvarPatchNumber As Byte
Private mvarParentChannel As Long
Private mvarSampleID As String
Private mvarUnknownValue As Byte
Public Enum NoteOutputTypes
  notDirect = 0
  notSquare1 = 1
  notSquare2 = 2
  notWave = 3
  notNoise = 4
  notUnk5 = 5
  notUnk6 = 6
  notUnk7 = 7
End Enum
Public Enum NotePhases
  npInitial = 0
  npAttack = 1
  npDecay = 2
  npSustain = 3
  npRelease = 4
  npNoteOff = 5
End Enum
Private mvarNoteOff As Boolean
Private mvarNotePhase As NotePhases
Private mvarOutputType As NoteOutputTypes
Private mvarEnvStep As Double
Private mvarEnvDestination As Double
Private mvarEnvPosition As Double
Private mvarEnvAttenuation As Byte
Private mvarEnvDecay As Byte
Private mvarEnvSustain As Byte
Private mvarEnvRelease As Byte
Private mvarWaitTicks As Double
Private mvarKey As String

Public Property Let EnvPosition(ByVal vData As Double)
  mvarEnvPosition = vData
End Property
Public Property Get EnvPosition() As Double
  EnvPosition = mvarEnvPosition
End Property

Public Property Let EnvDestination(ByVal vData As Double)
  mvarEnvDestination = vData
End Property
Public Property Get EnvDestination() As Double
  EnvDestination = mvarEnvDestination
End Property

Public Property Let EnvStep(ByVal vData As Double)
  mvarEnvStep = vData
End Property
Public Property Get EnvStep() As Double
  EnvStep = mvarEnvStep
End Property

Public Property Let Notephase(ByVal vData As NotePhases)
  mvarNotePhase = vData
End Property
Public Property Get Notephase() As NotePhases
  Notephase = mvarNotePhase
End Property

Public Property Let Key(ByVal vData As String)
  mvarKey = vData
End Property
Public Property Get Key() As String
  Key = mvarKey
End Property

Public Property Let WaitTicks(ByVal vData As Double)
  mvarWaitTicks = vData
End Property
Public Property Get WaitTicks() As Double
  WaitTicks = mvarWaitTicks
End Property

Public Property Let EnvRelease(ByVal vData As Byte)
  mvarEnvRelease = vData
End Property
Public Property Get EnvRelease() As Byte
  EnvRelease = mvarEnvRelease
End Property

Public Property Let PatchNumber(ByVal vData As Byte)
  mvarPatchNumber = vData
End Property
Public Property Get PatchNumber() As Byte
  PatchNumber = mvarPatchNumber
End Property

Public Property Let SampleID(ByVal vData As String)
  mvarSampleID = vData
End Property
Public Property Get SampleID() As String
  SampleID = mvarEnvRelease
End Property

Public Property Let EnvSustain(ByVal vData As Byte)
  mvarEnvSustain = vData
End Property
Public Property Get EnvSustain() As Byte
  EnvSustain = mvarEnvSustain
End Property

Public Property Let EnvDecay(ByVal vData As Byte)
  mvarEnvDecay = vData
End Property
Public Property Get EnvDecay() As Byte
  EnvDecay = mvarEnvDecay
End Property

Public Property Let EnvAttenuation(ByVal vData As Byte)
  mvarEnvAttenuation = vData
End Property
Public Property Get EnvAttenuation() As Byte
  EnvAttenuation = mvarEnvAttenuation
End Property

Public Property Let outputtype(ByVal vData As NoteOutputTypes)
  mvarOutputType = vData
End Property
Public Property Get outputtype() As NoteOutputTypes
  outputtype = mvarOutputType
End Property

Public Property Let UnknownValue(ByVal vData As Byte)
  mvarUnknownValue = vData
End Property
Public Property Get UnknownValue() As Byte
  UnknownValue = mvarUnknownValue
End Property

Public Property Let ParentChannel(ByVal vData As Long)
  mvarParentChannel = vData
End Property
Public Property Get ParentChannel() As Long
  ParentChannel = mvarParentChannel
End Property

Public Property Let Velocity(ByVal vData As Byte)
  mvarVelocity = vData
End Property
Public Property Get Velocity() As Byte
  Velocity = mvarVelocity
End Property

Public Property Let Frequency(ByVal vData As Long)
  mvarFrequency = vData
End Property
Public Property Get Frequency() As Long
  Frequency = mvarFrequency
End Property

Public Property Let NoteNumber(ByVal vData As Byte)
  mvarNoteNumber = vData
End Property
Public Property Get NoteNumber() As Byte
  NoteNumber = mvarNoteNumber
End Property

Public Property Let FModChannel(ByVal vData As Long)
  mvarFModChannel = vData
End Property
Public Property Get FModChannel() As Long
  FModChannel = mvarFModChannel
End Property

Public Property Let Enabled(ByVal vData As Boolean)
  mvarEnabled = vData
End Property
Public Property Get Enabled() As Boolean
  Enabled = mvarEnabled
End Property

Public Property Let NoteOff(ByVal vData As Boolean)
  mvarNoteOff = vData
End Property
Public Property Get NoteOff() As Boolean
  NoteOff = mvarNoteOff
End Property

