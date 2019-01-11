IN := {}
IN["name"] := "IntelliJ v2018.3.2"
IN[prog] := idea64.exe
IN[clas] := SunAwtFrame
IN[file] := "IntelliJ"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; unique action list
_INAction( Menu, Sleep, Key ) {
    ;MsgBox, %Menu%, %Sleep%, %Key%
	static InitialDelay = 500
    SendInput, %Menu%

    WinWaitActive, % "ahk_class SunAwtFrame ahk_exe " . IN[prog]
	Envadd, InitialDelay, %Sleep%
    
    Sleep %InitialDelay% 
	InitialDelay = 0
    SendInput, {delete}%Key%
    ;;Sleep, 100
    ;;SendInput, {enter}
    WinWaitClose,  % "ahk_class SunAwtFrame ahk_exe " . IN[prog]
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
IN.project              := [Func( "_INAction" ).Bind( "^+a", 500, "{text}Manage Projects.." ), "Project: List.Project"]
IN.pexit                := [Func( "_INAction" ).Bind( "^+a", 500, "Close Project")                   ,"Project: Close"]
IN.pset                 := ["^!s"                                                                 ,"Program: Settings"]
IN.pkey                 := [Func( "_INAction" ).Bind( "^!s", 1200, "{text}Keymap" )   ,"Program: Key.Shortcut.Setting"]
IN.pconf                := ["^!+s"                                                           ,"Project: Configuration"]
IN.psync                := ["^!y"                                                            ,"Project: Database.Sync"]
IN.pc                   := ["^+a"                                                           ,"Program: Search.Command"]


;;;;;;;; file
IN.fo                   := ["^+n"                                                                   ,"File: List.Open"]
IN.fr                   := ["^!y"                                                              ,"File: Reload.or.Sync"]
IN.frecent              := ["^e"                                                                  ,"File: Open.Recent"]
IN.fc                   := ["^{F4}"                                                                     ,"File: Close"]
IN.fca                  := [Func( "_INAction" ).Bind( "^+a", 500, "{text}Close All Editor Close" )  ,"File: All.Close"]
IN.fsa                  := ["^s"                                                                     ,"File: All.Save"]
IN.fencode              := [Func( "_INAction" ).Bind( "^+a", 500, "{text}file encoding" )    ,"File: Open.as.Encoding"]
IN.fchange              := [Func( "_INAction" ).Bind( "^+a", 500, "show history")                ,"File: Changes.Show"]
IN.fclone               := ["{F5}"                                                            ,"File: CloneCopy.Class"]


;;;;;;;; symbol search
IN.sfind                := ["^+f"                                                     ,"Symbol: String.Find.inProject"]
IN.sreplace             := ["^+r"                                                  ,"Symbol: String.Replace.inProject"]
IN.sref                 := ["!{F7}"                                                              ,"Symbol: Usage.Find"]
IN.sglobal              := ["^!+n"                                                           ,"Symbol: List.inProject"]
IN.slocal               := ["^{F12}"                                                            ,"Symbol: List.inFile"]
IN.ss                   := ["sendinput, {shift} `n sendinput, {shift}"                      ,"Symbol: Search.AllPlace"]
IN.srename              := ["+{F6}"                                                          ,"Symbol: Rename.Smartly"]
IN.simpl                := ["^!b"                                                ,"Symbol: List.implementation.Method"]
IN.ssample              := ["!{F8}"                                                 ,"Symbol: Samplecode.Search.inWEB"]

;;;;;;;; symbol function
IN.spre                 := ["^+i"                                                  ,"Symbol: Definition.Quick.Preview"]
IN.sjump                := ["^b"                                                            ,"Symbol: Definition.Jump"]
IN.stype                := ["^+b"                                                                 ,"Symbol: Type.Jump"]
IN.shelp                := ["^q"                                                                ,"Symbol: Manual.Open"]
IN.shelpweb             := ["+{F1}"                                                       ,"Symbol: Manual.Open.inWEB"]
IN.shigh                := ["^+{F7}"                                                              ,"Symbol: Highlight"]

IN.sbook                := ["+{F11}"                                                        ,"Symbol: Bookmark.Manage"]
IN.sb                   := ["{F11}"                                                         ,"Symbol: Bookmark.Toggle"]


;;;;;;;; code
IN.cc                   := ["^{space}"                                                    ,"Code: Symbol.AutoComplete"]
IN.cp                   := ["^+{space}"                                                ,"Code: Parameter.AutoComplete"]
IN.ci                   := ["^!o"                                                         ,"Code: Import.AutoComplete"]
IN.cgen                 := ["!{insert}"                               ,"Code: Override.Implement.Constructor.Generate"]
IN.cfix                 := ["!{enter}"                                                          ,"Code: Error.AutoFix"]
IN.cerr                 := ["^{F1}"                                                                 ,"Code: Error.Tip"]
IN.cf                   := ["^+="                                                               ,"Code: UnFold,Expand"]
IN.cfc                  := ["^+-"                                                                  ,"Code: Fold,Close"]
IN.ceval                := ["!{F8}"                                                       ,"Code: Expression.Evaluate"]
IN.cindent              := ["^!i"                                                                ,"Code: Indent.Block"]
IN.cformat              := ["^!l"                                                                 ,"Code: Indent.File"]


;;;;;;;; build
IN.build                := [Func( "_INAction" ).Bind( "^+a", 500, "gradle")                  ,"Build: List.Cmd.Gradle"]
IN.bb                   := ["^{F9}"                                                                  ,"Build: Project"]
IN.bt                   := ["^+{F9}"                                                          ,"Build: Current.Target"]
IN.bc                   := [Func( "_INAction" ).Bind( "^+a", 500, "Clean Project" )                   ," Build: Clean"]
IN.br                   := [Func( "_INAction" ).Bind( "^+a", 500, "{text}ReBuild Project")      ,"Run: Agagin.reBuild"]
;;;; prerequite: autoscroll to source, autoscroll from source need to checked in prject view
IN.run                  := ["!+{f10}"                                                             ,"Run: List.Cmd.Run"]
IN.rr                   := ["^+{f10}"                                                         ,"Run: Run.Current.File"]
IN.rdebug               := ["+{F9}"                                                            ,"Run: and.Start.Debug"]


;;;;;;;; vcs
IN.ver                  := ["!``"                                                       ,"VCS: Menu.History.Blame.ETC"]
IN.vlog                 := [Func( "_INAction" ).Bind( "^+a", 700, "{text}Show VCS Log")                 ,"VCS: Log"]
IN.vs                   := [Func( "_INAction" ).Bind( "^+a", 500, "{text}Show Local Changes")           ,"VCS: Status"]
IN.vc                   := ["^k"                                                                        ,"VCS: Commit"]
IN.va                   := ["^!a"                                                                          ,"VCS: Add"]
IN.vpush                := ["^+k"                                                                   ,"VCS: Push/Amemd"]
IN.vpull                := [Func( "_INAction" ).Bind( "^+a", 500, "{text}Pull...")                        ,"VCS: Pull"]


;;;;;;;; windows
IN.window               := [Func( "_INAction" ).Bind( "^+a", 500, "{text}Tool Windows")           ,"Window: List.Menu"]
IN.wedit                := ["{ESC}"                                                           ,"Window: Backto.Editor"]
IN.wdir                 := ["!1"                                                             ,"Window: Directory.View"]
IN.wlayout              := ["!7"                                                              ,"Window: Symbol.Layout"]
IN.whier                := ["^h"                                                            ,"Window: Class.Hierarchy"]
IN.wcall                := ["^!h"                                                                ,"Window: Call.Graph"]
IN.wmsg                 := ["sendinput, ^+a `n sleep, 500 `n sendinput, Tool Windows `n sleep, 300 `n sendinput, {enter} `n sleep, 200 `n sendinput, {text}build"  ,"Window: Build.Log.Message"]
IN.wdebug               := ["!5"                                                                 ,"Window: Debug.View"]
IN.wlog                 := ["!6"                                                        ,"Window: Runtime.Log.Message"]
IN.wplug                := [Func( "_INAction" ).Bind( "^+a", 500, "Plugins")                 ,"Window: Plugin.Manager"]
IN.wpresent             := [Func( "_INAction" ).Bind( "^+a", 500, "{text}Presentation Mode")   ,"Window: FullScreen.Present"]
IN.wfull                := ["^+{F12}"                                                     ,"Window: FullScreen.Toggle"]


;;;;;;;; tool
IN.tpath                := [Func( "_OSRunTool" ).Bind("^+c", "copy")                            ,"Tool: FullPath.Copy"]
IN.tex                  := [Func( "_OSRunTool" ).Bind("^+c", "explorer")                      ,"Tool: Explorer.Launch"]
IN.tee                  := IN.tex
IN.tcmd                 := [Func( "_OSRunTool" ).Bind("^+c", "cmd")                     ,"Tool: CommandLine.Interface"]
IN.tshell               := [Func( "_OSRunTool" ).Bind("^+c", "shell")                    ,"Tool: ExtraShell.Interface"]
IN.tedit                := [Func( "_OSRunTool" ).Bind("^+c", "editor")                ,"Tool: OpenWith.ExternalEditor"]


;;;;;;;; windows
;;;; font size up/down should mapped with shortcut : ctrl + mouse up/down


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
;;;Hotkey, xxxxxxx      ,Action to do (remapped here)   ;;Orinal Key assigned to each editor
;;;;;;;; move
   Hotkey, $!Right      ,IN.MoveNextPostion             ;;^!Right
   Hotkey, $!Left       ,IN.MovePrevPosition            ;;^!Left
   Hotkey, $!+Up        ,IN.PreviewDefinition           ;;^+i
   Hotkey, $!+Down      ,IN.JumpToDefinition            ;;^b
   Hotkey, $!+Right     ,IN.JumpToOverrideMethod        ;;^!b
;;;Hotkey, $^tab        ,IN.NextFileorTab               ;;^tab
;;;Hotkey, $^+tab       ,IN.PrevFileorTab               ;;^+tab
   Hotkey, $^+o         ,IN.OpenAllSymbol               ;;^+!n
   Hotkey, $^w          ,IN.CloseCurrentFile            ;;^{F4}
   Hotkey, $^+t         ,IN.ReopenRecentFileorTab       ;;^e
;;;Hotkey, $^g          ,IN.JumpToLine                  ;;^g
   Hotkey, $^\          ,IN.JumpToMatchingBrace         ;;^+m
   Hotkey, $+Space      ,IN.JumpOutOfMatchingBrace      ;;
   Hotkey, $!+Left      ,IN.FindWordAtCurrentPos        ;;^F3
   Hotkey, $!Down       ,IN.FindWordAtCurrentPosDown    ;;F3
   Hotkey, $!Up         ,IN.FindWordAtCurrentPosUp      ;;+F3


   Hotkey, $^y          ,IN.Redo                        ;;^+z
   Hotkey, $^+d         ,IN.DeleteCurrentLine           ;;^y
   Hotkey, $^d          ,IN.DuplicateCurrentLine        ;;^d
;;;Hotkey, $^/          ,IN.CommentWithLineComment      ;;^/
;;;Hotkey, $^+/         ,IN.CommentWithBlockComment     ;;^+/
;;;Hotkey, $^+u         ,IN.ToggleUpperOrLowerCase      ;;^+u
;;;Hotkey, $^+i         ,IN.IndentBlock                 ;;^!i

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
    sendinput, % IN.spre[1]
    return

IN.JumpToDefinition:             ;;!+Down::    ;;jump to definition
    sendinput, ^b
    return

IN.JumpToOverrideMethod:         ;;!+Right::   ;;jump to Override Method
    sendinput, % IN.simpl[1]
    return
    
IN.NextFileorTab:                ;;^tab::      ;;next file or tab
    sendinput, ^{tab}
    return

IN.PrevFileorTab:                ;;^+tab::     ;;previous file or tab
    sendinput, ^+{tab}
    return
   
IN.OpenAllSymbol:                ;;^+!o:         ;;close current file
    sendinput, {shift}
    sendinput, {shift}
    return
   
IN.CloseCurrentFile:             ;;^w:         ;;close current file
    sendinput, % IN.fc[1]
    return

IN.ReopenRecentFileorTab:        ;;^+t:        ;;reopen recent closed tab or file
;;  MsgBox, A_Hotkey 
    sendinput, % IN.frecent[1]
    return

IN.JumpToLine:                   ;;^g::        ;;goto line
    sendinput, ^g
    return

IN.JumpToMatchingBrace:          ;;^\::        ;;goto matching brace toggle
    sendinput, ^+m
    return

IN.JumpOutOfMatchingBrace:       ;;+ ::        ;;goto matching brace toggle
    sendinput, {Right}
    return
    
IN.FindWordAtCurrentPos:        ;;^F3::        ;;set word as finding-word at current cursor
    sendinput, ^{F3}
	sendinput, +{F3}
	return 
	
IN.FindWordAtCurrentPosDown:    ;;F3::         ;;find word at current cursor
    sendinput, {F3}
/*
    sendinput, % (_t1) ? ("^{F3}") : ("{F3}")
    Loop
    {
        sleep, 100
        if !GetKeyState("Down")
        {
            _t1 := 0
            break
        }
            
    }
*/    
    return

IN.FindWordAtCurrentPosUp:       ;;^F3::       ;;find word at current cursor
    sendinput, +{F3}
;;    _t1 := 1
/*
    sendinput, % (_t1) ? ("+{F3}") : ("^{F3}+{F3}")
    Loop
    {
        sleep, 100
        if !GetKeyState("Up")
        {
            _t1 := 1
            break
        }
    }
*/
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
    sendinput, % IN.cindent[1]
    return


IN.EndOfFile: