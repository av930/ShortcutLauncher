
;; ShortcutLauncher ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Menu, Tray, Icon, %A_WorkingDir%\AT.ico,,1

#InstallKeybdHook				; Better keyboard handling
#NoEnv							; Better compatibility
#SingleInstance Force			; No dialog when restarting
#Warn
SendMode Input					; Faster keystrokes
SetWorkingDir %A_ScriptDir%		; Ensures a consistent starting directory

LastQSQuery := "h"

Return ; END OF AUTO-EXECUTE SECTION


;; Label ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

GuiClose:
GuiEscape:
	Gui, Destroy
Return




ProgramSelect:
	if WinActive("ahk_exe studio64.exe")
		MAP := AS
	if WinActive("ahk_exe chrome.exe")
		MAP := CH
	if WinActive("ahk_exe notepad++.exe")
		MAP := NP
return


ProgramSelect1:
	if WinActive("ahk_exe studio64.exe")
		Msgbox, 111111111
	if WinActive("ahk_exe chrome.exe")
		Msgbox, 22222222
	if WinActive("ahk_exe notepad++.exe")
		Msgbox, 3333333333
return


ProgramSelect2:
	if WinActive("ahk_exe studio64.exe")
		Msgbox, 111111111
	else if WinActive("ahk_exe chrome.exe")
		Msgbox, 22222222
	else if WinActive("ahk_exe notepad++.exe")
		Msgbox, 3333333333
return



ProgramSelect4:
	#ifWinActive, ahk_exe studio64.exe
		Msgbox, 111111111
	#ifWinActive
	
	#ifWinActive, ahk_exe chrome.exe
		Msgbox, 2222222
	#ifWinActive
	
	#ifWinActive, ahk_exe notepad++.exe
		Msgbox, 3333333333
	#ifWinActive
return


ProgramSelect3:
	if WinActive("ahk_exe studio64.exe") {
		Msgbox, 111111111
	}else if WinActive("ahk_exe chrome.exe"){
		Msgbox, 22222222
	}else if WinActive("ahk_exe notepad++.exe"){
		Msgbox, 3333333333
	}
return


ProgramSelect5:
	#if WinActive(ahk_exe studio64.exe)
		Msgbox, 111111111
	#if
	
	#if WinActive(ahk_exe chrome.exe)
		Msgbox, 2222222
	#if
	
	#if WinActive(ahk_exe notepad++.exe)
		Msgbox, 3333333333
	#if
return


LauncherGo:
	Gosub, ProgramSelect1
   
	
	Gui, Submit
	Gui, Destroy
return


;; Abbreviation Handler
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#q::
	Gui, Destroy
	Gui, Font, s11, Consolas
	Gui, Add, Edit, x5 y5 w200 h25 vQuery, %LastQSQuery%
	Gui, Add, Button, x210 y5 w25 h25 +Default gLauncherGo,
	Gui, Show, w240 h35, Launcher
	Gui, Font
Return
; #+g::#g ; "Gamer bar" Win10 compatibility attempt doesn't work :(
