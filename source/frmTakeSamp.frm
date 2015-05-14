VERSION 5.00
Begin VB.Form frmTakeSamp 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Extract samples"
   ClientHeight    =   4080
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5145
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmTakeSamp.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   272
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   343
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox txtLog 
      BeginProperty Font 
         Name            =   "Lucida Console"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3255
      Left            =   120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   12
      Top             =   4080
      Visible         =   0   'False
      Width           =   4935
   End
   Begin VB.PictureBox Picture2 
      BackColor       =   &H80000018&
      BorderStyle     =   0  'None
      Height          =   1215
      Left            =   120
      ScaleHeight     =   81
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   329
      TabIndex        =   7
      Top             =   2160
      Width           =   4935
      Begin VB.Label Label3 
         BackStyle       =   0  'Transparent
         Caption         =   "[7005]"
         Height          =   885
         Left            =   60
         TabIndex        =   9
         Top             =   270
         Width           =   4815
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "[7004]"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   60
         TabIndex        =   8
         Top             =   30
         Width           =   4815
      End
   End
   Begin VB.PictureBox Picture1 
      BackColor       =   &H80000018&
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   120
      ScaleHeight     =   73
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   329
      TabIndex        =   4
      Top             =   960
      Width           =   4935
      Begin VB.Label Label9 
         BackStyle       =   0  'Transparent
         Caption         =   "[7003]FileFormats"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   60
         TabIndex        =   5
         Top             =   30
         Width           =   4815
      End
      Begin VB.Label lblFileDesc 
         BackStyle       =   0  'Transparent
         Caption         =   "(description of file format)"
         Height          =   765
         Left            =   60
         TabIndex        =   6
         Top             =   270
         Width           =   4815
      End
   End
   Begin Sappy2k6.SkinButton Command2 
      Cancel          =   -1  'True
      Height          =   375
      Left            =   3840
      TabIndex        =   11
      Top             =   3600
      Width           =   1215
      _ExtentX        =   0
      _ExtentY        =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "[5]"
   End
   Begin VB.ComboBox cboSaveAs 
      Height          =   315
      ItemData        =   "frmTakeSamp.frx":000C
      Left            =   2040
      List            =   "frmTakeSamp.frx":000E
      Style           =   2  'Dropdown List
      TabIndex        =   1
      Top             =   120
      Width           =   3015
   End
   Begin VB.TextBox txtNamePat 
      Height          =   285
      Left            =   2040
      TabIndex        =   3
      Top             =   480
      Width           =   3015
   End
   Begin Sappy2k6.SkinButton Command1 
      Default         =   -1  'True
      Height          =   375
      Left            =   2520
      TabIndex        =   10
      Top             =   3600
      Width           =   1215
      _ExtentX        =   0
      _ExtentY        =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "[4]OK"
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000014&
      X1              =   8
      X2              =   336
      Y1              =   233
      Y2              =   233
   End
   Begin VB.Line Line1 
      BorderColor     =   &H80000010&
      X1              =   8
      X2              =   336
      Y1              =   232
      Y2              =   232
   End
   Begin VB.Label Label12 
      Caption         =   "[7001]Saveas"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1815
   End
   Begin VB.Label Label13 
      Caption         =   "[7002]Patt"
      Height          =   495
      Left            =   120
      TabIndex        =   2
      Top             =   480
      Width           =   1815
   End
End
Attribute VB_Name = "frmTakeSamp"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' ______________
'|  SAPPY 2006  |
'|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|
'| Interface code © 2006 by Kyoufu Kawa               |
'| Player code © 200X by DJ ßouché                    |
'| In-program graphics by Kyoufu Kawa                 |
'| Thanks to SomeGuy, Majin Bluedragon and SlimeSmile |
'|                                                    |
'| This code is NOT in the Public Domain or whatever. |
'| At least until Kyoufu Kawa releases it in the PD   |
'| himself.  Until then, you're not supposed to even  |
'| HAVE this code unless given to you by Kawa or any  |
'| other Helmeted Rodent member.                      |
'|____________________________________________________|
' ___________________
'|  Sample exporter  |
'|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|
'| Code 100% by Kyoufu Kawa, based on Maple.          |
'| Last update: February 1st, 2005                    |
'|____________________________________________________|
'
'###########################################################################################

Public SingleSong As Long

Private Type tInst
  SndType As Byte
  Shit1 As Byte
  Shit2 As Byte
  Shit3 As Byte
  WavePtr As Long
  MoreShit As Long
End Type

Private DidWeAlreadyDumpThisOne(&HFFFFFF) As Byte
'Private MyCdl As New cCommonDialog
Private MyCdl As New gCommonDialog

Private Function ConFreq(ByVal freq As Long) As Long
  Dim k As Integer
  For k = 1 To 10
    freq = freq / 2
  Next k
  ConFreq = freq
