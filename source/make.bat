"C:\Program Files\Microsoft Visual Studio\VB98\Wizards\RC.EXE" /r /fo sappy.res sappy.rc
"C:\Program Files\Microsoft Visual Studio\VB98\vb6.exe" sappy.vbp /make
"C:\Program Files\NSIS\makensis.exe" sappy.nsi
"C:\Program Files\NSIS\makensis.exe" /dUPDATE=Yeah sappy.nsi
pause