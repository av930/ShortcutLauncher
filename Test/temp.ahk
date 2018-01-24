#SingleInstance Force     
Hotkey, IfWinActive, ahk_class Notepad++
Hotkey, ^!z, MyLabel
Hotkey, ^!c, MyLabel
return

MyLabel:
MsgBox You pressed %A_ThisHotkey%.
return


