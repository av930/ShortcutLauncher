NP := {}
NP["name"] := "Notepad++"

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

;;;;;;;; move
;;;; move, edit functionality must be defined in shortcut not abbreviation for convenience
;;need location navigation plugin
NP["!Right"]            := "sendinput, !{Right}"        ;;!Right::    ;;move next position
NP["!Left"]             := "sendinput, !{Left}"         ;;!Left::     ;;move previous position

NP["!+Up"]              := "sendinput, !+{Up}"          ;;!+Up::      ;;search caller
NP["!+Down"]            := "sendinput, !+{Down}"        ;;!+Down::    ;;jump to definition
NP["^tab"]              := "sendinput, ^{PgDn}"         ;;^tab::      ;;next file or tab
NP["^+tab"]             := "sendinput, ^{PgUp}"         ;;^+tab::     ;;previous file or tab
NP["^+t"]               := "sendinput, ^+t"             ;;^+t:        ;;reopen recent closed tab or file
NP["^g"]                := "sendinput, ^g"              ;;^g::        ;;goto line
NP["^\"]                := "sendinput, ^b"              ;;^\::        ;;goto matching brace toggle
NP["^F3"]               := "sendinput, ^{F3}"           ;;^F3::       ;;find word at current cursor


;;;;;; edit
NP["^y"]                := "sendinput, ^y"              ;;^y::        ;;redo
NP["^d"]                := "sendinput, ^d"              ;;^d::        ;;duplicate line
NP["^+d"]               := "sendinput, ^+l"             ;;^+d::       ;;delete line
NP["^/"]                := "sendinput, ^+k"             ;;^/::        ;;comment with line-comment
NP["^+/"]               := "sendinput, ^+q"             ;;^+/::       ;;comment with block-comment
NP["^+u"]               := "sendinput, ^+u"             ;;^+u::       ;;toggle upper or lower case
NP["^+i"]               := "sendinput, ^+i"             ;;^!i::       ;;indent block
NP["^+!i"]              := "sendinput, ^!+i"            ;;^+!::       ;;indent file

;;;;;;;; debug
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


;;;;;;;; edit & etc, 
;;;; functionality possible to map abbreviation instead of shortcut 
NP.efo                  := "sendinput, !+0"             ;;fold open, unfold
NP.efc                  := "sendinput, !0"              ;;fold all
NP.eval                 := "SoundPlay *-1"              ;;evaluate expression for debugging




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; abbreviation definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;; program
NP.plist                := "SoundPlay *-1"   ;;project list
NP.pset                 := "SoundPlay *-1"   ;;project setting
NP.pconf                := "sendinput, !t `n sendinput, p"  ;;project configuration
NP.pkey                 := "sendinput, ^+!s"            ;;need to set shortcutKeymap
NP.pk                   := NP.pkey                      ;;Keymap
NP.pexit                := "sendinput, !{F4}"           ;;project configuration
NP.px                   := NP.pexit



;;;;;;;; file
NP.fo                   := "sendinput, ^o"              ;;open
NP.fr                   := "sendinput, !f `n sendinput, l"          ;;reload & sync
NP.fsync                := NP.fr
NP.fc                   := "sendinput, ^w"              ;;close
NP.fsa                  := "sendinput, ^+s"             ;;save all
NP.fca                  := "sendinput, ^+w"             ;;close all
NP.fe                   := "sendinput, !+e"             ;;need to set shortcut, mapped "convert UTF-8"



;;;;;;;; symbol search
NP.sf                   := "sendinput, ^+f",            ;;search symbol all space
NP.sr                   := "sendinput, ^h"              ;;replace symbol all space
NP.sfind                := NP.sf                        ;;search/replace project-range
NP.sreplace             := NP.sf                        ;;replace smartly



;;;;;;;; windows, need to install Explorer plugin
NP.wfull                := "sendinput, {F11}"          ;;toggle full-screen
NP.w                    := Func( "_NPAction" ).Bind( "^+a", 500, "{text}Tool Windows")                ;;window list
NP.wedit                := "sendinput, {ESC}{ESC}{ESC}" ;;editor
NP.wdir                 := "sendinput, ^!+e"            ;;directory view
NP.wsym                 := "sendinput, !s"              ;;symbol view
NP.whier                := "SoundPlay *-1"              ;;hierarchy view
NP.wlog                 := "SoundPlay *-1"              ;;logger
NP.wdebug               := "SoundPlay *-1"              ;;debugger



;;;; tool, need to install RunMe plugin
NP.tex                  := Func( "_NPAction" ).Bind( "{F5}", 500, "{text}explorer.exe $(CURRENT_DIRECTORY)") 
NP.tt                   := "sendinput, ^+{F5}"           ;;explorer using plugin
NP.cmd                  := "sendinput, ^!{F5}"           ;;command line interface

