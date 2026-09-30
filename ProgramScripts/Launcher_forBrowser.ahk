BW := Map()
BW["name"] := "Browser"
BW["prog"] := "chrome.exe"
BW["clas"] := "Chrome_WidgetWin_1"
BW["file"] := "Browser"


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; unique action list
_BWAction(Menu) {
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
BW["pset"]              := ["sendinput, !d `n sendinput, {text}chrome://settings"                 ,"Program:Settings"]
BW["pkey"]              := ["sendinput, !d `n sendinput, {text}chrome://extensions/shortcuts"     ,"Program:Shotcuts"]
BW["pext"]              := ["sendinput, !d `n sendinput, {text}chrome://extensions",       "Program:Extension.Plugin"]
BW["task"]              := ["+{ESC}"                                                    ,"Program:Chrome.TaskManager"]
BW["sec"]               := ["^+n"                                                              ,"Program:Mode.Secret"]

;;;;;;;; site

BW["his"]               := ["^h"                                                                  ,"Site:URL.History"]
BW["play"]              := [_BWAction.Bind(site_plugin),                                          "Site:PlayStore.Go"]
BW["book"]              := ["^+o"                                                               ,"Site:Bookmark.View"]
;;BW["his"]               := ["sendinput, !d `n sleep, 500 `n sendinput, {text}chrome://history"    ,"Site:URL.History"]
;;BW["play"]              := ["sendinput, !d `n sleep, 500 `n sendinput, {text}https://chrome.google.com/webstore/category/extensions?hl=ko","Site:PlayStore.Go"]


GroupAdd("BrowserGroup", "ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe")
GroupAdd("BrowserGroup", "ahk_class Chrome_WidgetWin_1 ahk_exe vivaldi.exe")

HotIfWinActive("ahk_group BrowserGroup")
;;;;;;;;;; opengrok utilities
;;;Hotkey("$!LButton"    ,BW_SelectWord)
;;;Hotkey("$^+u"         ,NP_ToggleUpperOrLowerCase)
Hotkey("$^.",             BW_ListBullet)
Hotkey("$^/",             BW_ListNumber)
;;;Hotkey("$Control & Enter"       ,BW_AddLowInTable)
;;;;;;;;
HotIfWinActive()


;;Confluence edit-mode, bullet-list
BW_ListBullet(*) {
    SendInput("^+b")
}

BW_ListNumber(*) {
    ;;sendinput, ^+n                  ;;this conflict in chrome incognition mod
    SendInput("{HOME}1.{space}")
}

BW_AddLowInTable(*) {
    SendInput("!{down}")
}

