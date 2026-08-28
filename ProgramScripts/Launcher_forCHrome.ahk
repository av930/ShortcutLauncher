CH := Map()
CH["name"] := "Chrome"
CH["prog"] := "chrome.exe"
CH["clas"] := "Chrome_WidgetWin_1"
CH["file"] := "Chrome"


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; unique action list
_CHAction(Menu) {
    ;;MsgBox(Menu)
    SendInput("!d")
    Sleep(50)
    SendInput("{text}" Menu)

    Sleep(300)
    SendInput("{ENTER}")
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;; userdefined definitions
site_plugin := "https://chrome.google.com/webstore/category/extensions?hl=ko"

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



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; abbreviation definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;; program
CH["pset"]              := ["sendinput, !d `n sendinput, {text}chrome://settings"                 ,"Program:Settings"]
CH["pkey"]              := ["sendinput, !d `n sendinput, {text}chrome://extensions/shortcuts"     ,"Program:Shotcuts"]
CH["pext"]              := ["sendinput, !d `n sendinput, {text}chrome://extensions",       "Program:Extension.Plugin"]
CH["task"]              := ["+{ESC}"                                                    ,"Program:Chrome.TaskManager"]
CH["sec"]               := ["^+n"                                                              ,"Program:Mode.Secret"]

;;;;;;;; site

CH["his"]               := ["^h"                                                                  ,"Site:URL.History"]
CH["play"]              := [_CHAction.Bind(site_plugin),                                          "Site:PlayStore.Go"]
CH["book"]              := ["^+o"                                                               ,"Site:Bookmark.View"]
;;CH["his"]               := ["sendinput, !d `n sleep, 500 `n sendinput, {text}chrome://history"    ,"Site:URL.History"]
;;CH["play"]              := ["sendinput, !d `n sleep, 500 `n sendinput, {text}https://chrome.google.com/webstore/category/extensions?hl=ko","Site:PlayStore.Go"]


HotIfWinActive("ahk_class Chrome_WidgetWin_1 && ( ahk_exe Chrome.exe || slimjet.exe )")
;;;;;;;;;; opengrok utilities
;;;Hotkey("$!LButton"    ,CH_SelectWord)
;;;Hotkey("$^+u"         ,NP_ToggleUpperOrLowerCase)
Hotkey("$^.",             CH_ListBullet)
Hotkey("$^/",             CH_ListNumber)
;;;Hotkey("$Control & Enter"       ,CH_AddLowInTable)
;;;;;;;;
HotIfWinActive()


;;Confluence edit-mode, bullet-list
CH_ListBullet(*) {
    SendInput("^+b")
}

CH_ListNumber(*) {
    ;;sendinput, ^+n                  ;;this conflict in chrome incognition mod
    SendInput("{HOME}1.{space}")
}

CH_AddLowInTable(*) {
    SendInput("!{down}")
}
