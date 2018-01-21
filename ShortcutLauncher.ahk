
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
;#Include Launcher_forAndroidStudio.ahk
;#Include Launcher_forNotepadPlus.ahk


Return ; END OF AUTO-EXECUTE SECTION


;; Label ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

GuiClose:
GuiEscape:
    Gui, Destroy
Return



;; Abbreviation 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ProgramKeyMapper( ProgramKey, Command ) {
    If ( ProgramKey[Command] ) {
        If ProgramKey[Command] is alnum {
            ;;Send % ProgramKey[Command]
            Exec( ProgramKey[Command] )
        }
        Else { ;;;; function matched
            ProgramKey[Command].Call()
        }
        return true ;; no-more run next step
    }
    If Command is not alpha
        SendInput, % Command
    return false
}


ProgramSelect:
    if WinActive("ahk_exe" . "studio64.exe")
        MAP := AS
    if WinActive("ahk_exe" . "chrome.exe")
        MAP := CH
    if WinActive("ahk_exe" . "notepad++.exe")
        MAP := NP
return


LauncherGo:
    Gosub ProgramSelect
    
    Gui, Submit
    Gui, Destroy

    Str_MAP := Obj2Str(MAP)
    WinGetTitle, Str_WIN, A
    Msgbox, ,%Str_WIN%, %Str_MAP%

    ;;IfWinActive, ahk_exe studio64.exe
    LastQSQuery := Query

    if (ProgramKeyMapper(MAP, Query) = false)
        if (ProgramKeyMapper(OS, Query) = false)
        { ;;;; nothing matched
            SoundPlay *-1

            ;; debug
            Str_MAP := Obj2Str(MAP)
            WinGetTitle, Str_WIN, A
            Msgbox, ,%Str_WIN%, %Str_MAP%
        }
return



;; HotKey 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
HotkeyGo:
    Gosub ProgramSelect
    
    if (ProgramKeyMapper(MAP, A_ThisHotkey) = false)
    { ;;;; nothing matched
        SoundPlay *-1
    }
return



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Handler ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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


;; HotKey Handler
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#UseHook ON ;;prevent recursive key generation 
;;;; move
!Right::    ;;move next position
!Left::     ;;move previous position
!+Up::      ;;search caller
!+Down::    ;;jump to definition
^tab::      ;;next file or tab
^+tab::     ;;previous file or tab
^+t:        ;;reopen recent closed tab or file
^g::        ;;goto line
^\::        ;;goto matching brace toggle
^F3::       ;;find word at current cursor

;;;; edit
^y::        ;;redo
^d::        ;;duplicate line
^+d::       ;;delete line
^/::        ;;comment with line-comment
^+/::       ;;comment with block-comment
^+u::       ;;toggle upper or lower case
Goto, HotkeyGo
return
#UseHook OFF