Attribute VB_Name = "mdlFile"
Public VirtualFile(256 To 511) As String
Public WriteLastOffset(0 To 511) As Long
Public ReadLastOffset(0 To 511) As Long
Public Const VF = 256

Public Function FreeFileNumber()
FreeFileNumber = FreeFile(1)
End Function

Public Sub OpenFile(ByVal filenumber As Integer, ByVal Filename As String)
If filenumber < VF Then Open Filename For Binary As #filenumber
WriteOffset filenumber, 0
ReadOffset filenumber, 0
End Sub

Public Sub OpenNewFile(ByVal filenumber As Integer, ByVal Filename As String)
If filenumber < VF Then
Open Filename For Output As #filenumber
Print #filenumber, "x"
Close #filenumber
Else
VirtualFile(filenumber) = ""
End If
OpenFile filenumber, Filename
End Sub

Public Sub CloseFile(ByVal filenumber As Integer)
Close #filenumber
End Sub

Public Function WriteOffset(ByVal filenumber As Integer, Optional ByVal offset As Long = -1) As Long
WriteLastOffset(filenumber) = IIf(offset > -1, offset, WriteLastOffset(filenumber))
WriteOffset = WriteLastOffset(filenumber)
End Function

Public Sub WriteByte(ByVal filenumber As Integer, ByVal Data As Byte, Optional ByVal offset As Long = -1)
WriteOffset filenumber, offset
Put #filenumber, WriteOffset(filenumber) + 1, Data
WriteOffset filenumber, WriteOffset(filenumber) + 1
End Sub

Public Sub WriteBigEndian(ByVal filenumber As Integer, ByVal Width As Byte, ByVal Data As Long, Optional ByVal offset As Long = -1)
Dim i As Byte
WriteOffset filenumber, offset
For i = 0 To Width - 1
WriteByte filenumber, (Data \ (16 ^ CLng(i))) Mod 256
Next i
End Sub

Public Sub WriteLittleEndian(ByVal filenumber As Integer, ByVal Width As Byte, ByVal Data As Long, Optional ByVal offset As Long = -1)
Dim i As Integer
WriteOffset filenumber, offset
For i = Width - 1 To 0 Step -1
WriteByte filenumber, (Data \ (16 ^ CLng(i))) Mod 256
Next i
End Sub

Public Sub WriteString(ByVal filenumber As Integer, ByVal Data As String, Optional ByVal offset As Long = -1)
'Dim i As Long
WriteOffset filenumber, offset
'For i = 1 To Len(Data)
'WriteByte FileNumber, IIf(Mid(Data, i, 1) = Chr(0), 0, Asc(Mid(Data, i, 1)))
'Next i
Put #filenumber, WriteOffset(filenumber) + 1, Data
WriteOffset filenumber, WriteOffset(filenumber) + Len(Data)
End Sub

Public Function ReadOffset(ByVal filenumber As Integer, Optional ByVal offset As Long = -1) As Long
ReadLastOffset(filenumber) = IIf(offset > -1, offset, ReadLastOffset(filenumber))
ReadOffset = ReadLastOffset(filenumber)
End Function

Public Function ReadByte(ByVal filenumber As Integer, Optional ByVal offset As Long = -1) As Byte
ReadOffset filenumber, offset
Get #filenumber, ReadOffset(filenumber) + 1, ReadByte
ReadOffset filenumber, ReadOffset(filenumber) + 1
End Function

Public Function ReadVLQ(ByVal filenumber As Long, Optional ByVal offset As Long = -1) As Long
Dim i As Byte
Dim retlen As Byte
ReadOffset filenumber, offset
Dim a As Byte
retlen = 0
Do
a = ReadByte(filenumber)
ReadVLQ = ReadVLQ * (2 ^ 7)
ReadVLQ = ReadVLQ + (a Mod &H80)
retlen = retlen + 1
Loop Until retlen = 4 Or a < &H80

End Function
Public Function ReadBigEndian(ByVal filenumber As Integer, ByVal Width As Byte, Optional ByVal offset As Long = -1) As Long
Dim i As Byte
ReadOffset filenumber, offset
For i = Width - 1 To 0 Step -1
ReadBigEndian = ReadBigEndian + ReadByte(filenumber) * (256 ^ CLng(i))
Next i
End Function

Public Function ReadLittleEndian(ByVal filenumber As Integer, ByVal Width As Byte, Optional ByVal offset As Long = -1) As Long
Dim i As Integer
ReadOffset filenumber, offset
For i = 0 To Width - 1
ReadLittleEndian = ReadLittleEndian + CLng(ReadByte(filenumber)) * (CLng(256) ^ CLng(i))
Next i
End Function

Public Function ReadString(ByVal filenumber As Integer, ByVal Length As Long, Optional ByVal offset As Long = -1) As String
On Error GoTo fuck
ReadString = String(Length, " ")
'Dim i As Long
ReadOffset filenumber, offset
'For i = 1 To Length
'ReadString = ReadString & Chr(ReadByte(FileNumber))
'Next i
Get #filenumber, ReadOffset(filenumber) + 1, ReadString
ReadOffset filenumber, ReadOffset(filenumber) + Length
Exit Function
fuck:
Trace "fuck"
End Function

Public Function ReadGBAROMPointer(ByVal filenumber As Integer, Optional ByVal offset As Long = -1) As Long
ReadOffset filenumber, offset
ReadGBAROMPointer = ReadLittleEndian(filenumber, 4)
If ReadGBAROMPointer < &H8000000 Or ReadGBAROMPointer > &H9FFFFFF Then
 ReadGBAROMPointer = -1
Else
 ReadGBAROMPointer = ReadGBAROMPointer - &H8000000
End If
End Function

Public Function GBAROMPointerToOffset(ByVal GBAROMPointer As Long) As Long
If GBAROMPointer < &H8000000 Or GBAROMPointer > &H9FFFFFF Then
 GBAROMPointerToOffset = -1
Else
 GBAROMPointerToOffset = GBAROMPointer - &H8000000
End If
End Function
