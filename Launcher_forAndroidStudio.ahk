AS := {}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; unique action list
AS_RunAction( Menu, Sleep, Key ) {
    ;;MsgBox, %Menu%, %Sleep%, %Key%
    SendInput, %Menu%

    WinWaitActive, ahk_class SunAwtDialog ahk_exe studio64.exe
    Sleep %Sleep%
    SendInput, {delete}%Key%
    WinWaitClose, ahk_class SunAwtDialog ahk_exe studio64.exe
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; basic rule of shortcuts
;;;; length of abbreviation should be under 2~5 char.
;;;; basic sequence of chars (object - action - target) or (object - sub object)
;;;; count functionality ends with ~c (means count)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Example
;; AS.fsa               := "sendinput, ^s"           ;;save all
;; AS.fca               := "sendinput, ^+a `n sleep, 1000 `n sendinput, {text}Close All "                ;;close all
;; AS.fe                    := Func( "AS_RunAction" ).Bind( "^+a", 500, "{text}File Encoding" )


;;;; shortcut keymap definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

{ ;;;; move -단축키로 정의
;~ symbol-highlight
;~ previous/next cursor
;~ previous/next modified position
;~ previous/next tab/file
;~ jump to line
;~ matching brace toggle
AS.mfold                := "sendinput, ^+-"         ;;fold all
AS.mfoldc               := "sendinput, ^+="         ;;unfold all

;~ move symbol-next/previous
}

{ ;;;; debug -단축키로 지정
;~ run
;~ stop
;~ step over
;~ step in
;~ step out
;~ go till here
;~ eval expression


;~ { ;;;; edit - need to define by keymap
;~ undo
;~ redo
;~ indent block
;~ indent file
;~ duplicate line
;~ delete line
;~ block-mode/out
;~ column-mode/out
;~ comment line/out
;~ comment block/out
;~ case-upper
;~ case-lower
AS.es               := "sendinput, ^+!j"            ;;select multi occurrence
}

/*

;;;; text
^z::                                                ;text undo
^y::send {Lctrl down}{LShift},z                     ;text redo
;;{tab}::                                           ;text indent right
;;{shift}{tab}::                                    ;text indent left
^+i::send {Lctrl down}{Lalt down}i                  ;text indent block
^+!i::send {Lctrl down}{LShift}{Lalt down}l         ;text indent file
^j::send {Lctrl down},j                             ;text join next line
^d::send {Lctrl down},d                             ;text line duplicate
^+d::send {Lctrl down},y                            ;text line delete
^+c::send {Lctrl down}{LShift},c                    ;text copy filepath
^+!c::send {LShift}{Lalt down}{insert}              ;text column mode


;;;; code
^ ::                                          ;code complete method & parameter
^+ ::                                         ;code list up parameter

^`::
    Input, cmd, L2
    if (cmd= "cp")
        send {Lctrl down}{LShift}c
return
*/


;;;; abbreviation definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


{ ;;;; program
AS.plist                := Func( "AS_RunAction" ).Bind( "^+a", 500, "{text}manage projects.." ) ;;
AS.pset                 := "sendinput, ^!s "             ;;program settings
AS.pconf                := "sendinput, ^!+s"             ;;project configuration
AS.pkey                 := Func( "AS_RunAction" ).Bind( "^!s", 1200, "{text}Keymap" )
AS.pk                   := AS.pkey
AS.pexit                := "sendinput, {ALT}{F4}"    ;;project configuration
AS.px                   := AS.pexit
}

{ ;;;; file
AS.fo                   := "sendinput, ^+n"          ;;open
AS.fr                   := "sendinput, ^!y"          ;;reload & sync
AS.fsync                := AS.fr
AS.fc                   := "sendinput, ^{F4}"        ;;close
AS.fsa                  := "sendinput, ^s"           ;;save all
AS.fca                  := Func( "AS_RunAction" ).Bind( "^+a", 500, "{text}Close All" ) ;;close all
AS.fe                   := Func( "AS_RunAction" ).Bind( "^+a", 500, "{text}file encoding" )
}


{ ;;;; symbol & search
AS.sync                 := "sendinput, ^!y"     ;;sync-up symbol
AS.stype                := "sendinput, ^+b"     ;;view symbol-type
AS.spre                 := "sendinput, ^+i"     ;;preview symbol-definition
AS.shelp                := "sendinput, +{F1}"   ;;external symbol document help
AS.sjump                := "sendinput, ^b"      ;;jump to symbol-definition
AS.shier                := "sendinput, ^h"      ;;hierarchy
AS.scaller              := "sendinput, !{F7}"   ;;find caller
AS.sf                   := "sendinput, ^+f",    ;;search symbol all space
AS.sr                   := "sendinput, ^+r"     ;;replace symbol all space
AS.sfind                := "sendinput, ^+f"     ;;search/replace project-range
AS.sreplace             := "sendinput, ^+r"     ;;replace smartly
AS.ssample              := "sendinput, !{F8}"   ;;search sample code
}

{ ;;;; coding
AS.cc                   := "sendinput, ^{space}"                ;;symbol auto complete
AS.cp                   := "sendinput, ^{space}"                ;;parameter auto complete
AS.ci                   := "sendinput, ^!o"     ;;class import optimization
AS.cerr                 := "sendinput, ^{F1}"   ;;error tip
AS.cfix                 := "sendinput, !{enter}"    ;;error fix
AS.ct                   := "sendinput, !{enter}"    ;;code generation, override, implement, constructor, etc
}

{ ;;;; build
AS.bp                   := Func( "AS_RunAction" ).Bind( "^+a", 500, "{text}Build Apks") ;;build & run
AS.bp                   := "sendinput, ^{F9}"               ;;build
AS.brun                 := Func( "AS_RunAction" ).Bind( "^+a", 500, "{text}Run Run/Debug") ;;build & run
AS.bre                  := Func( "AS_RunAction" ).Bind( "^+a", 500, "{text}Rebuild Project") ;;rebuild
AS.bc                   := "sendinput, ^+`` `n sendinput, c"    ;;clean
AS.bd                   := "sendinput, +{F9}"   ;;start debug
}

{ ;;;; vcs
AS.vs                   := ""               ;;status
AS.vh                   := ""               ;;log & history
AS.va                   := "sendinput, ^!a"     ;;commit & patch
AS.vc                   := ""               ;;commit & patch
AS.vpush                := "sendinput, ^+k"     ;;push & upload
AS.vpull                := ""               ;;pull & update
}


{ ;;;; windows
AS.wfull                := "sendinput, ^+{F12}"     ;;toggle full-screen
AS.w                    := Func( "AS_RunAction" ).Bind( "^+a", 500, "{text}Tool Windows")                ;;window list
AS.wedit                := "sendinput, {ESC}"               ;;editor
AS.wdir                 := "sendinput, !1"              ;;directory view
AS.wsym                 := "sendinput, !7"              ;;symbol view
AS.whier                := "sendinput, ^h"              ;;hierarchy view
AS.wlog                 := "sendinput, !6"              ;;logger
AS.wdebug               := "sendinput, !5"              ;;debugger
}


{ ;;;; tool
AS.tex                  := Func( "AS_RunAction" ).Bind( "^+a", 500, "{text}Show in Explorer")    ;;explorer
AS.tt                   := AS.tex
AS.tcmd                 := "sendinput, !{F12}"              ;;command line interface
}
