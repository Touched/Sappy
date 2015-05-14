VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "SDirect"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"No"
Public Key As String

Private mvarSampleID As String 'local copy
Private mvarEnvAttenuation As Byte 'local copy
Private mvarEnvDecay As Byte 'local copy
Private mvarEnvSustain As Byte 'local copy
Private mvarEnvRelease As Byte 'local copy
Private mvarRaw0 As Byte 'local copy
Private mvarRaw1 As Byte 'local copy
Private mvarGB1 As Byte 'local copy
Private mvarGB2 As Byte 'local copy
Private mvarGB3 As Byte 'local copy
Private mvarGB4 As Byte 'local copy
Private mvarReverse As Boolean 'local copy
Private mvarFixedPitch As Boolean 'local copy
Private mvarDrumTuneKey As Byte 'local copy
Public Enum DirectOutputTypes
    dotDirect = 0
    dotSquare1 = 1
    dotSquare2 = 2
    dotWave = 3
    dotNoise = 4
    dotUnk5 = 5
    dotUnk6 = 6
    dotUnk7 = 7
End Enum
'local variable(s) to hold property value(s)
Private mvarOutputType As DirectOutputTypes 'local copy
Public Property Let outputtype(ByVal vData As DirectOutputTypes)
'used when assigning an Object to the property, on the left side of a Set statement.
'Syntax: Set x.OutputType = Form1
    Let mvarOutputType = vData
End Property


Public Property Get outputtype() As DirectOutputTypes
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.OutputType
    Let outputtype = mvarOutputType
End Property




Public Property Let DrumTuneKey(ByVal vData As Byte)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.DrumTuneKey = 5
    mvarDrumTuneKey = vData
End Property


Public Property Get DrumTuneKey() As Byte
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.DrumTuneKey
    DrumTuneKey = mvarDrumTuneKey
End Property



Public Property Let FixedPitch(ByVal vData As Boolean)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.FixedPitch = 5
    mvarFixedPitch = vData
End Property


Public Property Get FixedPitch() As Boolean
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.FixedPitch
    FixedPitch = mvarFixedPitch
End Property



Public Property Let Reverse(ByVal vData As Boolean)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.Reverse = 5
    mvarReverse = vData
End Property


Public Property Get Reverse() As Boolean
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.Reverse
    Reverse = mvarReverse
End Property



Public Property Let GB4(ByVal vData As Byte)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.GB4 = 5
    mvarGB4 = vData
End Property


Public Property Get GB4() As Byte
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.GB4
    GB4 = mvarGB4
End Property



Public Property Let GB3(ByVal vData As Byte)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.GB3 = 5
    mvarGB3 = vData
End Property


Public Property Get GB3() As Byte
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.GB3
    GB3 = mvarGB3
End Property



Public Property Let GB2(ByVal vData As Byte)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.GB2 = 5
    mvarGB2 = vData
End Property


Public Property Get GB2() As Byte
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.GB2
    GB2 = mvarGB2
End Property



Public Property Let GB1(ByVal vData As Byte)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.GB1 = 5
    mvarGB1 = vData
End Property


Public Property Get GB1() As Byte
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.GB1
    GB1 = mvarGB1
End Property



Public Property Let Raw1(ByVal vData As Byte)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.Raw1 = 5
    mvarRaw1 = vData
End Property


Public Property Get Raw1() As Byte
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.Raw1
    Raw1 = mvarRaw1
End Property



Public Property Let Raw0(ByVal vData As Byte)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.Raw0 = 5
    mvarRaw0 = vData
End Property


Public Property Get Raw0() As Byte
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.Raw0
    Raw0 = mvarRaw0
End Property



Public Property Let EnvRelease(ByVal vData As Byte)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.EnvRelease = 5
    mvarEnvRelease = vData
End Property


Public Property Get EnvRelease() As Byte
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.EnvRelease
    EnvRelease = mvarEnvRelease
End Property



Public Property Let EnvSustain(ByVal vData As Byte)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.EnvSustain = 5
    mvarEnvSustain = vData
End Property


Public Property Get EnvSustain() As Byte
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.EnvSustain
    EnvSustain = mvarEnvSustain
End Property



Public Property Let EnvDecay(ByVal vData As Byte)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.EnvDecay = 5
    mvarEnvDecay = vData
End Property


Public Property Get EnvDecay() As Byte
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.EnvDecay
    EnvDecay = mvarEnvDecay
End Property



Public Property Let EnvAttenuation(ByVal vData As Byte)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.EnvAttenuation = 5
    mvarEnvAttenuation = vData
End Property


Public Property Get EnvAttenuation() As Byte
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.EnvAttenuation
    EnvAttenuation = mvarEnvAttenuation
End Property



Public Property Let SampleID(ByVal vData As String)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.SampleID = 5
    mvarSampleID = vData
End Property


Public Property Get SampleID() As String
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.SampleID
    SampleID = mvarSampleID
End Property



