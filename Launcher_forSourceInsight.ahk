SI := {}
SI["name"] := "SourceInsight v4.0"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; unique action list
_SIAction( Menu, Sleep, Key ) {
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
;; SI.fa                := ["^s"                                                                            ,"hotkey"]
;; SI.fb                := ["sendinput, ^s"                                                         ,"single command"]
;; SI.fc                := ["sendinput, ^+a `n sleep 500 `nsendinput, {text}Close All "             ,"multi commands"]
;; SI.fd                := [Func( "_SIAction" ).Bind( "^+a", 500, "{text}File Encoding" )            ,"function call"]


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; abbreviation definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;; program
SI.plist                := ["sendinput, !p `n sleep, 300 `n sendinput, o"                        ,"open project list"]
SI.pset                 := ["sendinput, !o `n sleep, 300 `n sendinput, p"                         ,"project settings"]
SI.pconf                := ["sendinput, !p `n sleep, 300 `n sendinput, i"                    ,"project configuration"]
SI.pkey                 := ["sendinput, !h `n sleep, 300 `n sendinput, c"                 ,"program shortcut setting"]
SI.pk                   := SI.pkey
SI.pexit                := ["!{F4}"                                                                   ,"project exit"]
SI.px                   := SI.pexit


;;;;;;;; file
SI.fo                   := ["^o"                                                                         ,"file open"]
SI.fr                   := ["^+o"                                                                      ,"file reload"]
SI.fsync                := ["!+s"                                                              ,"file & project sync"]
SI.fc                   := ["^w"                                                                        ,"file close"]
SI.fsa                  := ["^!a"                                                                    ,"file all save"]
SI.fca                  := ["^+w"                                                                   ,"file all close"]
SI.fe                   := ["!+e"                                                          ,"file encoding, NEED2MAP"]


;;;;;;;; symbol search
SI.sync                 := ["!+s"                                                      ,"symbol sync-up or file sync"]
SI.stype                := ["!0"                                                                  ,"symbol type jump"]
SI.spre                 := ["^["                                                  ,"symbol symbol-definition preview"]
SI.shelp                := ["^!w"                                                               ,"symbol help in web"]
SI.sjump                := ["^="                                                            ,"symbol definition jump"]
SI.sj                   := SI.sjump
SI.shier                := ["!+h"                                                ,"symbol hierarchy viewer, NEED2MAP"]
SI.scaller              := ["^`"                                                             ,"symbol jump to caller"]
SI.sh                   := ["+{F8}"                                                               ,"symbol highlight"]
SI.sf                   := ["^+f",                                               ,"symbol string search in all space"]
SI.sr                   := ["^+h"                                                      ,"symbol replace in all space"]
SI.sfind                := ["^/"                                                               ,"symbol search in DB"]
SI.sreplace             := ["^'"                                                         ,"symbol in replace smartly"]
SI.ssample              := SI.shelp
SI.sb                   := ["^m"                                                            ,"symbol,toggle bookmark"]
SI.sbook                := ["^+m"                                                          ,"symbol,manage bookmarks"]


;;;;;;;; coding
SI.cc                   := ["^e"                                                      ,"coding, symbol auto complete"]
SI.ct                   := ["^!s"                                                      ,"code generation, by snippet"]
SI.cp                   := SI.cc
/*
SI.ci                   := [Func( "_OSWARN" ).Bind("Not Supported")              ,"coding, class import optimization"]
SI.cfix                 := [Func( "_OSWARN" ).Bind("Not Supported")                         ,"coding, error auto fix"]
SI.cerr                 := [Func( "_OSWARN" ).Bind("Not Supported")                              ,"coding, error tip"]

;;;;;;;; build
SI.bb                   := [Func( "_SIAction" ).Bind( "^+a", 500, "{text}Build Apk(s)")                 ,"build only"]
SI.bp                   := ["sendinput, ^{F9}"                                                       ,"build project"]
SI.brun                 := [Func( "_SIAction" ).Bind( "^+a", 500, "{text}Run Run/Debug")               ,"build & run"]
SI.br                   := SI.brun
SI.brb                  := [Func( "_SIAction" ).Bind( "^+a", 500, "{text}Rebuild Project")   ,"build agagin, rebuild"]
SI.bc                   := [Func( "_SIAction" ).Bind( "^+a", 500, "Clean Project" )                   ," build clean"]
SI.bd                   := ["sendinput, +{F9}"                                               ,"build and start debug"]


;;;;;;;; vcs
SI.vs                   := [Func( "_SIAction" ).Bind( "^+a", 500, "{text}Show Local Changes")      ,"vcs, git status"]
SI.vlog                 := [Func( "_SIAction" ).Bind( "^+a", 500, "{text}show Git repository Log...") ,"vcs, git log"]
SI.vhis                 := [Func( "_SIAction" ).Bind( "^+a", 500, "{text}Show History")           ,"vcs, git history"]
SI.vc                   := ["sendinput, ^k"                                                        ,"vcs, git commit"]
SI.va                   := ["sendinput, ^!a"                                                          ,"vcs, git add"]
SI.vpush                := ["sendinput, ^+k"                                                ,"vcs, git push & upload"]
SI.vpull                := [Func( "_SIAction" ).Bind( "^+a", 500, "{text}Pull...")          ,"vcs, git pull & update"]
SI.vhis                 := [Func( "_SIAction" ).Bind( "^+a", 500, "{text}Show History")           ,"vcs, git history"]
*/  

;;;;;;;; windows
SI.wfull                := ["{F11}"                                                     ,"window, toggle full-screen"]
SI.w                    := ["sendinput, !v `n sleep, 300 `n sendinput, p"                              ,"window list"]
SI.wedit                := ["{ESC}"                                                                 ,"window, editor"]
SI.wdir                 := ["^p"                                                            ,"window, directory view"]
SI.wlayout              := ["^]"                                                             ,"window, symbol layout"]
SI.wsym                 := ["!l"                                                    ,"window, find local symbol view"]
SI.wsymglobal           := ["^i"                                                    ,"window find global symbol list"]
SI.wsg                  := SI.wsymglobal
SI.whier                := [Func( "_OSWARN" ).Bind("Not Supported")                 ,"window, class hierarchy viewer"]
SI.wcall                := ["!+h"                                                ,"window, call flow, RelationWindow"]
/*
SI.wmsg                 := ["sendinput, !1"                              ,"window, message view listed compile error"]
SI.wlog                 := ["sendinput, !6"                                               ,"window, log message view"]
SI.wdebug               := ["sendinput, !5"                                                   ,"window debugger view"]
*/
SI.wplug                := ["!k"                                                           ,"manage external plugins"]

;;;;;;;; tool
SI.tpath                := [Func( "_OSRunTool" ).Bind("^+c", "copy")                 ,"tool full path copy, NEED2MAP"]
SI.tex                  := [Func( "_OSRunTool" ).Bind("^+c", "explorer")                      ,"tool launch explorer"]
SI.tt                   := SI.tex
SI.tcmd                 := [Func( "_OSRunTool" ).Bind("^+c", "cmd")                    ,"tool command line interface"]
SI.tedit                := [Func( "_OSRunTool" ).Bind("^+c", "notepad++")                 ,"tool edit with notepad++"]



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; shortcut keymap definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;; edit & etc,
;;;; functionality possible to map abbreviation instead of shortcut
SI.efo                  := ["sendinput, ^+="                                                ,"edit, unfold, NEED2MAP"]
SI.efc                  := ["sendinput, ^+-"                                                  ,"edit, fold, NEED2MAP"]
;SI.eval                 := ["sendinput, !{F8}"                                  ,"evaluate expression for debugging"]
SI.eformat              := ["^!l"                                                            ,"indent file, NEED2MAP"]

;;;;;;;; debug
;;;; debug usually enough convenient or F-Key easily overlapped to other useful functionality
;;;; therefore not mapped
;; run                  ;;{F9}
;; stop                 ;;^{F2}
;; step over            ;;{F8}
;; step in              ;;{F7}
;; step out             ;;+{F8}
;; go till here         ;;!{F9}
;; toogle break         ;;^{F8}
;; break option         ;;^+{F8}


Hotkey, IfWinActive, ahk_exe sourceinsight4.exe
;;;; move, edit functionality must be defined in shortcut not abbreviation for convenience
;;;;;;;; move
   Hotkey, $!Right      ,SI.MoveNextPostion
   Hotkey, $!Left       ,SI.MovePrevPosition
   Hotkey, $!+Up        ,SI.SearchCaller
   Hotkey, $!+Down      ,SI.JumpToDefinition
;;;Hotkey, $^tab        ,SI.NextFileorTab
;;;Hotkey, $^+tab       ,SI.PrevFileorTab
   Hotkey, $^+t         ,SI.ReopenRecentFileorTab
;;;Hotkey, $^g          ,SI.JumpToLine
   Hotkey, $^\          ,SI.JumpToMatchingBrace
   Hotkey, $^F3         ,SI.FindWordAtCurrentPosition

;;;;;;;;;;; edit
   Hotkey, $^y          ,SI.Redo
   Hotkey, $^d          ,SI.DuplicateCurrentLine
   Hotkey, $^+d         ,SI.DeleteCurrentLine
;;;Hotkey, $^/          ,SI.CommentWithLineComment
;;;Hotkey, $^+/         ,SI.CommentWithBlockComment
   Hotkey, $^+u         ,SI.ToggleUpperOrLowerCase
;;;Hotkey, $^+i         ,SI.IndentBlock

;;;;;;;;
Hotkey, IfWinActive
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Goto, SI.EndOfFile


;;;;;;;; move
SI.MoveNextPostion:              ;;!Right::    ;;move next position
    sendinput, !.
    return

SI.MovePrevPosition:             ;;!Left::     ;;move previous position
    sendinput, !,
    return

SI.SearchCaller:                 ;;!+Up::      ;;search caller
    sendinput, ^`
    return

SI.JumpToDefinition:             ;;!+Down::    ;;jump to definition
    sendinput, ^=
    return

SI.NextFileorTab:                ;;^tab::      ;;next file or tab
    sendinput, ^{tab}
    return

SI.PrevFileorTab:                ;;^+tab::     ;;previous file or tab
    sendinput, ^+{tab}
    return

SI.ReopenRecentFileorTab:        ;;^+t:        ;;reopen recent closed tab or file
    sendinput, !f 
    sleep, 300 
    sendinput, f
    return

SI.JumpToLine:                   ;;^g::        ;;goto line
    sendinput, ^g
    return

SI.JumpToMatchingBrace:          ;;^\::        ;;goto matching brace toggle
    sendinput, % (_t1 := !_t1) ? ("^+[") : ("^+]")
    return

SI.FindWordAtCurrentPosition:    ;;^F3::       ;;find word at current cursor
    sendinput, !f
    return
;;;;;;;; edit
SI.Redo:                         ;;^y::        ;;redo
    sendinput, ^+z
    return

SI.DuplicateCurrentLine:         ;;^d::        ;;duplicate line
    sendinput, {HOME}
    sendinput, {SHIFT DOWN}{END}{SHIFT UP}
    sendinput, ^c
    sendinput, {END}{Enter}
    sendinput, ^v
   
    return

SI.DeleteCurrentLine:            ;;^+d::       ;;delete line
    sendinput, {HOME}
    sendinput, {SHIFT DOWN}{END}{SHIFT UP}
    sendinput, {Del}{Del}
    
    return

SI.CommentWithLineComment:       ;;^/::        ;;comment with line-comment
    sendinput, ^/
    return

SI.CommentWithBlockComment:      ;;^+/::       ;;comment with block-comment
    sendinput, ^+/
    return

SI.ToggleUpperOrLowerCase:       ;;^+u::       ;;toggle upper or lower case
    sendinput, % (_t1 := !_t1) ? ("^+u") : ("^u")
    return

SI.IndentBlock:                  ;;^!i::       ;;indent block
    sendinput, ^!i
    return


SI.EndOfFile: