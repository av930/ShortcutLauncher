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
CH.ext                  := ["sendinput, !d `n sendinput, chrome://extensions"                         ,"history view"]
CH.plug                 := CH.ext
CH.his                  := ["sendinput, !d `n sendinput, chrome://history"                            ,"history view"]
CH.play                  := ["sendinput, !d `n sendinput, https://chrome.google.com/webstore/category/extensions?hl=ko" ,"play store"]
CH.book                 := ["sendinput, ^+o"                                                         ,"bookmark view"]
CH.task                 := ["sendinput, +{ESC}"                                                ,"chrome task manager"]


