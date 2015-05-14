VERSION 5.00
Object = "{1C4D3904-8E59-437B-A010-B3CE69588807}#1.0#0"; "vbalColumnTreeView6.ocx"
Object = "{396F7AC0-A0DD-11D3-93EC-00C0DFE7442A}#1.0#0"; "vbalIml6.ocx"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   5265
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7485
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   ScaleHeight     =   5265
   ScaleWidth      =   7485
   StartUpPosition =   3  'Windows Default
   Begin vbalIml6.vbalImageList vbalImageList1 
      Left            =   5280
      Top             =   4560
      _ExtentX        =   953
      _ExtentY        =   953
      ColourDepth     =   32
      Size            =   4592
      Images          =   "pled.frx":0000
      Version         =   131072
      KeyCount        =   4
      Keys            =   "ÿÿÿ"
   End
   Begin VB.CommandButton cmdRevert 
      Caption         =   "Revert"
      Height          =   375
      Left            =   6000
      TabIndex        =   13
      Top             =   4200
      Width           =   1335
   End
   Begin VB.CommandButton cmdSave 
      Caption         =   "Save"
      Height          =   375
      Left            =   6000
      TabIndex        =   12
      Top             =   3720
      Width           =   1335
   End
   Begin VB.CommandButton cmdClose 
      Caption         =   "Close"
      Height          =   375
      Left            =   6000
      TabIndex        =   11
      Top             =   4680
      Width           =   1335
   End
   Begin vbalCTreeViewLib6.vbalColumnTreeView tree 
      Height          =   4935
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   3975
      _ExtentX        =   7011
      _ExtentY        =   8705
      FullRowSelect   =   -1  'True
      Indentation     =   14
      LineStyle       =   0
      Style           =   3
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      GridLines       =   0   'False
   End
   Begin VB.Frame Frame1 
      Height          =   1575
      Index           =   1
      Left            =   4200
      TabIndex        =   3
      Top             =   120
      Width           =   3135
      Begin VB.TextBox txtPlaylistSteal 
         Height          =   285
         Left            =   2160
         TabIndex        =   14
         Text            =   "Text1"
         Top             =   960
         Width           =   855
      End
      Begin VB.TextBox txtPlaylistName 
         Height          =   285
         Left            =   120
         TabIndex        =   5
         Text            =   "Text1"
         Top             =   480
         Width           =   2895
      End
      Begin VB.Label Label1 
         Caption         =   "Steal from game"
         Height          =   255
         Left            =   120
         TabIndex        =   15
         Top             =   960
         Width           =   1935
      End
      Begin VB.Label Label3 
         Caption         =   "Name"
         Height          =   255
         Left            =   120
         TabIndex        =   4
         Top             =   240
         Width           =   2895
      End
   End
   Begin VB.Frame Frame1 
      Height          =   1095
      Index           =   0
      Left            =   4200
      TabIndex        =   1
      Top             =   120
      Width           =   3135
      Begin VB.Label Label2 
         Caption         =   "game shit"
         Height          =   615
         Left            =   120
         TabIndex        =   2
         Top             =   240
         Width           =   2895
      End
   End
   Begin VB.Frame Frame1 
      Height          =   1575
      Index           =   2
      Left            =   4200
      TabIndex        =   6
      Top             =   120
      Width           =   3135
      Begin VB.TextBox txtSongName 
         Height          =   285
         Left            =   120
         TabIndex        =   9
         Text            =   "Text1"
         Top             =   480
         Width           =   2895
      End
      Begin VB.TextBox txtTrack 
         Height          =   285
         Left            =   120
         TabIndex        =   7
         Text            =   "Text1"
         Top             =   1080
         Width           =   2895
      End
      Begin VB.Label Label5 
         Caption         =   "Name"
         Height          =   255
         Left            =   120
         TabIndex        =   10
         Top             =   240
         Width           =   2895
      End
      Begin VB.Label Label4 
         Caption         =   "Track"
         Height          =   255
         Left            =   120
         TabIndex        =   8
         Top             =   840
         Width           =   2895
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim x As New DOMDocument26
Dim romnode As IXMLDOMElement
Dim romtree As cCTreeViewNode
Dim mynode As IXMLDOMElement
Dim mytree As cCTreeViewNode

