;!define UPDATE

!packhdr "blooga" 'upx.exe blooga'

SetCompressor /SOLID lzma

!define VER_MAJOR 1
!define VER_MINOR 2

!include "MUI.nsh"
!include "Library.nsh"

Name "Sappy"
!ifdef UPDATE
OutFile sappy${VER_MAJOR}${VER_MINOR}update.exe
!else
OutFile sappy${VER_MAJOR}${VER_MINOR}.exe
!endif

!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "res\nsiscorner.bmp"
!define MUI_HEADERIMAGE_RIGHT
!define MUI_WELCOMEFINISHPAGE_BITMAP "res\nsisside.bmp"
!define MUI_ABORTWARNING
!define MUI_FINISHPAGE_RUN sappy.exe
!define MUI_FINISHPAGE_RUN_TEXT "Run Sappy now"
!define MUI_FINISHPAGE_LINK "Visit The Helmeted Rodent website"
!define MUI_FINISHPAGE_LINK_LOCATION "http://helmetedrodent.kickassgamers.com"
!define MUI_FINISHPAGE_NOREBOOTSUPPORT
!define MUI_WELCOMEPAGE_TEXT "This wizard will guide you through the installation of Sappy 2006.\r\n\r\nClick next to continue."
!define MUI_COMPONENTSPAGE_NODESC

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!ifndef NOSUPPORT
!insertmacro MUI_PAGE_COMPONENTS
!endif
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_LANGUAGE "English"

AutoCloseWindow false
ShowInstDetails show

SetOverwrite on
SetDateSave on

;BGGradient babbe6 ffffff

InstallDir $EXEDIR
CompletedText "Yatta ze!"

Section "Sappy (req'd)"
  SectionIn RO
  SetOutPath $INSTDIR
  File sappy.exe
  File sappy.xml
  File sappy.xsd
  File sappy.chm
  File whatsnew.txt
 !ifndef UPDATE
  File kawajuke.gba
  File advwars2.jpg
  File kawajuke.jpg
  File kirbynite.jpg
  File mksc.jpg
  File pkruby.jpg
  File pksapp.jpg
  File pkem.jpg
  File pkfire.jpg
  File pkleaf.jpg
  File rcr.jpg
  File sonic3.jpg
  File azumanga.s
  File soundpack.exe
  !insertmacro InstallLib REGDLLTLB NOTSHARED NOREBOOT_NOTPROTECTED c:\windows\system32\fmod.dll $SYSDIR\fmod.dll $INSTDIR
  !insertmacro InstallLib REGDLLTLB NOTSHARED NOREBOOT_NOTPROTECTED c:\windows\system32\timermm.dll $SYSDIR\timermm.dll $INSTDIR
 !endif
SectionEnd

!ifndef UPDATE
Section "Support"
  !insertmacro InstallLib REGDLLTLB NOTSHARED NOREBOOT_NOTPROTECTED c:\windows\system32\vbalCbEx6.ocx	$SYSDIR\vbalCbEx6.ocx	$SYSDIR
  !insertmacro InstallLib REGDLLTLB NOTSHARED NOREBOOT_NOTPROTECTED c:\windows\system32\vbalExpBar6.ocx	$SYSDIR\vbalExpBar6.ocx	$SYSDIR
  !insertmacro InstallLib REGDLLTLB NOTSHARED NOREBOOT_NOTPROTECTED c:\windows\system32\cPopMenu6.ocx	$SYSDIR\cPopMenu6.ocx	$SYSDIR
  !insertmacro InstallLib REGDLLTLB NOTSHARED NOREBOOT_NOTPROTECTED c:\windows\system32\SSubTmr6.dll	$SYSDIR\SSubTmr6.dll	$SYSDIR
SectionEnd
!endif
