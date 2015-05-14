VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Sappy 2006 XML Cleaner"
   ClientHeight    =   3210
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5010
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "SappyCleanerUpper.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   214
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   334
   StartUpPosition =   3  'Windows Default
   Begin VB.CheckBox Check1 
      Caption         =   "Save to Cleanup.XML instead of Sappy.XML"
      Height          =   375
      Left            =   120
      TabIndex        =   6
      Top             =   2760
      Width           =   2655
   End
   Begin VB.ListBox List1 
      BeginProperty Font 
         Name            =   "Small Fonts"
         Size            =   6
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2310
      Left            =   840
      TabIndex        =   5
      Top             =   120
      Width           =   3975
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Cleanup on Aisle Five!"
      Height          =   375
      Left            =   2880
      TabIndex        =   0
      Top             =   2760
      Width           =   2055
   End
   Begin VB.Label Label1 
      Caption         =   "Sappy 2006 XML Cleaner"
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
      Left            =   960
      TabIndex        =   4
      Top             =   120
      Width           =   3975
   End
   Begin VB.Label Label2 
      Caption         =   "Because MS doesn't know whitespace from whiteout."
      Height          =   255
      Left            =   960
      TabIndex        =   3
      Top             =   360
      Width           =   3975
   End
   Begin VB.Line Line1 
      BorderColor     =   &H80000010&
      X1              =   64
      X2              =   328
      Y1              =   47
      Y2              =   47
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000014&
      X1              =   64
      X2              =   328
      Y1              =   48
      Y2              =   48
   End
   Begin VB.Label Label3 
      Caption         =   $"SappyCleanerUpper.frx":0442
      Height          =   855
      Left            =   120
      TabIndex        =   2
      Top             =   840
      Width           =   4815
   End
   Begin VB.Label Label4 
      Caption         =   $"SappyCleanerUpper.frx":0538
      Height          =   615
      Left            =   120
      TabIndex        =   1
      Top             =   1800
      Width           =   4815
   End
   Begin VB.Image Image1 
      Height          =   720
      Left            =   120
      Picture         =   "SappyCleanerUpper.frx":05DB
      Top             =   120
      Width           =   720
   End
End
Attribute VB_Name = "Form1"
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
' _____________________
'|  XML Cleaner Upper  |
'|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|
'| Code 100% by Kyoufu Kawa.                          |
'| Last update: December 18th, 2005                   |
'|____________________________________________________|
'
'###########################################################################################

Dim X As DOMDocument

Private Sub Command1_Click()
  Command1.Enabled = False
  
  Set X = New DOMDocument
  X.Load "Sappy.XML"
  X.preserveWhiteSpace = True
  If X.parseError.errorCode <> 0 Then
     MsgBox X.parseError.reason & vbCrLf & vbCrLf & X.parseError.srcText
     Exit Sub
  End If
  
  Dim NewLine As String
  Dim Root As IXMLDOMElement
  Dim Rom As IXMLDOMElement
  Dim Playlist As IXMLDOMElement
  Dim Song As IXMLDOMElement
  
  For Each Root In X.childNodes
    If Root.baseName = "sappy" Then
      List1.AddItem "<sappy>"
      List1.AddItem "</sappy>"
      
      For Each Rom In Root.childNodes
        If Rom.baseName = "rom" Then
          NewLine = "<rom"
          NewLine = NewLine & " code=""" & UCase(Rom.getAttribute("code")) & """"
          NewLine = NewLine & " name=""" & Rom.getAttribute("name") & """"
          NewLine = NewLine & " offset=""0x" & FixHex(Rom.getAttribute("songtable"), 6) & """"
          If Rom.getAttribute("screenshot") <> "" Then
            If Dir(Rom.getAttribute("screenshot")) = "" Then
              MsgBox "Screenshot for " & Rom.getAttribute("code") & " not found. Removing from cleanup."
            Else
              NewLine = NewLine & " screenshot=""" & Rom.getAttribute("screenshot") & """"
            End If
          End If
          If Rom.getAttribute("creator") <> "" Then NewLine = NewLine & " creator=""" & Rom.getAttribute("creator") & """"
          If Rom.getAttribute("tagger") <> "" Then NewLine = NewLine & " tagger=""" & Rom.getAttribute("tagger") & """"
          NewLine = NewLine & ">"
          List1.AddItem vbTab & NewLine, List1.ListCount - 1
          List1.AddItem vbTab & "</rom>", List1.ListCount - 1
          
          For Each Playlist In Rom.childNodes
            If Playlist.baseName = "playlist" Then
              List1.AddItem vbTab & vbTab & "<playlist name=""" & Playlist.getAttribute("name") & """>", List1.ListCount - 2
              List1.AddItem vbTab & vbTab & "</playlist>", List1.ListCount - 2
              
              For Each Song In Playlist.childNodes
                If Song.baseName = "song" Then
                  List1.AddItem vbTab & vbTab & vbTab & "<song track=""0x" & FixHex(Song.getAttribute("track"), 5) & """>" & Song.Text & "</song>", List1.ListCount - 3
                End If
              Next
              
            ElseIf Playlist.baseName = "midimap" Then
              List1.AddItem vbTab & vbTab & Replace(Playlist.xml, vbCrLf, vbCrLf & vbTab & vbTab), List1.ListCount - 2
            End If
          Next
        End If
      Next Rom
    End If
  Next
  
  If Check1.Value = 1 Then
    Open "aisle5.txt" For Output As #1
  Else
    Open "sappy.xml" For Output As #1
  End If
  For i = 0 To List1.ListCount - 1
    Print #1, List1.List(i)
  Next i
  Print #1, "<!-- Cleaned up with the automatic Sappy 2006 XML Cleaner -->"
  Close #1
  
  MsgBox "Done."
  End
End Sub

Private Function FixHex(s As Variant, i As Integer)
  Dim Bleh As String
  Bleh = Replace(s, "0x", "&H")
  If Left(Bleh, 2) <> "&H" Then
    Bleh = "&H" & Hex(Val(s))
  End If
  FixHex = Right("00000000" & Bleh, i)
  FixHex = Replace(FixHex, "&", "")
  FixHex = Replace(FixHex, "H", "")
End Function

