
;; ShortcutLauncher ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Menu, Tray, Icon, %A_WorkingDir%\AT.ico,,1

#InstallKeybdHook               ; Better keyboard handling
#NoEnv                          ; Better compatibility
#SingleInstance Force           ; No dialog when restarting
SendMode Input                  ; Faster keystrokes
SetWorkingDir %A_ScriptDir%     ; Ensures a consistent starting directory

#Include obj2str.ahk
#Include Exec.ahk
#Include Launcher_DefAction.ahk
#Include Launcher_DefOS.ahk

#Include Launcher_forCHrome.ahk
#Include Launcher_forAndroidStudio.ahk
#Include Launcher_forNotepadPlus.ahk


Return ; END OF AUTO-EXECUTE SECTION


;; Label ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

GuiClose:
GuiEscape:
    Gui, Destroy
Return



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Common logic ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
getKeyfromObj(obj) {

    Linear := True

    While (A_Index != obj.MaxIndex()) {
        if !(obj.hasKey(A_Index)) {
            Linear := False
            break
        }
    }

    For e, v in obj {
        if (Linear == False) {
            if (IsObject(v))
               r .= Format("{:-10}: {:-10}|", e, getKeyfromObj(v))
               ;r .= e ":" getKeyfromObj(v) "|"
               ;r .= "|"
        } else {
            if e = 2
                r .= v

        }
    }
    return Linear ? trim(r, ", ")
                 : trim(r, ", ")
}


ProgramKeyMapper( ProgramKey, Command ) {
    ;; debug
    ;Str_MAP := Obj2Str(ProgramKey)
    ;WinGetTitle, Str_WIN, A
    ;Msgbox, ,%Str_WIN%, %Str_MAP%

    If ( ProgramKey[Command] ) {
        If ProgramKey[Command][1] is alnum {
            ;;Send % ProgramKey[Command]
            Exec( ProgramKey[Command][1] )
        }
        Else { ;;;; function matched
            ProgramKey[Command][1].Call()
        }
        return true ;; no-more run next step
    }
    ;;If Command is not alpha
    ;;    SendInput, % Command
    return false
}


ProgramSelect:
    MAP := OS
    if WinActive("ahk_exe studio64.exe")        {
        MAP := AS
    }else if WinActive("ahk_exe chrome.exe")    {
        MAP := CH
    }else if WinActive("ahk_exe notepad++.exe") {
        MAP := NP
    }

    ;debug array
    ;MsgBox, 64, % MAP.name ,% MAP.ps . "`n"
    ;                        . MAP.c . "`n"
    ;                        . MAP.h . "`n"
    ;                        . MAP["^tab"]
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Handler ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PopupGoPost:
    Gui, Submit
    Gui, Destroy

    ;; sync-up command from editor & list control
    if LastQSQuery <>
    {
        Query := trim(SubStr(LastQSQuery, 1, 10), " ")
    }

        LastQSQuery := Query

    ;MsgBox, % LastQSQuery " , " Query

    if (ProgramKeyMapper(MAP, Query) = false)
        if (ProgramKeyMapper(OS, Query) = false)
        { ;;;; nothing matched
            SoundPlay *-1

            ;; debug
            ;Str_MAP := Obj2Str(MAP)
            ;WinGetTitle, Str_WIN, A
            ;Msgbox, ,%Str_WIN%, %Str_MAP%
        }
return

AutoComplete:
	Gui, submit, nohide

	loop, parse, list, | ; parse the list to see if the name is in it
	{
		if A_LoopField contains % Query
			newlist .= A_LoopField . "|" ; populate the new list
	}

	if newlist =
		newlist := list
	GuiControl,, LastQSQuery, |%newlist% ; by starting with | it'll replace the list in total
	newlist := ; to clear the variable for population later on

return
;; Abbreviation Trigger
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#q::
#w::
    Gosub ProgramSelect
    list := getKeyfromObj(MAP)

    Gui, Destroy
    Gui, Font, s12, Consolas
    ;Gui, Add, Edit, x5 y5 w200 h25 vQuery, %LastQSQuery%,
    Gui, Add, Edit, x5 y5 w600 h25 vQuery gAutoComplete, %LastQSQuery%
    Gui, Add, ListBox, x5 y40 w628 vLastQSQuery r12, % list
    Gui, Add, Button, x610 y5 w25 h25 +Default gPopupGoPost,

    ;Gui, Show, w240 h35, Launcher
    Gui, Show, , Launcher
    Gui, Font
Return
