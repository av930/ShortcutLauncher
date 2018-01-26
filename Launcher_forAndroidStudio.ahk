AS := {}
AS.name := "AndroidStudio"

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
;; AS.fsa               := ["sendinput, ^s"                                                              ,"save all"]
;; AS.fca               := ["sendinput, ^+a `n sleep, 1000 `n sendinput, {text}Close All "              ,"close all"]
;; AS.fe                := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}File Encoding" )           , file encoding"]


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; abbreviation definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;; program
AS.plist                := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}manage projects.." ) ,        "project list"]
AS.pset                 := ["sendinput, ^!s "                                                     ,"program settings"]
AS.pconf                := ["sendinput, ^!+s"                                                ,"project configuration"]
AS.pkey                 := [Func( "_ASAction" ).Bind( "^!s", 1200, "{text}Keymap" )       ,"program shortcut setting"]
AS.pk                   := AS.pkey
AS.pexit                := ["sendinput, !{F4}"                                                        ,"project exit"]
AS.px                   := AS.pexit


;;;;;;;; file
AS.fo                   := ["sendinput, ^+n"                                                             ,"file open"]
AS.fr                   := ["sendinput, ^!y"                                                   ," file reload & sync"]
AS.fsync                := AS.fr
AS.fc                   := ["sendinput, ^{F4}"                                                          ,"file close"]
AS.fsa                  := ["sendinput, ^s"                                                          ,"file all save"]
AS.fca                  := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}Close All" )               ,"file all close"]
AS.fe                   := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}file encoding" )            ,"file encoding"]


;;;;;;;; symbol search
AS.sync                 := ["sendinput, ^!y"                                           ,"symbol sync-up or file sync"]
AS.stype                := ["sendinput, ^+b"                                                      ,"symbol type jump"]
AS.spre                 := ["sendinput, ^+i"                                      ,"symbol symbol-definition preview"]
AS.shelp                := ["sendinput, +{F1}"                                    ,"symbol help in external document"]
AS.sjump                := ["sendinput, ^b"                                                 ,"symbol definition jump"]
AS.sj                   := AS.sjump
AS.shier                := ["sendinput, ^h"                                                ,"symbol hierarchy viewer"]
AS.scaller              := ["sendinput, !{F7}"                                                  ,"symbol caller find"]
AS.sh                   := ["sendinput, ^+{F7}"                                                   ,"symbol highlight"]
AS.sf                   := ["sendinput, ^+f",                                           ,"symbol search in all space"]
AS.sr                   := ["sendinput, ^+r"                                           ,"symbol replace in all space"]
AS.sfind                := ["sendinput, ^+f"                                ,"symbol search/replace in project-range"]
AS.sreplace             := ["sendinput, ^+r"                                             ,"symbol in replace smartly"]
AS.ssample              := ["sendinput, !{F8}"                                   ,"symbol, search sample code in web"]


;;;;;;;; coding
AS.cc                   := ["sendinput, ^{space}"                                     ,"coding, symbol auto complete"]
AS.cp                   := ["sendinput, ^{space}"                                   "coding, parameter auto complete"]
AS.ci                   := ["sendinput, ^!o"                                     ,"coding, class import optimization"]
AS.cfix                 := ["sendinput, !{enter}"                                           ,"coding, error auto fix"]
AS.cerr                 := ["sendinput, ^{F1}"                                                   ,"coding, error tip"]
AS.ct                   := ["sendinput, !{enter}"           ,"code generation, override, implement, constructor, etc"]


;;;;;;;; build
AS.bb                   := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}Build Apk(s)")                 ,"build only"]
AS.bp                   := ["sendinput, ^{F9}"                                                       ,"build project"]
AS.brun                 := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}Run Run/Debug")               ,"build & run"]
AS.br                   := AS.brun
AS.brb                  := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}Rebuild Project")   ,"build agagin, rebuild"]
AS.bc                   := [Func( "_ASAction" ).Bind( "^+a", 500, "Clean Project" )                   ," build clean"]
AS.bd                   := ["sendinput, +{F9}"                                               ,"build and start debug"]


;;;;;;;; vcs
AS.vs                   := [""                                                                      "vcs, git status"]
AS.vh                   := [""                                                                  ,"vcs, log & history"]
AS.vc                   := [""                                                             ,"vcs, git commit & patch"]
AS.va                   := ["sendinput, ^!a"                                                          ,"vcs, git add"]
AS.vpush                := ["sendinput, ^+k"                                                ,"vcs, git push & upload"]
AS.vpull                := [""                                                              ,"vcs, git pull & update"]


;;;;;;;; windows
AS.wfull                := ["sendinput, ^+{F12}"                                        ,"window, toggle full-screen"]
AS.w                    := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}Tool Windows")                ,"window list"]
AS.wedit                := ["sendinput, {ESC}"                                                      ,"window, editor"]
AS.wdir                 := ["sendinput, !1"                                                 ,"window, directory view"]
AS.wsym                 := ["sendinput, !7"                                                    ,"windiw, symbol view"]
AS.whier                := ["sendinput, ^h"                                               ,"window, hierarchy viewer"]
AS.wcall                := ["sendinput, ^!h"                                                     ,"window, call flow"]
AS.wmsg                 := ["sendinput, !1"                              ,"window, message view listed compile error"]
AS.wlog                 := ["sendinput, !6"                                               ,"window, log message view"]
AS.wdebug               := ["sendinput, !5"                                                   ,"window debugger view"]


;;;;;;;; tool
AS.tex                  := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}Show in Explorer"),          "tool explorer"]
AS.tt                   := AS.tex
AS.tcmd                 := ["sendinput, !{F12}"                                        ,"tool command line interface"]



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; shortcut keymap definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;; edit & etc,
;;;; functionality possible to map abbreviation instead of shortcut
AS.efo                  := ["sendinput, ^+="                                                          ,"edit, unfold"]
AS.efc                  := ["sendinput, ^+-"                                                            ,"edit, fold"]
AS.eval                 := ["sendinput, !{F8}"                                   ,"evaluate expression for debugging"]

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