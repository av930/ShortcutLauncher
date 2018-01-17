CH := {}

{ ; program setting
CH.ps					:= "sendinput, ^!s "			 ;;program settings
CH.c					:= "Run, d:\"
CH.d					:= "Run, c:\"
}

/*
#IfWinActive ahk_exe chrome.exe
^.::
send, ^+b
return

^,::
send, ^+n
return
#IfWinActive
*/


