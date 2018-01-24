NP := {}
NP["name"] := "Notepad++"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; unique action list
_NPAction( Menu, Sleep, Key ) {
    ;;MsgBox, %Menu%, %Sleep%, %Key%
    SendInput, %Menu%

    WinWaitActive, ahk_class #32770 ahk_exe notepad++.exe
    Sleep %Sleep%
    SendInput, {delete}%Key%
    SendInput, {enter}
    WinWaitClose, ahk_class #32770 ahk_exe notepad++.exe
}

;;;;;;;; move
;;;; move, edit functionality must be defined in shortcut not abbreviation for convenience
;;need location navigation plugin
Hotkey, IfWinActive, ahk_class Notepad++
Hotkey, ^tab, NextFileorTab
Hotkey, ^+tab, PrevFileorTab
Hotkey, ^\, JumpToMatchingBrace
Hotkey, IfWinActive

;;;;;;;; windows, need to install Explorer plugin
NP.wfull                := "sendinput, {F11}"          ;;toggle full-screen
NP.w                    := Func( "_NPAction" ).Bind( "^+a", 500, "{text}Tool Windows")                ;;window list
NP.wedit                := "sendinput, {ESC}{ESC}{ESC}" ;;editor
NP.wdir                 := "sendinput, ^!+e"            ;;directory view
NP.wsym                 := "sendinput, !s"              ;;symbol view
NP.whier                := "SoundPlay *-1"              ;;hierarchy view
NP.wlog                 := "SoundPlay *-1"              ;;logger
NP.wdebug               := "SoundPlay *-1"              ;;debugger


NextFileorTab:
MsgBox You pressed %A_ThisHotkey%.
return

PrevFileorTab:
MsgBox You pressed %A_ThisHotkey%.
return

JumpToMatchingBrace:
MsgBox You pressed %A_ThisHotkey%.
return