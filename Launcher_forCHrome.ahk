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
CH.pset                 := ["sendinput, !d `n sendinput, {text}chrome://settings"                 ,"Program.Settings"]
CH.pkey                 := ["sendinput, !d `n sendinput, {text}chrome://extensions/shortcuts"     ,"Program.Shotcuts"]
CH.pext                 := ["Run, chrome.exe chrome://extensions",                         "program.Extension.Plugin"]
CH.his                  := ["sendinput, !d `n sendinput, {text}chrome://history"                       ,"URL.History"]
CH.play                 := ["sendinput, !d `n sendinput, {text}https://chrome.google.com/webstore/category/extensions?hl=ko","PlayStore.Go"]
CH.book                 := ["^+o"                                                                    ,"Bookmark.View"]
CH.task                 := ["+{ESC}"                                                            ,"Chrome.TaskManager"]
CH.sec                  := ["^+n"                                                                      ,"Mode.Secret"]



Hotkey, IfWinActive, ahk_class Chrome_WidgetWin_1
;;;;;;;;;; opengrok utilities
;;;Hotkey, $!LButton    ,CH.SelectWord
;;;Hotkey, $^+u         ,NP.ToggleUpperOrLowerCase
Hotkey, $^.    ,CH.ListBullet
Hotkey, $^`,   ,CH.ListNumber
;;;;;;;;
Hotkey, IfWinActive
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Goto, CH.EndOfFile


CH.ListBullet:          ;;^\::        ;;Confluence edit-mode, bullet-list
    sendinput, ^+b
    return

CH.ListNumber:          ;;^\::        ;;Confluence edit-mode, number-list
    sendinput, ^+n
    return

CH.EndOfFile:
