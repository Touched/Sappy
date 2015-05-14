VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "SSample"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"No"
Public Key As String

'local variable(s) to hold property value(s)
Private mvarSampleData As String 'local copy
Private mvarLoopStart As Long 'local copy
Private mvarLoopEnable As Boolean 'local copy
Private mvarSize As Long 'local copy
Private mvarFrequency As Long 'local copy
Private mvarFModSample As Long 'local copy
'local variable(s) to hold property value(s)
Private mvarGBWave As Boolean 'local copy

Private mvarSampleDataB() As Byte
Private mvarSampleDataL As Long
Public Property Let SampleDataB(ByVal Index As Long, ByVal newval As Integer)
  If Index > mvarSampleDataL Then
    ReDim Preserve mvarSampleDataB(mvarSampleDataL) As Byte
  End If
  If mvarSampleDataL = 0 Then ReDim Preserve mvarSampleDataB(0) As Byte
  
  mvarSampleDataB(Index) = newval
End Property
Public Property Get SampleDataB(ByVal Index As Long) As Integer
  SampleDataB = mvarSampleDataB(Index)
End Property
Public Sub ReadSampleDataFromFile(ByVal fn As Integer, tsize As Long)
  ReDim Preserve mvarSampleDataB(tsize) As Byte
  mvarSampleDataL = tsize
  Get #fn, ReadOffset(filenumber) + 1, mvarSampleDataB()
End Sub
Public Sub SaveSampleDataToFile(ByVal fn As Integer)
  Put #fn, WriteOffset(filenumber) + 1, mvarSampleDataB()
End Sub


Public Property Let GBWave(ByVal vData As Boolean)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.GBWave = 5
    mvarGBWave = vData
End Property


Public Property Get GBWave() As Boolean
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.GBWave
    GBWave = mvarGBWave
End Property


Public Property Let LoopEnable(ByVal vData As Boolean)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.GBWave = 5
    mvarLoopEnable = vData
End Property


Public Property Get LoopEnable() As Boolean
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.GBWave
    LoopEnable = mvarLoopEnable
End Property



Public Property Let FModSample(ByVal vData As Long)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.FModSample = 5
    mvarFModSample = vData
End Property


Public Property Get FModSample() As Long
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.FModSample
    FModSample = mvarFModSample
End Property



Public Property Let Frequency(ByVal vData As Long)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.Frequency = 5
    mvarFrequency = vData
End Property


Public Property Get Frequency() As Long
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.Frequency
    Frequency = mvarFrequency
End Property



Public Property Let Size(ByVal vData As Long)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.Size = 5
    mvarSize = vData
End Property


Public Property Get Size() As Long
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.Size
    Size = mvarSize
End Property



Public Property Let loopstart(ByVal vData As Long)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.LoopStart = 5
    mvarLoopStart = vData
End Property


Public Property Get loopstart() As Long
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.LoopStart
    loopstart = mvarLoopStart
End Property



Public Property Let SampleData(ByVal vData As String)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.SampleData = 5
    mvarSampleData = vData
End Property


Public Property Get SampleData() As String
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Trace X.SampleData
    SampleData = mvarSampleData
End Property



