AS := {}
AS["name"] := "AndroidStudio"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; unique action list
_ASAction( Menu, Sleep, Key ) {
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
;; AS.fe                := Func( "_ASAction" ).Bind( "^+a", 500, "{text}File Encoding" )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; abbreviation definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;; program
AS.plist                := Func( "_ASAction" ).Bind( "^+a", 500, "{text}manage projects.." ) ;;
AS.pset                 := "sendinput, ^!s "            ;;program settings
AS.pconf                := "sendinput, ^!+s"            ;;project configuration
AS.pkey                 := Func( "_ASAction" ).Bind( "^!s", 1200, "{text}Keymap" )
AS.pk                   := AS.pkey
AS.pexit                := "sendinput, !{F4}"    ;;project configuration
AS.px                   := AS.pexit ;;exit program


;;;;;;;; file
AS.fo                   := "sendinput, ^+n"             ;;open
AS.fr                   := "sendinput, ^!y"             ;;reload & sync
AS.fsync                := AS.fr
AS.fc                   := "sendinput, ^{F4}"           ;;close
AS.fsa                  := "sendinput, ^s"              ;;save all
AS.fca                  := Func( "_ASAction" ).Bind( "^+a", 500, "{text}Close All" ) ;;close all
AS.fe                   := Func( "_ASAction" ).Bind( "^+a", 500, "{text}file encoding" )


;;;;;;;; symbol search
AS.sync                 := "sendinput, ^!y"             ;;sync-up symbol
AS.stype                := "sendinput, ^+b"             ;;view symbol-type
AS.spre                 := "sendinput, ^+i"             ;;preview symbol-definition
AS.shelp                := "sendinput, +{F1}"           ;;external symbol document help
AS.sjump                := "sendinput, ^b"              ;;jump to symbol-definition
AS.sj                   := AS.sjump
AS.shier                := "sendinput, ^h"              ;;hierarchy
AS.scaller              := "sendinput, !{F7}"           ;;find caller
AS.sh                   := "sendinput, ^+{F7}"          ;;highlight symbols
AS.sf                   := "sendinput, ^+f",            ;;search symbol all space
AS.sr                   := "sendinput, ^+r"             ;;replace symbol all space
AS.sfind                := "sendinput, ^+f"             ;;search/replace project-range
AS.sreplace             := "sendinput, ^+r"             ;;replace smartly
AS.ssample              := "sendinput, !{F8}"           ;;search sample code in web


;;;;;;;; coding
AS.cc                   := "sendinput, ^{space}"        ;;symbol auto complete
AS.cp                   := "sendinput, ^{space}"        ;;parameter auto complete
AS.ci                   := "sendinput, ^!o"             ;;class import optimization
AS.cerr                 := "sendinput, ^{F1}"           ;;error tip
AS.cfix                 := "sendinput, !{enter}"        ;;error fix
AS.ct                   := "sendinput, !{enter}"        ;;code generation, override, implement, constructor, etc


;;;;;;;; build
AS.bb                   := Func( "_ASAction" ).Bind( "^+a", 500, "{text}Build Apk(s)") ;;build & run
AS.bp                   := "sendinput, ^{F9}"           ;;build project
AS.brun                 := Func( "_ASAction" ).Bind( "^+a", 500, "{text}Run Run/Debug") ;;build & run
AS.br                   := AS.brun
AS.brb                  := Func( "_ASAction" ).Bind( "^+a", 500, "{text}Rebuild Project") ;;rebuild
AS.bc                   := Func( "_ASAction" ).Bind( "^+a", 500, "Clean Project" ) ;;
AS.bd                   := "sendinput, +{F9}"           ;;start debug


;;;;;;;; vcs
AS.vs                   := ""                           ;;status
AS.vh                   := ""                           ;;log & history
AS.va                   := "sendinput, ^!a"             ;;commit & patch
AS.vc                   := ""                           ;;commit & patch
AS.vpush                := "sendinput, ^+k"             ;;push & upload
AS.vpull                := ""                           ;;pull & update}


;;;;;;;; windows
AS.wfull                := "sendinput, ^+{F12}"         ;;toggle full-screen
AS.w                    := Func( "_ASAction" ).Bind( "^+a", 500, "{text}Tool Windows")                ;;window list
AS.wedit                := "sendinput, {ESC}"           ;;editor
AS.wdir                 := "sendinput, !1"              ;;directory view
AS.wsym                 := "sendinput, !7"              ;;symbol view
AS.whier                := AS.shier                     ;;hierarchy view
AS.wcall                := "sendinput, ^!h"             ;;call flow
AS.wmsg                 := "sendinput, !1"              ;;message like compile error
AS.wlog                 := "sendinput, !6"              ;;logger
AS.wdebug               := "sendinput, !5"              ;;debugger


;;;;;;;; tool
AS.tex                  := Func( "_ASAction" ).Bind( "^+a", 500, "{text}Show in Explorer")
AS.tt                   := AS.tex                       ;;explorer
AS.tcmd                 := "sendinput, !{F12}"          ;;command line interface



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; shortcut keymap definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;; edit & etc,
;;;; functionality possible to map abbreviation instead of shortcut
AS.efo                  := "sendinput, ^+="              ;;unfold
AS.efc                  := "sendinput, ^+-"              ;;fold
AS.eval                 := "sendinput, !{F8}"            ;;evaluate expression for debugging

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


Hotkey, IfWinActive, ahk_exe studio64.exe
;;;; move, edit functionality must be defined in shortcut not abbreviation for convenience
;;;;;;;; move
   Hotkey, $!Right   ,AS.MoveNextPostion
   Hotkey, $!Left    ,AS.MovePrevPosition
   Hotkey, $!+Up     ,AS.SearchCaller
   Hotkey, $!+Down   ,AS.JumpToDefinition
;;;Hotkey, $^tab     ,AS.NextFileorTab
;;;Hotkey, $^+tab    ,AS.PrevFileorTab
;;;Hotkey, $^+t      ,AS.ReopenRecentFileorTab
;;;Hotkey, $^g       ,AS.JumpToLine
   Hotkey, $^\       ,AS.JumpToMatchingBrace
;;;Hotkey, $^F3      ,AS.FindWordAtCurrentPosition
                     
;;;;;;;;;;; edit      
   Hotkey, $^y       ,AS.Redo
;;;Hotkey, $^d       ,AS.DuplicateCurrentLine
   Hotkey, $^+d      ,AS.DeleteCurrentLine
;;;Hotkey, $^/       ,AS.CommentWithLineComment
;;;Hotkey, $^+/      ,AS.CommentWithBlockComment
;;;Hotkey, $^+u      ,AS.ToggleUpperOrLowerCase
;;;Hotkey, $^+i      ,AS.IndentBlock
   Hotkey, $^+!i     ,AS.IndentFile
;;;;;;;;
Hotkey, IfWinActive
Goto, AS.EndOfFile


;;;;;;;; move
AS.MoveNextPostion:              ;;!Right::    ;;move next position
    sendinput, ^+{Right}
    return

AS.MovePrevPosition:             ;;!Left::     ;;move previous position
    sendinput, ^!{Left}
    return

AS.SearchCaller:                 ;;!+Up::      ;;search caller
    sendinput, !{F7}
    return

AS.JumpToDefinition:             ;;!+Down::    ;;jump to definition
    sendinput, ^b
    return

AS.NextFileorTab:                ;;^tab::      ;;next file or tab
    sendinput, ^{tab}
    return

AS.PrevFileorTab:                ;;^+tab::     ;;previous file or tab
    sendinput, ^+{tab}
    return

AS.ReopenRecentFileorTab:        ;;^+t:        ;;reopen recent closed tab or file
    sendinput, ^+t
    return

AS.JumpToLine:                   ;;^g::        ;;goto line
    sendinput, ^g
    return

AS.JumpToMatchingBrace:          ;;^\::        ;;goto matching brace toggle
    sendinput, ^+m
    return

AS.FindWordAtCurrentPosition:    ;;^F3::       ;;find word at current cursor
    sendinput, ^{F3}
    return
;;;;;;;; edit
AS.Redo:                         ;;^y::        ;;redo
    sendinput, ^+z
    return

AS.DuplicateCurrentLine:         ;;^d::        ;;duplicate line
    sendinput, ^d
    return

AS.DeleteCurrentLine:            ;;^+d::       ;;delete line
    sendinput, ^y
    return

AS.CommentWithLineComment:       ;;^/::        ;;comment with line-comment
    sendinput, ^/
    return

AS.CommentWithBlockComment:      ;;^+/::       ;;comment with block-comment
    sendinput, ^+/
    return

AS.ToggleUpperOrLowerCase:       ;;^+u::       ;;toggle upper or lower case
    sendinput, ^+u
    return

AS.IndentBlock:                  ;;^!i::       ;;indent block
    sendinput, ^!i
    return

AS.IndentFile:                   ;;^+!::       ;;indent file
    sendinput, ^!l
    return

    
AS.EndOfFile: