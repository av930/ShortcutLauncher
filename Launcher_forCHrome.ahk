CH := {}
CH["name"] := "Chrome"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; basic rule of shortcuts
;;;; length of abbreviation should be under 2~5 char.
;;;; basic sequence of chars (object - action - target) or (object - sub object)
;;;; count functionality ends with ~c (means count)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Example
;; NP.fsa               := ["sendinput, ^s"                                 ,"save all"                              ]
;; NP.fca               := ["sendinput, ^+a `n sendinput, {text}Close All " ,"close all"                             ]
;; NP.fe                := [Func( "_NPAction" ).Bind( "^+a", 500, "{text}File Encoding" )            ,"file encoding"]


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; abbreviation definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;; program
CH.pset                 := ["sendinput, !d `n sendinput, chrome://settings"                       ,"program settings"]
CH.ext                  := ["Run, chrome.exe chrome://extensions",                              "run chrome with tab"]
CH.plug                 := CH.ext
CH.his                  := ["sendinput, !d `n sendinput, chrome://history"                            ,"history view"]
CH.play                 := ["sendinput, !d `n sendinput, https://chrome.google.com/webstore/category/extensions?hl=ko" ,"play store"]
CH.book                 := ["^+o"                                                                    ,"bookmark view"]
CH.task                 := ["+{ESC}"                                                           ,"chrome task manager"]
CH.sec                  := ["^+n"                                                                      ,"secret mode"]



Hotkey, IfWinActive, ahk_exe chrome.exe
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
