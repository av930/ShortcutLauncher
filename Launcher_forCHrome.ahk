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
CH.pset                 := ["sendinput, !d `n sendinput, chrome://settings"                       ,"Program.Settings"]
CH.ext                  := ["Run, chrome.exe chrome://extensions",                              "run chrome with tab"]
CH.plug                 := CH.ext
CH.his                  := ["sendinput, !d `n sendinput, chrome://history"                             ,"URL.History"]
CH.play                 := ["sendinput, !d `n sendinput, https://chrome.google.com/webstore/category/extensions?hl=ko","PlayStore.Go"]
CH.book                 := ["^+o"                                                                    ,"Bookmark.View"]
CH.task                 := ["+{ESC}"                                                            ,"Chrome.TaskManager"]
CH.sec                  := ["^+n"                                                                      ,"Mode.Secret"]



Hotkey, IfWinActive, % ahk_exe . CH[prog]
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
