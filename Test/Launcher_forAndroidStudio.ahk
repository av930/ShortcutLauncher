AS := {}
AS.name := "AndroidStudio"

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
                           
;;;;;;;; windows           
AS.wfull                := ["sendinput, ^+{F12}"         ,"toggle full-screen                                        "]
AS.w                    := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}Tool Windows"),";;window list                "]
AS.wedit                := ["sendinput, {ESC}"           ,"editor                                                      "]
AS.wdir                 := ["sendinput, !1"              ,"directory view                                              "]
AS.wsym                 := ["sendinput, !7"              ,"symbol view                                                 "]
AS.whier                := [AS.shier                     ,"hierarchy view                                              "]
AS.wcall                := ["sendinput, ^!h"             ,"call flow                                                   "]
AS.wmsg                 := ["sendinput, !1"              ,"message like compile error                                  "]
AS.wlog                 := ["sendinput, !6"              ,"logger                                                      "]
AS.wdebug               := ["sendinput, !5"              ,"debugger                                                    "]


