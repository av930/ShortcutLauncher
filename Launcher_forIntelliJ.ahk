IN := {}
IN["name"] := "IntelliJ v2017.3.2"
nameofprog := idea64.exe

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; unique action list
_INAction( Menu, Sleep, Key ) {
    ;;MsgBox, %Menu%, %Sleep%, %Key%
    SendInput, %Menu%

    WinWaitActive, ahk_class SunAwtDialog ahk_exe %nameofprog%
    Sleep %Sleep%
    SendInput, {delete}%Key%
    WinWaitClose, ahk_class SunAwtDialog ahk_exe %nameofprog%
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
;; SI.fc                := ["sendinput, ^+a `n sleep, 500 `n sendinput, {text}Close All "           ,"multi commands"]
;; SI.fd                := [Func( "_SIAction" ).Bind( "^+a", 500, "{text}File Encoding" )            ,"function call"]


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; abbreviation definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;; program
IN.plist                := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}manage projects.." )         ,"project list"]
IN.pexit                := ["!{F4}"                                                                   ,"project exit"]
IN.pset                 := ["^!s"                                                                 ,"program settings"]
IN.pkey                 := [Func( "_ASAction" ).Bind( "^!s", 1200, "{text}Keymap" )       ,"program shortcut setting"]
IN.pconf                := ["^!+s"                                                           ,"project configuration"]
IN.psync                := ["^!y"                                               ,"project file/database sync-up sync"]

;;;;;;;; file
IN.fo                   := ["^+n"                                                                        ,"file open"]
IN.fr                   := ["^!y"                                                               ,"file reload & sync"]
IN.frecent              := ["^e"                                                         ,"file reopen recently used"]
IN.fsync                := IN.fr
IN.fc                   := ["^{F4}"                                                                     ,"file close"]
IN.fsa                  := ["^s"                                                                     ,"file all save"]
IN.fca                  := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}Close All Editor Close Action" )    ,"file all close"]
IN.fencode              := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}file encoding" )            ,"file encoding"]
IN.fhistory             := [Func( "_ASAction" ).Bind("^+a", "show history")                ,"file show local history"]

;;;;;;;; symbol search
IN.stype                := ["^+b"                                                                 ,"symbol type jump"]
IN.spre                 := ["^+i"                                                 ,"symbol symbol-definition preview"]
IN.shelp                := ["+{F1}"                                               ,"symbol help in external document"]
IN.sjump                := ["^b"                                                            ,"symbol definition jump"]
IN.sj                   := IN.sjump
IN.shier                := ["^h"                                                           ,"symbol hierarchy viewer"]
IN.sref                 := ["!{F7}"                                               ,"symbol usage search by reference"]
IN.sh                   := ["^+{F7}"                                                              ,"symbol highlight"]
IN.sfind                := ["^+f"                                                ,"symbol string search in all space"]
IN.sreplace             := ["^+r"                                               ,"symbol string replace in all space"]
IN.srename              := ["+{F6}"                                                          ,"symbol rename smartly"]
IN.slist                := ["^!+n"                                                         ,"list all symbol by name"]
IN.sover                := ["^!b"                                                   ,"symbol list of override method"]
IN.sreplace             := ["^+r"                                                        ,"symbol in replace smartly"]
IN.ssample              := ["!{F8}"                                              ,"symbol, search sample code in web"]
IN.sb                   := ["{F11}"                                                         ,"symbol,toggle bookmark"]
IN.sbook                := ["+{F11}"                                                       ,"symbol,manage bookmarks"]


;;;;;;;; coding
IN.cc                   := ["^{space}"                                                ,"coding, symbol auto complete"]
IN.cp                   := ["^{space}"                                             ,"coding, parameter auto complete"]
IN.ci                   := ["^!o"                                                ,"coding, class import optimization"]
IN.cfix                 := ["!{enter}"                                                      ,"coding, error auto fix"]
IN.cerr                 := ["^{F1}"                                                              ,"coding, error tip"]
IN.ct                   := ["!{enter}"                           ,"code generation, override, implement, constructor"]


;;;;;;;; build

IN.bb                   := ["^+{F9}"                 ,                                      "build only current file"]
IN.bp                   := ["^{F9}"                                                                  ,"build project"]
IN.brun                 := ["sendinput, ^+{f9} `n sleep, 500 `n sendinput, ^+{f10} "                   ,"build & run"]
IN.bre                  := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}Rebuild Project")   ,"build agagin, rebuild"]
IN.bc                   := [Func( "_ASAction" ).Bind( "^+a", 500, "Clean Project" )                   ," build clean"]
IN.bd                   := ["+{F9}"                                                          ,"build and start debug"]


;;;;;;;; vcs
IN.vs                   := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}Show Local Changes")      ,"vcs, git status"]
IN.vlog                 := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}show Git repository Log...") ,"vcs, git log"]
IN.vhis                 := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}Show History")           ,"vcs, git history"]
IN.vc                   := ["^k"                                                                   ,"vcs, git commit"]
IN.va                   := ["^!a"                                                                     ,"vcs, git add"]
IN.vpush                := ["^+k"                                                           ,"vcs, git push & upload"]
IN.vpull                := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}Pull...")          ,"vcs, git pull & update"]


