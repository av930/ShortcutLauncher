AS := IN.Clone()
AS["name"] := "AndroidStudio v3.0"
AS[prog] := studio64.exe
AS[clas] := SunAwtFrame
AS[file] := "AndroidStudio"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; unique action list
_ASAction( Menu, Sleep, Key ) {
    ;;MsgBox, %Menu%, %Sleep%, %Key%
    SendInput, %Menu%

    WinWaitActive, % "ahk_class SunAwtFrame ahk_exe " . AS["prog"]
    Sleep %Sleep%
    SendInput, {delete}%Key%
    WinWaitClose,  % "ahk_class SunAwtFrame ahk_exe " . AS["prog"]
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; basic rule of shortcuts
;;;; length of abbreviation should be under 2~5 char.
;;;; basic sequence of chars (object - action - target) or (object - sub object)
;;;; count functionality ends with ~c (means count)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Example
;; SI.fa                := ["^s"                                                                            ,"hotkey"]
;; SI.fb                := ["sendinput, ^s"                                                         ,"single command"]
;; SI.fc                := ["sendinput, ^+a `n sleep, 500 `n sendinput, {text}Close All "           ,"multi commands"]
;; SI.fd                := [Func( "_SIAction" ).Bind( "^+a", 500, "{text}File Encoding" )            ,"function call"]

AS.bb                   := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}Build Apk(s)")          ,"Build:Current.APK"]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; shortcut keymap definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Hotkey, IfWinActive, ahk_exe studio64.exe
;;;Hotkey, $^w          ,AS.CloseCurrentFile            ;;^{F4}
Hotkey, IfWinActive
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Goto, AS.EndOfFile
AS.CloseCurrentFile:             ;;^w:         ;;close current file
    ;;;Msgbox, % A_ThisHotkey
    sendinput, % AS.fc[1]
    return
AS.EndOfFile: