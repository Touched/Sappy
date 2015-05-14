VERSION 5.00
Begin VB.Form frmAssembler 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Assemble .S song file"
   ClientHeight    =   2535
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   6015
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   HelpContextID   =   4000
   Icon            =   "frmAssembler.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   169
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   401
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   2040
      TabIndex        =   11
      Top             =   1560
      Width           =   1095
   End
   Begin VB.CommandButton Command4 
      Caption         =   "..."
      Height          =   285
      Left            =   5640
      TabIndex        =   5
      Top             =   480
      Width           =   285
   End
   Begin VB.TextBox txtROM 
      Height          =   285
      Left            =   2040
      Locked          =   -1  'True
      TabIndex        =   4
      Top             =   480
      Width           =   3495
   End
   Begin VB.CommandButton Command3 
      Caption         =   "..."
      Height          =   285
      Left            =   5640
      TabIndex        =   2
      Top             =   120
      Width           =   285
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   4440
      TabIndex        =   14
      Top             =   2040
      Width           =   1455
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Cook it"
      Height          =   375
      Left            =   2880
      TabIndex        =   13
      Top             =   2040
      Width           =   1455
   End
   Begin VB.TextBox txtFile 
      Height          =   285
      Left            =   2040
      Locked          =   -1  'True
      TabIndex        =   1
      Top             =   120
      Width           =   3495
   End
   Begin VB.TextBox txtVoicegroup 
      Height          =   285
      Left            =   2040
      TabIndex        =   9
      Top             =   1200
      Width           =   1095
   End
   Begin VB.TextBox txtOffset 
      Height          =   285
      Left            =   2040
      TabIndex        =   7
      Top             =   840
      Width           =   1095
   End
   Begin VB.Label Label6 
      Caption         =   "< ""Table"" value in Sappy"
      Height          =   255
      Left            =   3240
      TabIndex        =   12
      Top             =   1560
      Width           =   2655
   End
   Begin VB.Label Label5 
      Caption         =   "MST offset"
      Height          =   255
      Left            =   120
      TabIndex        =   10
      Top             =   1560
      Width           =   1815
   End
   Begin VB.Label Label2 
      Caption         =   "Target .GBA file"
      Height          =   255
      Left            =   120
      TabIndex        =   3
      Top             =   480
      Width           =   1815
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000014&
      X1              =   8
      X2              =   392
      Y1              =   129
      Y2              =   129
   End
   Begin VB.Line Line1 
      BorderColor     =   &H80000010&
      X1              =   8
      X2              =   392
      Y1              =   128
      Y2              =   128
   End
   Begin VB.Label Label1 
      Caption         =   ".S file"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1815
   End
   Begin VB.Label Label4 
      Caption         =   "Voice group address"
      Height          =   255
      Left            =   120
      TabIndex        =   8
      Top             =   1200
      Width           =   1815
   End
   Begin VB.Label Label3 
      Caption         =   "Base offset"
      Height          =   255
      Left            =   120
      TabIndex        =   6
      Top             =   840
      Width           =   1815
   End
End
Attribute VB_Name = "frmAssembler"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private MyCC As New cCommonDialog

Private MyScripter As ScriptControl 'to do Eval with
Private Defs(1, 2048) As String
Private DefC As Integer
Private Labels(1, 2048) As String
Private LabelC As Integer

Private FileTit As String 'just the name.ext part
Private FileDir As String 'just the dir part

Private LabelToWatchFor As String
Private WatchedLabelOffset As Long
Private LabelOffset As Long
Private VoiceGroup As Long

Public SongTableEntry As Long

Private YouFailedIt As Boolean

Private Sub Compile(file As String)
  Dim MyKeywords() As String
  Dim MyLine As String
  Dim D As String
  Dim Eval As String
  Dim ff As Integer
  Dim i As Integer
  
  'Get file title and dir if not already known
  'WARNING: might fail!
  'If FileDir = "" Then
  '  FileTit = MyCC.VBGetFileTitle(txtFile.Text)
  '  FileDir = Left(txtFile, Len(txtFile) - Len(FileTit))
  'End If

  Seek #99, Replace(txtOffset, "0x", "&H") + 1
  
  ff = FreeFile 'find next file # to use, can't use hardcoded #s here
  Open file For Input As ff
  'On Error GoTo hell
  Do
    Line Input #ff, MyLine
    MyLine = Replace(MyLine, vbTab, " ") 'fold in the tabs
    If InStr(1, MyLine, "@") Then 'strip away comments
      MyLine = Left(MyLine, InStr(1, MyLine, "@") - 1)
    End If
    MyLine = Trim(MyLine) 'strip away spaces
    MyLine = Replace(MyLine, "0x", "&H") 'VB-ify all hex numbers
    MyLine = Replace(MyLine, ",", ", ") 'do some more folding
    MyLine = Replace(MyLine, "  ", " ")
    MyLine = Replace(MyLine, "  ", " ")
    MyLine = Replace(MyLine, ",", "")
    For i = DefC To 0 Step -1 'fold out all equs
      MyLine = Replace(MyLine, Defs(0, i), Defs(1, i))
    Next i
    If Len(MyLine) = 0 Then GoTo Bleh 'did we end up with an empty line? then skip it.
        
    MyKeywords = Split(MyLine) 'split up the line into seperate keywords
    
    If Right(MyKeywords(0), 1) = ":" Then 'is this a label?
      Labels(0, LabelC) = Left(MyKeywords(0), Len(MyKeywords(0)) - 1) 'take out the label name
      Labels(1, LabelC) = Seek(99) - 1 + &H8000000 'find and store the current target file position
      If Labels(0, LabelC) = LabelToWatchFor Then 'is this the song header's label?
        WatchedLabelOffset = Seek(99)  'store header offset
      End If
      LabelC = LabelC + 1
      GoTo Bleh 'stop compiling. we can get away with this thanks to the well-formed MID2AGB output.
    End If
    
    Select Case MyKeywords(0)
      Case ".include"
        If Dir(Mid(MyKeywords(1), 2, Len(MyKeywords(1)) - 2)) = "" Then
          MsgBox "Can't find file " & MyKeywords(1) & " for inclusion. Assembly halted."
          YouFailedIt = True 'FUCK!
          Exit Sub
        End If
        Compile Mid(MyKeywords(1), 2, Len(MyKeywords(1)) - 2) 'fork out a new compiler
      
      Case ".global"
        LabelToWatchFor = MyKeywords(1) 'there's only one global: the header's label!
      
      Case ".equ"
        Defs(0, DefC) = MyKeywords(1) 'simply store the keyword and value
        Defs(1, DefC) = MyKeywords(2)
        DefC = DefC + 1
      
      Case ".byte"
        For i = 1 To UBound(MyKeywords)
          If MyKeywords(i) <> "" Then
            Put #99, , CByte(Val(MyScripter.Eval(MyKeywords(i)))) 'ooooooooooh yeah!
          End If
        Next i
    
      Case ".word"
        For i = 0 To LabelC
          If MyKeywords(1) = Labels(0, i) Then
            'Trace ".word " & Labels(0, i) & " -> " & Hex(CLng(Val(Labels(1, i))))
            Put #99, , CLng(Val(Labels(1, i))) 'words in Sappy songs are always label names.
            Exit For
          End If
        Next i
    
      Case ".end"
        Exit Do
    End Select
    
Bleh:
    DoEvents
  Loop Until EOF(ff)
  Close #ff
  Exit Sub
hell:
  'If Err.Number <> 62 Then
    MsgBox "Error #" & Err.Number & ", """ & Err.Description & """" & vbCrLf & vbCrLf & "On line: """ & MyLine & """."
    YouFailedIt = True
    Exit Sub
  'End If
End Sub

Private Sub Command1_Click()
  MousePointer = 11
  LabelOffset = Val(Replace(txtOffset, "0x", "&H"))
  SongTableEntry = Val(Replace(Text1, "0x", "&H"))
  VoiceGroup = Val(Replace(txtVoicegroup, "0x", "&H"))
  Command1.Enabled = False
  
  If txtROM.Text = "" Then
    MsgBox "You must specify both file names."
    MousePointer = 0
    Command1.Enabled = True
    Exit Sub
  End If
  If txtROM.Text = "" Then
    MsgBox "You must specify both file names."
    MousePointer = 0
    Command1.Enabled = True
    Exit Sub
  End If
  If LabelOffset = 0 Then
    MsgBox "You must specify a base offset."
    MousePointer = 0
    Command1.Enabled = True
    Exit Sub
  End If
  If VoiceGroup = 0 Then
    MsgBox "You must specify a voicegroup offset."
    MousePointer = 0
    Command1.Enabled = True
    Exit Sub
  End If
  If SongTableEntry = 0 Then
    MsgBox "You must specify a song table offset."
    MousePointer = 0
    Command1.Enabled = True
    Exit Sub
  End If
  
  Open txtROM For Binary As #99
  
  Set MyScripter = New ScriptControl 'instantiate and set a new VBScript interpreter
  MyScripter.Language = "vbScript"
  Labels(0, 0) = "voicegroup000" 'auto-def a value for "voicegroup000"
  Labels(1, 0) = VoiceGroup + &H8000000 'that's VERY important!
  LabelC = 1
  
  FileDir = Left(txtFile.Text, Len(txtFile.Text) - Len(MyCC.VBGetFileTitle(txtFile.Text)))
  ChDir FileDir
  Compile MyCC.VBGetFileTitle(txtFile.Text)
  
  If YouFailedIt = True Then
    MousePointer = 0
    Exit Sub
  End If
  
  Command2.Caption = "Close"
  
  If MsgBox("Done. Do you want to set the proper entry in the Song Table?", vbYesNo) = vbYes Then
    Put #99, SongTableEntry + 1, WatchedLabelOffset - 1 + &H8000000
  End If
  
  MousePointer = 0
  Command1.Enabled = False
End Sub

Private Sub Command2_Click()
  Unload Me
End Sub

Private Sub Command3_Click()
  If MyCC.VBGetOpenFileName(FileTit, , , , , , "MID2AGB output (*.s)|*.s") = False Then Exit Sub
  txtFile.Text = FileTit
  'FileTit = MyCC.VBGetFileTitle(txtFile.Text)
  'FileDir = Left(txtFile, Len(txtFile) - Len(FileTit))
End Sub

Private Sub Command4_Click()
  Dim foo As String
  If MyCC.VBGetOpenFileName(foo, , , , , , "GBA ROM files (*.gba)|*.gba") = False Then Exit Sub
  txtROM.Text = foo
End Sub
