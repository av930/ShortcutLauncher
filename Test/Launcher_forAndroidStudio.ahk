AS := {}
AS["name"] := "AndroidStudio"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; unique action list
_ASAction( Menu, Sleep, Key ) {
    ;;MsgBox, %Menu%, %Sleep%, %Key%
    SendInput, %Menu%

    WinWaitActive, ahk_class SunAwtDialog ahk_exe studio64.exe
    Sleep %Sleep%
    SendInput, {delete}%Key%
    WinWaitClose, ahk_class SunAwtDialog ahk_exe studio64.exe
}

;;;;;;;; move
;;;; move, edit functionality must be defined in shortcut not abbreviation for convenience
AS["!Right"]            := "sendinput, ^!{Right}"       ;;!Right::    ;;move next position
AS["!Left"]             := "sendinput, ^!{Left}"        ;;!Left::     ;;move previous position
AS["!+Up"]              := "sendinput, !{F7}"           ;;!+Up::      ;;search caller
AS["!+Down"]            := "sendinput, ^b"              ;;!+Down::    ;;jump to definition
AS["^tab"]              := "sendinput, ^{tab}"          ;;^tab::      ;;next file or tab
AS["^+tab"]             := "sendinput, ^+{tab}"         ;;^+tab::     ;;previous file or tab
AS["^+t"]               := "sendinput, ^+t"             ;;^+t:        ;;reopen recent closed tab or file
AS["^g"]                := "sendinput, ^g"              ;;^g::        ;;goto line
AS["^\"]                := "sendinput, ^+m"             ;;^\::        ;;goto matching brace toggle
AS["^F3"]               := "sendinput, ^{F3}"           ;;^F3::       ;;find word at current cursor

;;;;;;;; windows
AS.wfull                := "sendinput, ^+{F12}"         ;;toggle full-screen
AS.w                    := Func( "_ASAction" ).Bind( "^+a", 500, "{text}Tool Windows")                ;;window list
AS.wedit                := "sendinput, {ESC}"           ;;editor
AS.wdir                 := "sendinput, !1"              ;;directory view
AS.wsym                 := "sendinput, !7"              ;;symbol view
AS.whier                := AS.shier                     ;;hierarchy view
AS.wcall                := "sendinput, ^!h"             ;;call flow
AS.wmsg                 := "sendinput, !1"              ;;message like compile error
AS.wlog                 := "sendinput, !6"              ;;logger
AS.wdebug               := "sendinput, !5"              ;;debugger

