NP := {}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; unique action list
NP_RunAction( Menu, Sleep, Key ) {
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
;; NP.fsa               := "sendinput, ^s"           ;;save all
;; NP.fca               := "sendinput, ^+a `n sleep, 1000 `n sendinput, {text}Close All "                ;;close all
;; NP.fe                    := Func( "NP_RunAction" ).Bind( "^+a", 500, "{text}File Encoding" )


;;;; shortcut keymap definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

{ ;;;; move -단축키로 정의
;~ symbol-highlight
;~ previous/next cursor
;~ previous/next modified position
;~ previous/next tab/file
;~ jump to line
;~ matching brace toggle
NP.mfold                    := "sendinput, !0"         ;;fold all
NP.mfoldc               := "sendinput, !+0"         ;;unfold all

;~ move symbol-next/previous
}



;;;; abbreviation definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

{ ;;;; program
NP.plist                := ""   ;;project list
NP.pset                 := ""   ;;project setting
NP.pconf                := "sendinput, !t `n sendinput, p"  ;;project configuration
NP.pkey                 := "sendinput, ^+!s"     ;;need to set shortcutKeymap
NP.pk                   := NP.pkey               ;;Keymap
NP.pexit                := "sendinput, !{F4}"    ;;project configuration
NP.px                   := NP.pexit
}

{ ;;;; file
NP.fo                   := "sendinput, ^o"      ;;open
NP.fr                   := "sendinput, !f `n sendinput, l"          ;;reload & sync
NP.fsync                := NP.fr
NP.fc                   := "sendinput, ^w"      ;;close
NP.fsa                  := "sendinput, ^+s"     ;;save all
NP.fca                  := "sendinput, ^+w"     ;;close all
NP.fe                   := "sendinput, !+e"     ;;need to set shortcut, mapped "convert UTF-8"
}


{ ;;;; symbol & search ;;;;;;;;;;;;;;;;;;;;;;;;;
NP.sf                   := "sendinput, ^+f",    ;;search symbol all space
NP.sr                   := "sendinput, ^h"     ;;replace symbol all space
NP.sfind                := NP.sf     ;;search/replace project-range
NP.sreplace             := NP.sf     ;;replace smartly
}


{ ;;;; windows, need to install Explorer plugin
NP.wfull                := "sendinput, {F11}"     ;;toggle full-screen
NP.w                    := Func( "NP_RunAction" ).Bind( "^+a", 500, "{text}Tool Windows")                ;;window list
NP.wedit                := "sendinput, {ESC}{ESC}{ESC}"           ;;editor
NP.wdir                 := "sendinput, ^!+e"            ;;directory view
NP.wsym                 := "sendinput, !s"              ;;symbol view
NP.whier                := "Msgbox, not supported"      ;;hierarchy view
NP.wlog                 := "Msgbox, not supported"              ;;logger
NP.wdebug               := "Msgbox, not supported"              ;;debugger
}


{ ;;;; tool, need to install RunMe plugin
NP.tex                  := Func( "NP_RunAction" ).Bind( "{F5}", 500, "{text}explorer.exe $(CURRENT_DIRECTORY)") ;;explorer
NP.tt                   := "sendinput, ^+{F5}"              ;;explorer using plugin
NP.cmd                  := "sendinput, ^!{F5}"              ;;command line interface
}
