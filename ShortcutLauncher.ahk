SetTitleMatchMode RegEx

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
#Include Launcher_forWindows.ahk
#Include Launcher_DefAction.ahk


#Include Launcher_forCHrome.ahk
#Include Launcher_forIntelliJ.ahk
#Include Launcher_forAndroidStudio.ahk
#Include Launcher_forSourceInsight.ahk
#Include Launcher_forNotepadPlus.ahk
#Include Launcher_forSublimeText.ahk

Return ; END OF AUTO-EXECUTE SECTION


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

    ;;must carefully modify here
    If ( ProgramKey[Command] ) {

        if IsObject( ProgramKey[Command][1] ) { ;;expression bracket attachable
            ProgramKey[Command][1].Call()
        }Else {

            CMD := LTrim(SubStr(ProgramKey[Command][1], 1, 3), " ")

            If CMD is alnum
            { ;;traditional bracket not must be next line
                ;;Send % ProgramKey[Command][1]
                Exec( ProgramKey[Command][1] )
            }
            Else ;;;; is hotkey
            {
                Send, % ProgramKey[Command][1]
            }
        }
        return true ;; no-more run next step
    }
    ;;If Command is not alpha
    ;;    SendInput, % Command
    return false
}


ProgramSelect:
    MAP := OS
    if       WinActive("ahk_class SunAwtFrame") and WinActive("ahk_exe idea64.exe")  {
        MAP := IN
    }else if WinActive("ahk_class SunAwtFrame") and WinActive("ahk_exe studio64.exe"){
        MAP := AS
    }else if WinActive("ahk_exe notepad\+\+.exe")    {
        MAP := NP
    }else if WinActive("ahk_exe sourceinsight4.exe") {
        MAP := SI
    }else if WinActive("ahk_exe sublime_text.exe")   {
        MAP := ST
    }else if WinActive("ahk_exe chrome.exe")
        MAP := CH

    ;debug array
    ;MsgBox, 64, % MAP["name"] ,% MAP[proc] . "`n"
    ;                        . MAP[pset][1] . "`n"
    ;                        . MAP[clas]
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Handler ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
MouseControl: ;;mouse control
If A_GuiEvent = Normal
 return

PopupGoPost:
    Gui, Submit
    Gui, Destroy

    ;; sync-up command from editor & list control
    if LastQSQuery <>
    {  ;;; command is within 10 characters
        Query := trim(SubStr(LastQSQuery, 1, 10), " ")
    }

    LastQSQuery := Query
    ;; Mouse double-click is not working, need some delay
    sleep 200
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
        startingMatch := InStr(A_LoopField, Query, false, 1, 1)
        if ( startingMatch == 1 ){
            prelist .= A_LoopField . "|" ;match starting string
            continue
        }
		if A_LoopField contains % Query
			contentlist .= A_LoopField . "|" ; populate the new list
	}

    newlist := prelist . contentlist

	if newlist =
		newlist := list

	GuiControl,, LastQSQuery, |%newlist% ; by starting with | it'll replace the list in total
	newlist := ; to clear the variable for population later on
    prelist :=
    contentlist :=

return


;; Abbreviation Trigger
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#q::
    Gosub ProgramSelect
    list := getKeyfromObj(MAP)

    Gui, Destroy
    Gui, +AlwaysOnTop 
    Gui, Font, s12, Consolas
    ;Gui, Add, Edit, x5 y5 w200 h25 vQuery, %LastQSQuery%,
    Gui, Add, Edit, x5 y5 w600 h25 vQuery gAutoComplete, %LastQSQuery%
    Gui, Add, ListBox, x5 y40 w628 vLastQSQuery r20 gMouseControl,  % list
    Gui, Add, Button, x610 y5 w25 h25 +Default gPopupGoPost,

  
    ;;Move GUI to Current Monitor
    WinGetActiveStats, Title, Width, Height, X, Y
    WPosX := X + Width / 3
    WPosY := Y + Height / 3

    Gui, Show, x%WPosX% y%WPosY%, % "Launcher - " . MAP["name"]
    Gui, Font
Return


;;;;static hotkey define
#IfWinActive, Launcher - .*
$Up::ControlSend, ListBox1, {Up}, % "Launcher - "
$Down::ControlSend, ListBox1, {Down}, % "Launcher - "
;Down::ControlFocus, ListBox1, % "Launcher - " . MAP["name"]
#ifWinActive
return

#IfWinActive, Launcher - .*
ESC::
GuiClose:
GuiEscape:
    Gui, Destroy
Return
#ifWinActive