;;;;;;;; windows
IN.wfull                := ["^+{F12}"                                                   ,"window, toggle full-screen"]
IN.w                    := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}Tool Windows")                ,"window list"]
IN.wedit                := ["{ESC}"                                                                 ,"window, editor"]
IN.wdir                 := ["!1"                                                            ,"window, directory view"]
IN.wlayout              := ["!7"                                                             ,"window, symbol layout"]
IN.wsymlocal            := ["^{F12}"                                                ,"window, find local symbol view"]
IN.wsymglobal           := ["{LShift}{LShift}"                       ,"window, find global Symbol, Search Everywhere"]
IN.wsg                  := IN.wsymglobal
IN.whier                := ["^h"                                                    ,"window, class hierarchy viewer"]
IN.wcall                := ["^!h"                                                                ,"window, call flow"]
IN.wmsg                 := ["!1"                                         ,"window, message view listed compile error"]
IN.wlog                 := ["!6"                                                          ,"window, log message view"]
IN.wdebug               := ["!5"                                                              ,"window debugger view"]
IN.wplug                := [Func( "_ASAction" ).Bind( "^+a", 500, "Plugins")              ,"manage external plug-ins"]


;;;;;;;; tool
IN.tpath                := [Func( "_OSRunTool" ).Bind("^+c", "copy")                 ,"tool full path copy, NEED2MAP"]
IN.tex                  := [Func( "_OSRunTool" ).Bind("^+c", "explorer")                      ,"tool launch explorer"]
IN.tt                   := IN.tex
IN.tcmd                 := [Func( "_OSRunTool" ).Bind("^+c", "cmd")                    ,"tool command line interface"]
IN.tedit                := [Func( "_OSRunTool" ).Bind("^+c", "notepad++")                 ,"tool edit with notepad++"]


;;;;;;;; edit & etc,
;;;; functionality possible to map abbreviation instead of shortcut
IN.efo                  := ["^+="                                                                     ,"edit, unfold"]
IN.efc                  := ["^+-"                                                                       ,"edit, fold"]
IN.eval                 := ["!{F8}"                                              ,"evaluate expression for debugging"]
IN.eformat              := ["^!l"                                                                      ,"indent file"]


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



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; shortcut keymap definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; apply both of Intellij and AndroidStudio
;Hotkey, IfWinActive, ahk_exe idea64.exe
Hotkey, IfWinActive, ahk_class SunAwtFrame
;;;; move, edit functionality must be defined in shortcut not abbreviation for convenience
;;;;;;;; move
   Hotkey, $!Right      ,IN.MoveNextPostion
   Hotkey, $!Left       ,IN.MovePrevPosition
   Hotkey, $!+Up        ,IN.PreviewDefinition
   Hotkey, $!+Down      ,IN.JumpToDefinition
   Hotkey, $!+Right     ,IN.JumpToOverrideMethod
;;;Hotkey, $^tab        ,IN.NextFileorTab
;;;Hotkey, $^+tab       ,IN.PrevFileorTab
   Hotkey, $^w          ,IN.CloseCurrentFile
   Hotkey, $^+t         ,IN.ReopenRecentFileorTab
;;;Hotkey, $^g          ,IN.JumpToLine
   Hotkey, $^\          ,IN.JumpToMatchingBrace
;;;Hotkey, $^F3         ,IN.FindWordAtCurrentPosition

;;;;;;;;;;; edit
   Hotkey, $^y          ,IN.Redo
;;;Hotkey, $^d          ,IN.DuplicateCurrentLine
   Hotkey, $^+d         ,IN.DeleteCurrentLine
;;;Hotkey, $^/          ,IN.CommentWithLineComment
;;;Hotkey, $^+/         ,IN.CommentWithBlockComment
;;;Hotkey, $^+u         ,IN.ToggleUpperOrLowerCase
;;;Hotkey, $^+i         ,IN.IndentBlock
;;;;;;;;
Hotkey, IfWinActive
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Goto, IN.EndOfFile


;;;;;;;; move
IN.MoveNextPostion:              ;;!Right::    ;;move next position
    sendinput, ^!{Right}
    return

IN.MovePrevPosition:             ;;!Left::     ;;move previous position
    sendinput, ^!{Left}
    return

IN.PreviewDefinition:            ;;!+Up::      ;;preview definition & type
    sendinput, ^+i
    return

IN.JumpToDefinition:             ;;!+Down::    ;;jump to definition
    sendinput, ^b
    return

IN.JumpToOverrideMethod:         ;;!+Right::   ;;jump to Override Method
    sendinput, % IN.sover[1]
    return
    
IN.NextFileorTab:                ;;^tab::      ;;next file or tab
    sendinput, ^{tab}
    return

IN.PrevFileorTab:                ;;^+tab::     ;;previous file or tab
    sendinput, ^+{tab}
    return
    
IN.CloseCurrentFile:             ;;^w:         ;;close current file
    sendinput, % IN.fc[1]
    return

IN.ReopenRecentFileorTab:        ;;^+t:        ;;reopen recent closed tab or file
    sendinput, % IN.frecent[1]
    return

IN.JumpToLine:                   ;;^g::        ;;goto line
    sendinput, ^g
    return

IN.JumpToMatchingBrace:          ;;^\::        ;;goto matching brace toggle
    sendinput, ^+m
    return

IN.FindWordAtCurrentPosition:    ;;^F3::       ;;find word at current cursor
    sendinput, ^{F3}
    return
    
;;;;;;;; edit
IN.Redo:                         ;;^y::        ;;redo
    sendinput, ^+z
    return

IN.DuplicateCurrentLine:         ;;^d::        ;;duplicate line
    sendinput, ^d
    return

IN.DeleteCurrentLine:            ;;^+d::       ;;delete line
    sendinput, ^y
    return

IN.CommentWithLineComment:       ;;^/::        ;;comment with line-comment
    sendinput, ^/
    return

IN.CommentWithBlockComment:      ;;^+/::       ;;comment with block-comment
    sendinput, ^+/
    return

IN.ToggleUpperOrLowerCase:       ;;^+u::       ;;toggle upper or lower case
    sendinput, ^+u
    return

IN.IndentBlock:                  ;;^!i::       ;;indent block
    sendinput, ^!i
    return


IN.EndOfFile: