ADS := IJ.Clone()
ADS["name"] := "AndroidStudio v3.0"
ADS["prog"] := "studio64.exe"
ADS["clas"] := "SunAwtFrame"
ADS["file"] := "AndroidStudio"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; unique action list
_ASAction(Menu, Sleep, Key) {
    ;;MsgBox(Menu, Sleep, Key)
    SendInput(Menu)

    WinWaitActive("ahk_class SunAwtFrame ahk_exe " . ADS["prog"])
    Sleep(Sleep)
    SendInput("{delete}" Key)
    WinWaitClose("ahk_class SunAwtFrame ahk_exe " . ADS["prog"])
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; basic rule of shortcuts
;;;; length of abbreviation should be under 2~5 char.
;;;; basic sequence of chars (object - action - target) or (object - sub object)
;;;; count functionality ends with ~c (means count)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Example
;; SI["fa"]             := ["^s"                                                                            ,"hotkey"]
;; SI["fb"]             := ["sendinput, ^s"                                                         ,"single command"]
;; SI["fc"]             := ["sendinput, ^+a `n sleep, 500 `n sendinput, {text}Close All "           ,"multi commands"]
;; SI["fd"]             := [_SIAction.Bind( "^+a", 500, "{text}File Encoding" )                     ,"function call"]

ADS["bb"]                := [_ASAction.Bind( "^+a", 500, "{text}Build Apk(s)")                    ,"Build: Current.APK"]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; shortcut keymap definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
HotIfWinActive("ahk_exe studio64.exe")
;;;Hotkey("$^w"          ,AS_CloseCurrentFile)            ;;^{F4}
HotIfWinActive()
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;