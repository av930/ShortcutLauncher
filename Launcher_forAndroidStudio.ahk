AS := IN.Clone()
AS["name"] := "AndroidStudio v3.0"
AS["prog"] := studio64.exe

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; unique action list
_ASAction( Menu, Sleep, Key ) {
    ;;MsgBox, %Menu%, %Sleep%, %Key%
    SendInput, %Menu%

    WinWaitActive, % "ahk_class SunAwtDialog ahk_exe " . AS["prog"]
    Sleep %Sleep%
    SendInput, {delete}%Key%
    WinWaitClose, % "ahk_class SunAwtDialog ahk_exe " . AS["prog"]
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; basic rule of shortcuts
;;;; length of abbreviation should be under 2~5 char.
;;;; basic sequence of chars (object - action - target) or (object - sub object)
;;;; count functionality ends with ~c (means count)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


AS.bb                   := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}Build Apk(s)")                 ,"build only"]
AS.brun                 := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}Run Run/Debug")               ,"build & run"]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; shortcut keymap definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Hotkey, IfWinActive, ahk_exe studio64.exe
   Hotkey, $^w          ,AS.CloseCurrentFile
Hotkey, IfWinActive
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Goto, AS.EndOfFile
AS.CloseCurrentFile:             ;;^w:         ;;close current file
    sendinput, % AS.fc[1]
    return
AS.EndOfFile: