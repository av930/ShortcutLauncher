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


;; command handler
;;#Include Launcher.ahk
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



LauncherGo:
    Gui, Submit
    Gui, Destroy

    ;;IfWinActive, ahk_exe studio64.exe
    if WinActive("ahk_exe" . "studio64.exe")
        if (ProgramKeyMapper(AS, Query) = true)
            return

    if WinActive("ahk_exe" . "chrome.exe")
        if (ProgramKeyMapper(CH, Query) = true)
            return

    if WinActive("ahk_exe" . "notepad++.exe")
        if (ProgramKeyMapper(NP, Query) = true)
            return

    if (ProgramKeyMapper(OS, Query) = true)
        return

    ;;;; nothing matched
    SoundPlay *-1
    ;; debug
    Str := Obj2Str(CH)
    Msgbox, % Str
return


ProgramKeyMapper( ProgramKey, Command ) {
    If ( ProgramKey[Command] ) {
        If ProgramKey[Command] is alnum {
            ;;Send % ProgramKey[Command]
            Exec( ProgramKey[Command] )
        }
        Else { ;;;; function matched
            ProgramKey[Command].Call()
        }
        LastQSQuery := Command
        return true ;; no-more run next step
    }
}


; Escape if these labels they are already used by the main script
GuiClose:
GuiEscape:
    Gui, Destroy
Return