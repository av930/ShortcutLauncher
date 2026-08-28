SCH := CH.Clone()
SCH["name"] := "Slimjet"
SCH["prog"] := "slimjet.exe"
SCH["clas"] := "Slimjet64_WidgetWin_1"
SCH["file"] := "Slimjet"
;;32bit vs 64bit 설치 주의하기 (Slimjet_WidgetWin_1와 Slimjet64_WidgetWin_1) string검색

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; unique action list
_SCHAction(Menu) {
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
;;;; abbreviation definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;; program
SCH["play"]              := [_SCHAction.Bind(site_plugin),                                        "Site:PlayStore.Go"]

HotIfWinActive("ahk_class Slimjet64_WidgetWin_1")
;;;;;;;;;; opengrok utilities
;;;Hotkey("$!LButton"    ,SCH_SelectWord)
;;;Hotkey("$^+u"         ,NP_ToggleUpperOrLowerCase)
Hotkey("$^.",             SCH_ListBullet)
Hotkey("$^/",             SCH_ListNumber)
Hotkey("$^q",             SCH_MoveBack)
;;Hotkey("$^``"            ,SCH_Donothing)
;;;Hotkey("$Control & Enter"       ,SCH_AddLowInTable)
;;;;;;;;
HotIfWinActive()


;;Confluence edit-mode, bullet-list
SCH_ListBullet(*) {
    SendInput("^+b")
}

SCH_ListNumber(*) {
    ;;sendinput, ^+n                  ;;this conflict in chrome incognition mod
    SendInput("{HOME}1.{space}")
}

SCH_AddLowInTable(*) {
    SendInput("!{down}")
}

SCH_MoveBack(*) {
    SendInput("!{left}")
}

SCH_Donothing(*) {
    Sleep(10)
}
