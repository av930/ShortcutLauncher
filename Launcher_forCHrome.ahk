CH := {}
CH["name"] := "Chrome"
CH[prog] := chrome.exe
CH[clas] := Chrome_WidgetWin_1

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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; abbreviation definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;; program
CH.pset                 := ["sendinput, !d `n sendinput, {text}chrome://settings"                 ,"Program:Settings"]
CH.pkey                 := ["sendinput, !d `n sendinput, {text}chrome://extensions/shortcuts"     ,"Program:Shotcuts"]
CH.pext                 := ["Run, chrome.exe chrome://extensions",                         "Program:Extension.Plugin"]
CH.task                 := ["+{ESC}"                                                    ,"Program:Chrome.TaskManager"]
CH.sec                  := ["^+n"                                                              ,"Program:Mode.Secret"]

;;;;;;;; site
CH.his                  := ["sendinput, !d `n sleep, 500 `n sendinput, {text}chrome://history"    ,"Site:URL.History"]
CH.play                 := ["sendinput, !d `n sleep, 500 `n sendinput, {text}https://chrome.google.com/webstore/category/extensions?hl=ko","Site:PlayStore.Go"]
CH.book                 := ["^+o"                                                               ,"Site:Bookmark.View"]



Hotkey, IfWinActive, ahk_class Chrome_WidgetWin_1
;;;;;;;;;; opengrok utilities
;;;Hotkey, $!LButton    ,CH.SelectWord
;;;Hotkey, $^+u         ,NP.ToggleUpperOrLowerCase
Hotkey, $^.    ,CH.ListBullet
Hotkey, $^/    ,CH.ListNumber
;;;;;;;;
Hotkey, IfWinActive
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Goto, CH.EndOfFile


CH.ListBullet:          ;;^\::        ;;Confluence edit-mode, bullet-list
    sendinput, ^+b
    return

CH.ListNumber:          ;;^\::        ;;Confluence edit-mode, number-list
    ;;sendinput, ^+n                    ;;this conflict in chrome incognition mod
    sendinput, {HOME}1.{space}
    return

CH.EndOfFile:
