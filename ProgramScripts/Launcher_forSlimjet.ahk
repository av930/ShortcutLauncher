SCH := CH.Clone()
SCH["name"] := "Slimjet"
SCH[prog] := slimjet.exe
SCH[clas] := Slimjet64_WidgetWin_1
SCH[file] := "Slimjet"
;;32bit vs 64bit 설치 주의하기 (Slimjet_WidgetWin_1와 Slimjet64_WidgetWin_1) string검색

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; unique action list
_SCHAction(Menu) {
    ;;MsgBox, %Menu%, %Sleep%, %Key%
    SendInput, !d
    Sleep 50
    SendInput, {text}%Menu%

    Sleep 300
    SendInput, {ENTER}
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;; userdefined definitions
site_plugin:="https://chrome.google.com/webstore/category/extensions?hl=ko"


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; abbreviation definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;; program
SCH.play                 := [Func( "_SCHAction" ).Bind(site_plugin),                                "Site:PlayStore.Go"]

Hotkey, IfWinActive, ahk_class Slimjet64_WidgetWin_1
;;;;;;;;;; opengrok utilities
;;;Hotkey, $!LButton    ,SCH.SelectWord
;;;Hotkey, $^+u         ,NP.ToggleUpperOrLowerCase
Hotkey, $^.             ,SCH.ListBullet
Hotkey, $^/             ,SCH.ListNumber
Hotkey, $^q             ,SCH.MoveBack
;;Hotkey, $^``            ,SCH.Donothing
;;;Hotkey, $Control & Enter       ,SCH.AddLowInTable
;;;;;;;;
Hotkey, IfWinActive

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Goto, SCH.EndOfFile



;;Confluence edit-mode, bullet-list
SCH.ListBullet:          ;;^\::
    sendinput, ^+b
    return

SCH.ListNumber:         
    ;;sendinput, ^+n                  ;;this conflict in chrome incognition mod
    sendinput, {HOME}1.{space}
    return

SCH.AddLowInTable:      
    sendinput, !{down}
    return

SCH.MoveBack:
    sendinput, !{left}
    return
    
SCH.Donothing:
    Sleep 10
    return
    
SCH.EndOfFile:
