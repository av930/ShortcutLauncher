CH := {}
CH["name"] := "Chrome"

 ; program setting
CH.ps                   := "sendinput, !d `n sendinput, chrome://settings"
CH.h                    := "sendinput, !d `n sendinput, chrome://history"
CH.c                    := "Run, d:\"
CH["^tab"]            := "sendinput, ^{tab}"             ;;!Right::    ;;move next position

/*
{ ;;;; definition of move, edit, debug
AH["!Right"]            := "sendinput, ^{tab}"             ;;!Right::    ;;move next position
AH["!Left"]             := "sendinput, ^+{tab}"              ;;!Left::     ;;move previous position
}
*/

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


