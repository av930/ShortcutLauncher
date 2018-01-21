NP := {}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; unique action list
_NPAction( Menu, Sleep, Key ) {
    ;;MsgBox, %Menu%, %Sleep%, %Key%
    SendInput, %Menu%

    WinWaitActive, ahk_class #32770 ahk_exe notepad++.exe
    Sleep %Sleep%
    SendInput, {delete}%Key%
    SendInput, {enter}
    WinWaitClose, ahk_class #32770 ahk_exe notepad++.exe
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; basic rule of shortcuts
;;;; length of abbreviation should be under 2~5 char.
;;;; basic sequence of chars (object - action - target) or (object - sub object)
;;;; count functionality ends with ~c (means count)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Example
;; NP.fsa               := "sendinput, ^s"              ;;save all
;; NP.fca               := "sendinput, ^+a `n sleep, 1000 `n sendinput, {text}Close All "                ;;close all
;; NP.fe                := Func( "_NPAction" ).Bind( "^+a", 500, "{text}File Encoding" )



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; shortcut keymap definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


{ ;;;; definition of move, edit, debug

;;;; move
;;;; move, edit functionality must be defined in shortcut not abbreviation for convenience
NP["!Right"]            := "sendinput, ^+-"             ;;!Right::    ;;move next position
NP["!Left"]             := "sendinput, ^-"              ;;!Left::     ;;move previous position
;;NP["!+Up"]                                            ;;!+Up::      ;;search caller
;;NP["!+Down"]                                          ;;!+Down::    ;;jump to definition
                                                        ;;^tab::      ;;next file or tab
                                                        ;;^+tab::     ;;previous file or tab
                                                        ;;^+t:        ;;reopen recent closed tab or file
                                                        ;;^g::        ;;goto line
NP["^\"]                := "sendinput, ^b"              ;;^\::        ;;goto matching brace toggle
                                                        ;;^F3::       ;;find word at current cursor


;;;;;; edit
;;NP["^y"]                                              ;;^y::        ;;redo
                                                        ;;^d::        ;;duplicate line
NP["^+d"]               := "sendinput, ^+l"             ;;^+d::       ;;delete line
NP["^/"]                := "sendinput, ^+k"             ;;^/::        ;;comment with line-comment
NP["^+/"]               := "sendinput, ^+q"             ;;^+/::       ;;comment with block-comment
                                                        ;;^+u::       ;;toggle upper or lower case

;;;; debug
;;;; debug usually enough convenient or F-Key easily overlapped to other useful functionality
;;;; therefore not mapped
;; run                                                  ;;{F9}
;; stop                                                 ;;^{F2}
;; step over                                            ;;{F8}
;; step in                                              ;;{F7}
;; step out                                             ;;+{F8}
;; go till here                                         ;;!{F9}
;; toogle break                                         ;;^{F8}
;; break option                                         ;;^+{F8}


;;;; edit & etc, 
;;;; functionality possible to map abbreviation instead of shortcut 
;;NP.ei                                                 ;;indent block ;;need to nppStyle or nppAutoindent
;;NP.eif                                                ;;indent file  ;;need to nppStyle or nppAutoindent
NP.ef                   := "sendinput, !0"              ;;fold all
NP.efc                  := "sendinput, !+0"             ;;unfold all
NP.eval                                               ;;evaluate expression for debugging
}



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; abbreviation definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


{ ;;;; program
NP.plist                := ""   ;;project list
NP.pset                 := ""   ;;project setting
NP.pconf                := "sendinput, !t `n sendinput, p"  ;;project configuration
NP.pkey                 := "sendinput, ^+!s"            ;;need to set shortcutKeymap
NP.pk                   := NP.pkey                      ;;Keymap
NP.pexit                := "sendinput, !{F4}"           ;;project configuration
NP.px                   := NP.pexit
}


{ ;;;; file
NP.fo                   := "sendinput, ^o"              ;;open
NP.fr                   := "sendinput, !f `n sendinput, l"          ;;reload & sync
NP.fsync                := NP.fr
NP.fc                   := "sendinput, ^w"              ;;close
NP.fsa                  := "sendinput, ^+s"             ;;save all
NP.fca                  := "sendinput, ^+w"             ;;close all
NP.fe                   := "sendinput, !+e"             ;;need to set shortcut, mapped "convert UTF-8"
}


{ ;;;; symbol search
NP.sf                   := "sendinput, ^+f",            ;;search symbol all space
NP.sr                   := "sendinput, ^h"              ;;replace symbol all space
NP.sfind                := NP.sf                        ;;search/replace project-range
NP.sreplace             := NP.sf                        ;;replace smartly
}


{ ;;;; windows, need to install Explorer plugin
NP.wfull                := "sendinput, {F11}"          ;;toggle full-screen
NP.w                    := Func( "_NPAction" ).Bind( "^+a", 500, "{text}Tool Windows")                ;;window list
NP.wedit                := "sendinput, {ESC}{ESC}{ESC}" ;;editor
NP.wdir                 := "sendinput, ^!+e"            ;;directory view
NP.wsym                 := "sendinput, !s"              ;;symbol view
NP.whier                := "Msgbox, not supported"      ;;hierarchy view
NP.wlog                 := "Msgbox, not supported"      ;;logger
NP.wdebug               := "Msgbox, not supported"      ;;debugger
}


{ ;;;; tool, need to install RunMe plugin
NP.tex                  := Func( "_NPAction" ).Bind( "{F5}", 500, "{text}explorer.exe $(CURRENT_DIRECTORY)") 
NP.tt                   := "sendinput, ^+{F5}"           ;;explorer using plugin
NP.cmd                  := "sendinput, ^!{F5}"           ;;command line interface
}
