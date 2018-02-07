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
FullFileName = C:\My Documents\asdfasdfa\asdfasdf\Address List.txt
   
; To fetch all info:
/*
SplitPath, FullFileName, name, dir, ext, name_noext, drive
MsgBox, % name . "`n"
          . dir . "`n"
          . ext . "`n"
          . name_no_ext . "`n"
          . drive
          */
;Func( "_OSRunTool" ).Bind("^+c").Bind("explorer")
_OSRunTool("^+c", "explorer")
return



_OSRunTool( PathCmd, Tool ) { 
    send %PathCmd%
    
    fullName := Clipboard
    SplitPath, fullName, name, dir, ext, name_noext, drive
    MsgBox, % name . "`n"
          . dir . "`n"
          . Tool
    
    if (Tool == "explorer")            {
        msgbox, %Tool%
        run, explorer.exe `/n, `/e, %dir%
    }else if (Tool == "cmd")          {
        run, cmd.exe `/n, `/e, %dir%
    }
    else if (%Tool% == "notepad++")     {
        run, notepad++.exe /n, /e, %fullname%
    }
}