Dim links(1000) As IXMLDOMElement
Dim linkct As Long

Private Sub cmdClose_Click()
  End
End Sub

Private Sub cmdRevert_Click()
  x.Load "test.xml"
  Repopulate
End Sub

Private Sub cmdSave_Click()
  x.save "editor.xml"
End Sub

Private Sub Form_Load()
  tree.ImageList = vbalImageList1
  tree.Columns.Add "data", "Value"
  tree.Columns.Item(1).Width = tree.Columns.Item(1).Width - 50
  
  x.Load "test.xml"
  Repopulate
End Sub

Private Sub Repopulate()
  Dim gamenode As IXMLDOMElement
  Dim node As IXMLDOMElement
  Dim song As IXMLDOMElement
  Dim tnode As cCTreeViewNode
  Dim tsong As cCTreeViewNode
  
  tree.Nodes.Clear

  linkct = 0
  
  For Each gamenode In x.firstChild.childNodes
  'Set gamenode = x.firstChild.childNodes(9)
  Set romnode = gamenode
  Set romtree = tree.Nodes.Add(, , "root" & romnode.getAttribute("code"), romnode.getAttribute("name"), 0, 1)
  romtree.SubItem(1).Text = romnode.getAttribute("code")
  romtree.ItemData = 0
  romtree.ItemNumber = linkct
  Set links(linkct) = romnode
  linkct = linkct + 1
  
  For Each node In romnode.childNodes
    If node.baseName = "playlist" Then
      Set tnode = romtree.AddChildNode(romtree.Key & "/pl" & node.getAttribute("name"), "Playlist """ & node.getAttribute("name") & """", 2, 2)
      tnode.ItemData = 1
      tnode.ItemNumber = linkct
      Set links(linkct) = node
      linkct = linkct + 1
      For Each song In node.childNodes
        Set tsong = tnode.AddChildNode(tnode.Key & "/song" & song.getAttribute("track"), song.Text, 3, 3)
        tsong.SubItem(1).Text = song.getAttribute("track")
        tsong.ItemData = 2
        tsong.ItemNumber = linkct
        Set links(linkct) = song
        linkct = linkct + 1
      Next song
    End If
  Next node
  
  Next gamenode
  
  tree_NodeClick tree.Nodes.Item(1)
End Sub

Private Sub tree_NodeClick(node As vbalCTreeViewLib6.cCTreeViewNode)
  Dim i As Long
  
  For i = 0 To Frame1.UBound
    Frame1(i).Visible = False
  Next i
  Frame1(node.ItemData).Visible = True
    
  Set mynode = links(node.ItemNumber)
  Set mytree = node
  
  Frame1(node.ItemData).Caption = node.Text
  
  If node.ItemData = 1 Then
    txtPlaylistName = mynode.getAttribute("name")
    txtPlaylistSteal = IIf(mynode.getAttribute("steal") <> "", mynode.getAttribute("steal"), "")
  End If
  If node.ItemData = 2 Then
    txtSongName = mynode.Text
    txtTrack = mynode.getAttribute("track")
  End If
End Sub

Private Sub txtPlaylistName_Change()
  mynode.setAttribute "name", txtPlaylistName
  mytree.Text = "Playlist """ & mynode.getAttribute("name") & """"
End Sub

Private Sub txtPlaylistSteal_Change()
  If txtPlaylistSteal.Text = "" Then
    mynode.removeAttribute "steal"
  Else
    mynode.setAttribute "steal", txtPlaylistSteal
  End If
End Sub

Private Sub txtTrack_Change()
  mynode.setAttribute "track", txtTrack
  mytree.SubItem(1).Text = mynode.getAttribute("track")
  tree.Refresh
End Sub
