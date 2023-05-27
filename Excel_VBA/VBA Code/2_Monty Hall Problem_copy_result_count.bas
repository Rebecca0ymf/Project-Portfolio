Attribute VB_Name = "Modul1"
Sub copy_result_count()
'
' copy_result_count Macro
'
' Keyboard Shortcut: Ctrl+p
'
    
  For x = 1 To Range("H3").Value
  
  
     Range("F3:G3").Select
    Selection.Copy
    Range("I2:J2").Select
    ActiveSheet.Paste
    Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
        :=False, Transpose:=False
    Application.CutCopyMode = False
    Selection.Insert Shift:=xlDown, CopyOrigin:=xlFormatFromLeftOrAbove

  Next x
  
 
End Sub