End Function

Private Sub SaveSampleRAW(Filename As String, hdr1 As Integer, hdr2 As Integer, freq As Long, loopstart As Long, Length As Long)
  On Error GoTo Fucksocks
  Dim theStuff() As Byte
  ReDim theStuff(Length)
  Open Filename For Binary As #98
  Get #99, , theStuff
  Put #98, , theStuff
  Close #98
  Exit Sub
Fucksocks:
  If Err.Number = 75 Then
    MsgBox "Access denied. Make sure """ & Filename & """ is not already open."
    Close #98
    Exit Sub
  End If
  MsgBox "Runtime error " & Err.Number & vbCrLf & vbCrLf & Err.Description
  Resume Next
End Sub

Private Sub SaveSampleWAV(Filename As String, hdr1 As Integer, hdr2 As Integer, freq As Long, loopstart As Long, Length As Long)
  On Error GoTo Fucksocks
  Dim theStuff() As Byte
  Dim k As Long
  ReDim theStuff(Length)
  Open Filename For Binary As #98
  Put #98, , CByte(&H52)
  Put #98, , CByte(&H49)
  Put #98, , CByte(&H46)
  Put #98, , CByte(&H46)
  Put #98, , CByte(&H3E)
  Put #98, , CByte(&H2B)
  Put #98, , CByte(&H0)
  Put #98, , CByte(&H0)
  Put #98, , CByte(&H57)
  Put #98, , CByte(&H41)
  Put #98, , CByte(&H56)
  Put #98, , CByte(&H45)
  Put #98, , CByte(&H66)
  Put #98, , CByte(&H6D)
  Put #98, , CByte(&H74)
  Put #98, , CByte(&H20)
  Put #98, , CByte(&H10)
  Put #98, , CByte(&H0)
  Put #98, , CByte(&H0)
  Put #98, , CByte(&H0)
  Put #98, , CByte(&H1)
  Put #98, , CByte(&H0)
  Put #98, , CByte(&H1)
  Put #98, , CByte(&H0)
  Put #98, , CLng(ConFreq(freq))
  Put #98, , CLng(ConFreq(freq))
  Put #98, , CByte(&H1)
  Put #98, , CByte(&H0)
  Put #98, , CByte(&H8)
  Put #98, , CByte(&H0)
  Put #98, , CByte(&H64)
  Put #98, , CByte(&H61)
  Put #98, , CByte(&H74)
  Put #98, , CByte(&H61)
  Put #98, , Length + 1
  Get #99, , theStuff
  For k = 0 To Length
    theStuff(k) = theStuff(k) Xor 128
  Next k
  Put #98, , theStuff
  Close #98
  Exit Sub
Fucksocks:
  If Err.Number = 75 Then
    MsgBox "Access denied. Make sure """ & Filename & """ is not already open."
    Close #98
    Exit Sub
  End If
  MsgBox "Runtime error " & Err.Number & vbCrLf & vbCrLf & Err.Description
  Resume Next
End Sub

Private Sub SaveSampleITS(Filename As String, hdr1 As Integer, hdr2 As Integer, freq As Long, loopstart As Long, Length As Long)
  On Error GoTo Fucksocks
  Dim theStuff() As Byte
  Dim IMPS As String * 4
  IMPS = "IMPS"
  Dim DOSName As String * 12
  Dim SampName As String * 26

  ReDim theStuff(Length)
  Open Filename For Binary As #98
  Get #99, , theStuff

  Put #98, , IMPS
  Put #98, , DOSName
  Put #98, , CByte(0)
  Put #98, , CByte(64) 'GvL
  If loopstart Then
    Put #98, , CByte(16)
  Else
    Put #98, , CByte(0)
  End If
  Put #98, , CByte(64) 'Vol
  Put #98, , SampName
  Put #98, , CByte(1) 'Cvt
  Put #98, , CByte(0) 'DfP
  Put #98, , CLng(Length) 'CHECK!
  Put #98, , CLng(loopstart) 'CHECK!
  If loopstart Then
    Put #98, , CLng(Length) 'CHECK!
  Else
    Put #98, , CLng(0) 'CHECK!
  End If
  Put #98, , CLng(ConFreq(freq)) 'C5Speed
  Put #98, , CLng(0) 'Sustain start
  Put #98, , CLng(0) 'Sustain end
  Put #98, , CLng(&H50)
  Put #98, , CLng(0) 'Vibe settings

  Put #98, , theStuff
  Close #98
  Exit Sub
Fucksocks:
  If Err.Number = 75 Then
    MsgBox "Access denied. Make sure """ & Filename & """ is not already open."
    Close #98
    Exit Sub
  End If
  MsgBox "Runtime error " & Err.Number & vbCrLf & vbCrLf & Err.Description
  Resume Next
End Sub

Private Sub SaveSampleASM(Filename As String, hdr1 As Integer, hdr2 As Integer, freq As Long, loopstart As Long, Length As Long)
  On Error GoTo Fucksocks
  Dim theStuff() As Byte
  Dim j As Long, k As Long, l As Long, aByteStr As String
  ReDim theStuff(Length)
  Get #99, , theStuff
  Open Filename For Output As #98
    Print #98, LoadResString(7030)
    Print #98, "#TONE NAME     : "; Left(MyCdl.VBGetFileTitle(Filename), Len(MyCdl.VBGetFileTitle(Filename)) - 2)
    Print #98, "#FREQUENCY     :"; freq
    Print #98, "#BASE NOTE#    : 60"
    Print #98, "#START ADRESS  : 000000"
    Print #98, "#LOOP ADDRESS  : " & Right("000000" & loopstart, 6)
    Print #98, "#END ADDRESS   : " & Right("000000" & Length, 6)
    If hdr2 = &H0 Then
      aByteStr = "1Shot"
    ElseIf hdr2 = &H4000 Then
      aByteStr = "Fwd"
    Else
      aByteStr = "Maple chokes on 0x" & Right("0000" & Hex(hdr2), 4)
    End If
    Print #98, "#LOOP MODE     : " & aByteStr
    Print #98, "#FINE TUNE     : 0"
    Print #98, "#WAVE EXP/COMP : 1"
    Print #98, "#VOL EXP/COMP  : 1"
    Print #98, ""
    Print #98, vbTab & ".section .rodata"
    Print #98, vbTab & ".Global" & vbTab & Left(MyCdl.VBGetFileTitle(Filename), Len(MyCdl.VBGetFileTitle(Filename)) - 2)
    Print #98, vbTab & ".Align" & vbTab & "2"
    Print #98, ""
    Print #98, Left(MyCdl.VBGetFileTitle(Filename), Len(MyCdl.VBGetFileTitle(Filename)) - 2) & ":"
    Print #98, vbTab & ".short" & vbTab & "0x" & Right("0000" & Hex(hdr1), 4)
    Print #98, vbTab & ".short" & vbTab & "0x" & Right("0000" & Hex(hdr2), 4)
    Print #98, vbTab & ".Int" & vbTab & freq
    Print #98, vbTab & ".Int" & vbTab & loopstart
    Print #98, vbTab & ".Int" & vbTab & Length
    Print #98, ""
    For j = 0 To Length Step 8
      aByteStr = vbTab & ".byte "
      On Error Resume Next
      For k = 0 To 7
        aByteStr = aByteStr & "0x" & Right("00" & Hex(theStuff(j + k)), 2) & ","
      Next k
      On Error GoTo 0
      aByteStr = Left(aByteStr, Len(aByteStr) - 1) 'chop off trailing ,
      Print #98, aByteStr
    Next j
    Print #98, ""
    Print #98, vbTab & ".end"
  Close #98
  Exit Sub
Fucksocks:
  If Err.Number = 75 Then
    MsgBox "Access denied. Make sure """ & Filename & """ is not already open."
    Close #98
    Exit Sub
  End If
  MsgBox "Runtime error " & Err.Number & vbCrLf & vbCrLf & Err.Description
  Resume Next
End Sub

Private Sub DumpVoiceGroup(anInstrumentLong As Long, Optional numsamples As Integer = 256)
  Dim i As Integer, j As Integer
  Dim k As Long
  Dim aFillerLong As Long
  Dim anInstrument As tInst
  Dim aByte As Byte
  Dim Blargh As String
  Dim hdr1 As Integer
  Dim hdr2 As Integer
  Dim hdr3 As Long
  Dim hdr4 As Long
  Dim hdr5 As Long

  For j = 0 To numsamples
    Get #99, (anInstrumentLong + 1) + (12 * j), anInstrument
    If anInstrument.SndType = 0 Then
      If anInstrument.WavePtr > &H8000000 Then
        If DidWeAlreadyDumpThisOne(j) = False Then
          DidWeAlreadyDumpThisOne(j) = True
          Transcribe "Wave instrument found! #" & j
          Seek #99, anInstrument.WavePtr - &H8000000 + 1
          Get #99, , hdr1
          Get #99, , hdr2
          Get #99, , hdr3
          Get #99, , hdr4 'loop
          Get #99, , hdr5 'length
          If hdr5 > &H10000 Then
            hdr5 = &H10000
            Transcribe "Warning: sample cut off."
          End If
          Blargh = txtNamePat
          Blargh = Replace(Blargh, "$I", Trim(Str(j)))
          Blargh = Replace(Blargh, "$P", Hex(anInstrument.WavePtr - &H8000000 + 16))
          Transcribe "Saving as " & Blargh & "..."
          If cboSaveAs.ListIndex = 0 Then SaveSampleRAW Blargh, hdr1, hdr2, hdr3, hdr4, hdr5
          If cboSaveAs.ListIndex = 1 Then SaveSampleWAV Blargh, hdr1, hdr2, hdr3, hdr4, hdr5
          If cboSaveAs.ListIndex = 2 Then SaveSampleITS Blargh, hdr1, hdr2, hdr3, hdr4, hdr5
          If cboSaveAs.ListIndex = 3 Then SaveSampleASM Blargh, hdr1, hdr2, hdr3, hdr4, hdr5
          DoEvents
        End If
      End If
'    ElseIf anInstrument.SndType = &H40 Then 'Key Split
'      If anInstrument.WavePtr > &H8000000 Then
'        Transcribe "Got a KEYSPLIT!"
'        Transcribe "Forking out..."
'        Transcribe "Note that we're saving only the first FOUR samples!"
'        DumpVoiceGroup anInstrument.WavePtr - &H8000000, 4
'      End If
    End If
  Next j
End Sub

Private Sub cboSaveAs_Click()
  Dim dot As Integer
  dot = InStr(txtNamePat.Text, ".")
  If dot > 0 Then txtNamePat = Left(txtNamePat, dot - 1)
  If cboSaveAs.ListIndex = 0 Then txtNamePat = txtNamePat & ".raw"
  If cboSaveAs.ListIndex = 1 Then txtNamePat = txtNamePat & ".wav"
  If cboSaveAs.ListIndex = 2 Then txtNamePat = txtNamePat & ".its"
  If cboSaveAs.ListIndex = 3 Then txtNamePat = txtNamePat & ".s"
  lblFileDesc = LoadResString(cboSaveAs.ListIndex + 7020)
End Sub

Private Sub Command1_Click()
  Dim i As Integer, j As Integer
  Dim k As Long
  Dim anInstrumentLong As Long
  Dim aFillerLong As Long
  Dim anInstrument As tInst
  Dim aByte As Byte
  Dim Blargh As String
  
  txtNamePat.Text = Replace(txtNamePat.Text, "$p", "$P")
  txtNamePat.Text = Replace(txtNamePat.Text, "$i", "$I")
  i = 2
  If InStr(txtNamePat.Text, "$I") Then i = i - 1
  If InStr(txtNamePat.Text, "$P") Then i = i - 1
  If i = 2 Then
    MsgBox LoadResString(3011)
    IncessantNoises "TaskFail" 'Bee-owee-owee-oweeeeeohh....
    Exit Sub
  End If
  
  ClickSound
  
  txtLog.Move 8, 8
  txtLog.Visible = True
  MousePointer = 11
  
  For k = 0 To &HFFFFFF
    DidWeAlreadyDumpThisOne(k) = 0
  Next k
  Seek #99, SingleSong + 1
  Get #99, , aFillerLong
  Get #99, , anInstrumentLong
  On Error GoTo SillyPointers
  anInstrumentLong = anInstrumentLong - &H8000000
  On Error GoTo 0
  Transcribe "Song's instrument pointer is " & Hex(anInstrumentLong)
  If anInstrumentLong > 0 Then DumpVoiceGroup anInstrumentLong
Blargh:
  
  MousePointer = 0
  Command1.Enabled = False
  'Command1.FontBold = False
  Command2.Caption = "Exit"
  'Command2.FontBold = True
  Command2.Default = True
  IncessantNoises "TaskComplete"
  Exit Sub

SillyPointers:
  Transcribe "Silly pointer!"
  GoTo Blargh
End Sub

Private Sub Command2_Click()
  ClickSound
  Unload Me
End Sub

Private Sub Form_Load()
  SetCaptions Me
  Caption = LoadResString(7000)
  cboSaveAs.AddItem LoadResString(7010)
  cboSaveAs.AddItem LoadResString(7011)
  cboSaveAs.AddItem LoadResString(7012)
  cboSaveAs.AddItem LoadResString(7013)
  
  cboSaveAs.ListIndex = 0
  
  If LoadResString(10000) = "<NLPLZ>" Or LoadResString(10000) = "<SPLZ>" Or LoadResString(10000) = "<DPLZ>" Then
    Label9.Visible = False
    lblFileDesc.Top = Label9.Top
    lblFileDesc.Height = lblFileDesc.Height + 16
  End If
End Sub

Private Sub Transcribe(t$)
  If Len(txtLog) > 32000 Then txtLog = "Resetting log." & vbCrLf
  txtLog = txtLog & t$ & vbCrLf
  txtLog.SelStart = Len(txtLog)
End Sub

Private Sub Picture1_Paint()
  DrawSkin Picture1
End Sub
Private Sub Picture2_Paint()
  DrawSkin Picture2
End Sub

