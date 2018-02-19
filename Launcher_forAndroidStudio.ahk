AS := {}
AS["name"] := "AndroidStudio v3.0"
nameofprog := studio64.exe

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; unique action list
_ASAction( Menu, Sleep, Key ) {
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
AS.plist                := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}manage projects.." )         ,"project list"]
AS.pset                 := ["^!s"                                                                 ,"program settings"]
AS.pconf                := ["^!+s"                                                           ,"project configuration"]
AS.pkey                 := [Func( "_ASAction" ).Bind( "^!s", 1200, "{text}Keymap" )       ,"program shortcut setting"]
AS.pk                   := AS.pkey
AS.pexit                := ["!{F4}"                                                                   ,"project exit"]
AS.px                   := AS.pexit


;;;;;;;; file
AS.fo                   := ["^+n"                                                                        ,"file open"]
AS.fr                   := ["^!y"                                                               ,"file reload & sync"]
AS.frecent              := ["^e"                                                         ,"file reopen recently used"]
AS.fsync                := AS.fr
AS.fc                   := ["^{F4}"                                                                     ,"file close"]
AS.fsa                  := ["^s"                                                                     ,"file all save"]
AS.fca                  := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}Close All" )               ,"file all close"]
AS.fe                   := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}file encoding" )            ,"file encoding"]


;;;;;;;; symbol search
AS.sync                 := ["^!y"                                                      ,"symbol sync-up or file sync"]
AS.stype                := ["^+b"                                                                 ,"symbol type jump"]
AS.spre                 := ["^+i"                                                 ,"symbol symbol-definition preview"]
AS.shelp                := ["+{F1}"                                               ,"symbol help in external document"]
AS.sjump                := ["^b"                                                            ,"symbol definition jump"]
AS.sj                   := AS.sjump
AS.shier                := ["^h"                                                           ,"symbol hierarchy viewer"]
AS.scaller              := ["!{F7}"                                                             ,"symbol caller find"]
AS.sh                   := ["^+{F7}"                                                              ,"symbol highlight"]
AS.sf                   := ["^+f"                                                       ,"symbol search in all space"]
AS.sr                   := ["^+r"                                                      ,"symbol replace in all space"]
AS.sfind                := ["^!+n"                                                          ,"goto to symbol by name"]
AS.sover                := ["^!b"                                                   ,"symbol list of override method"]
AS.sreplace             := ["^+r"                                                        ,"symbol in replace smartly"]
AS.ssample              := ["!{F8}"                                              ,"symbol, search sample code in web"]
AS.sb                   := ["{F11}"                                                         ,"symbol,toggle bookmark"]
AS.sbook                := ["+{F11}"                                                       ,"symbol,manage bookmarks"]


;;;;;;;; coding
AS.cc                   := ["^{space}"                                                ,"coding, symbol auto complete"]
AS.cp                   := ["^{space}"                                             ,"coding, parameter auto complete"]
AS.ci                   := ["^!o"                                                ,"coding, class import optimization"]
AS.cfix                 := ["!{enter}"                                                      ,"coding, error auto fix"]
AS.cerr                 := ["^{F1}"                                                              ,"coding, error tip"]
AS.ct                   := ["!{enter}"                           ,"code generation, override, implement, constructor"]


;;;;;;;; build
AS.bb                   := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}Build Apk(s)")                 ,"build only"]
AS.bp                   := ["^{F9}"                                                                  ,"build project"]
AS.brun                 := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}Run Run/Debug")               ,"build & run"]
AS.br                   := AS.brun
AS.brb                  := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}Rebuild Project")   ,"build agagin, rebuild"]
AS.bc                   := [Func( "_ASAction" ).Bind( "^+a", 500, "Clean Project" )                   ," build clean"]
AS.bd                   := ["+{F9}"                                                          ,"build and start debug"]


;;;;;;;; vcs
AS.vs                   := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}Show Local Changes")      ,"vcs, git status"]
AS.vlog                 := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}show Git repository Log...") ,"vcs, git log"]
AS.vhis                 := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}Show History")           ,"vcs, git history"]
AS.vc                   := ["^k"                                                                   ,"vcs, git commit"]
AS.va                   := ["^!a"                                                                     ,"vcs, git add"]
AS.vpush                := ["^+k"                                                           ,"vcs, git push & upload"]
AS.vpull                := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}Pull...")          ,"vcs, git pull & update"]
AS.vhis                 := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}Show History")           ,"vcs, git history"]


;;;;;;;; windows
AS.wfull                := ["^+{F12}"                                                   ,"window, toggle full-screen"]
AS.w                    := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}Tool Windows")                ,"window list"]
AS.wedit                := ["{ESC}"                                                                 ,"window, editor"]
AS.wdir                 := ["!1"                                                            ,"window, directory view"]
AS.wlayout              := ["!7"                                                             ,"window, symbol layout"]
AS.wsym                 := ["^{F12}"                                                ,"window, find local symbol view"]
AS.wsymglobal           := ["{LShift}{LShift}"                       ,"window, find global Symbol, Search Everywhere"]
AS.wsg                  := AS.wsymglobal
AS.whier                := ["^h"                                                    ,"window, class hierarchy viewer"]
AS.wcall                := ["^!h"                                                                ,"window, call flow"]
AS.wmsg                 := ["!1"                                         ,"window, message view listed compile error"]
AS.wlog                 := ["!6"                                                          ,"window, log message view"]
AS.wdebug               := ["!5"                                                              ,"window debugger view"]
AS.wplug                := [Func( "_ASAction" ).Bind( "^+a", 500, "Plugins")              ,"manage external plug-ins"]


;;;;;;;; tool
AS.tpath                := [Func( "_OSRunTool" ).Bind("^+c", "copy")                 ,"tool full path copy, NEED2MAP"]
AS.tex                  := [Func( "_OSRunTool" ).Bind("^+c", "explorer")                      ,"tool launch explorer"]
AS.tt                   := AS.tex
AS.tcmd                 := [Func( "_OSRunTool" ).Bind("^+c", "cmd")                    ,"tool command line interface"]
AS.tedit                := [Func( "_OSRunTool" ).Bind("^+c", "notepad++")                 ,"tool edit with notepad++"]


;;;;;;;; edit & etc,
;;;; functionality possible to map abbreviation instead of shortcut
AS.efo                  := ["^+="                                                                     ,"edit, unfold"]
AS.efc                  := ["^+-"                                                                       ,"edit, fold"]
AS.eval                 := ["!{F8}"                                              ,"evaluate expression for debugging"]
AS.eformat              := ["^!l"                                                                      ,"indent file"]


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

Hotkey, IfWinActive, ahk_exe studio64.exe
;;;; move, edit functionality must be defined in shortcut not abbreviation for convenience
;;;;;;;; move
   Hotkey, $!Right      ,AS.MoveNextPostion
   Hotkey, $!Left       ,AS.MovePrevPosition
   Hotkey, $!+Up        ,AS.PreviewDefinition
   Hotkey, $!+Down      ,AS.JumpToDefinition
   Hotkey, $!+Right     ,AS.JumpToOverrideMethod
;;;Hotkey, $^tab        ,AS.NextFileorTab
;;;Hotkey, $^+tab       ,AS.PrevFileorTab
   Hotkey, $^w          ,AS.CloseCurrentFile
   Hotkey, $^+t         ,AS.ReopenRecentFileorTab
;;;Hotkey, $^g          ,AS.JumpToLine
   Hotkey, $^\          ,AS.JumpToMatchingBrace
;;;Hotkey, $^F3         ,AS.FindWordAtCurrentPosition

;;;;;;;;;;; edit
   Hotkey, $^y          ,AS.Redo
;;;Hotkey, $^d          ,AS.DuplicateCurrentLine
   Hotkey, $^+d         ,AS.DeleteCurrentLine
;;;Hotkey, $^/          ,AS.CommentWithLineComment
;;;Hotkey, $^+/         ,AS.CommentWithBlockComment
;;;Hotkey, $^+u         ,AS.ToggleUpperOrLowerCase
;;;Hotkey, $^+i         ,AS.IndentBlock
;;;;;;;;
Hotkey, IfWinActive
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Goto, AS.EndOfFile


;;;;;;;; move
AS.MoveNextPostion:              ;;!Right::    ;;move next position
    sendinput, ^!{Right}
    return

AS.MovePrevPosition:             ;;!Left::     ;;move previous position
    sendinput, ^!{Left}
    return

AS.PreviewDefinition:            ;;!+Up::      ;;preview definition & type
    sendinput, ^+i
    return

AS.JumpToDefinition:             ;;!+Down::    ;;jump to definition
    sendinput, ^b
    return

AS.JumpToOverrideMethod:         ;;!+Right::   ;;jump to Override Method
    sendinput, % AS.sover[1]
    return
    
AS.NextFileorTab:                ;;^tab::      ;;next file or tab
    sendinput, ^{tab}
    return

AS.PrevFileorTab:                ;;^+tab::     ;;previous file or tab
    sendinput, ^+{tab}
    return
    
AS.CloseCurrentFile:             ;;^w:         ;;close current file
    sendinput, % AS.fc[1]
    return

AS.ReopenRecentFileorTab:        ;;^+t:        ;;reopen recent closed tab or file
    sendinput, % AS.frecent[1]
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


AS.EndOfFile: