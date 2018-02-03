#SingleInstance Force     
Hotkey, IfWinActive, ahk_class Notepad++
Hotkey, ^!z, MyLabel
Hotkey, ^!c, MyLabel
return

MyLabel:
;Run, chrome.exe "chrome://extensions"
;Run, chrome.exe --app=chrome://extensions
;MsgBox You pressed %A_ThisHotkey%.
;run chrome.exe --app=http://www.naver.com
temp := "^!s"
If temp is alnum 
    msgbox, adasdfasz
return

