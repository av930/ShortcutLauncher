VS := {}
VS["name"] := "VScode v1.70"
VS[prog] := Code.exe
VS[clas] := Chrome_WidgetWin_1
VS[file] := "VScode"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; unique action list
_VSAction( Menu, Sleep, Key ) {
    ;MsgBox, %Menu%, %Sleep%, %Key%
    static InitialDelay = 50 ;;popup delay
    SendInput, %Menu%

    WinWaitActive, % "ahk_class Chrome_WidgetWin_1 ahk_exe " . VS[prog]
    Envadd, InitialDelay, %Sleep%
    
    Sleep %InitialDelay% 
    InitialDelay = 0
    SendInput, {delete}%Key%
    Sleep, 50
    ;;SendInput, {enter}
    WinWaitClose,  % "ahk_class Chrome_WidgetWin_1 ahk_exe " . VS[prog]
}


_VSSync() {
    ;;reload current file
    SendInput, ^!y
    ;;sync gradle build output
    _VSAction("^+a", 100, "{text}Sync Project with Gradle Files")
    
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; basic rule of shortcuts
;;;; length of abbreviation should be under 2~5 char.
;;;; basic sequence of chars (object - action - target) or (object - sub object)
;;;; count functionality ends with ~c (means count)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Example
;; Command              := [shortcut key command                                                        ,"TAG string"]
;; SI.fa                := ["^s"                                                                            ,"hotkey"]
;; SI.fb                := ["sendinput, ^s"                                                         ,"single command"]
;; SI.fc                := ["sendinput, ^+a `n sleep, 100 `n sendinput, {text}Close All "           ,"multi commands"]
;; SI.fd                := [Func( "_SIAction" ).Bind( "^+a", 100, "{text}File Encoding" )            ,"function call"]


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; abbreviation definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;; program
VS.pset                 := ["^,"                                                                             ,"Program: Settings"]
VS.pkey                 := ["sendinput, ^k `n sendinput, ^s"                                     ,"Program: Key.Shortcut.Setting"]
VS.pc                   := ["^+p"                                                                      ,"Program: Search.Command"]
VS.project              := ["^r"                                                       ,"Project: List.Project(Workspace/Folder)"]
VS.pnew                 := [Func( "_VSAction" ).Bind( "^+p", 100, "{text}add Folder to Workspace" ),       "Project: New.Project"]
VS.pexit                := [Func( "_VSAction" ).Bind( "^+p", 100, "{text}close Workspace" ),   "Project(Workspace/Folder): Close"]
VS.pconf                := ["^+d"                                                                   ,"Project: Run Configuration"]
;;;VS.psync                := ["^!y"                                                                    ,"Project: Database.Sync"]


;;;;;;;; file
VS.fo                   := ["^p"                                                                               ,"File: List.Open"]
;;;VS.fr                   := ["^!y"                                                                      ,"File: Reload.or.Sync"]
VS.frecent              := ["^r"                                                                             ,"File: Open.Recent"]
VS.fc                   := ["^w"                                                                                   ,"File: Close"]
VS.fca                  := ["sendinput, ^k `n sendinput, ^w"                                                   ,"File: All.Close"]
VS.fsa                  := [Func( "_VSAction" ).Bind( "^+a", 100, "{text}File: All.Save")                       ,"File: All.Save"]
VS.fencode              := [Func( "_VSAction" ).Bind( "^+p", 100, "{text}Change File Encoding" )        ,"File: Open.as.Encoding"]
VS.fchange              := [Func( "_VSAction" ).Bind( "^+p", 100, "{text}Open All change")                  ,"File: Changes.Show"]
VS.fclone               := ["SoundPlay *-1"                                    ,"File: CloneCopy.Duplicate.Class(not supported )"]


;;;;;;;; symbol search
VS.sfind                := ["^+f"                                                                ,"Symbol: String.Find.inProject"]
VS.sreplace             := ["^+h"                                                             ,"Symbol: String.Replace.inProject"]
VS.sref                 := ["^{F12}"                                                         ,"Symbol: Usage.Reference.inProject"]
VS.sglobal              := ["^t"                                                                        ,"Symbol: List.inProject"]
VS.slocal               := ["^+o"                                                                          ,"Symbol: List.inFile"]
VS.srename              := ["{F2}"                                                                      ,"Symbol: Rename.Smartly"]
VS.ssample              := ["SoundPlay *-1"                                                    ,"Symbol: Samplecode.Search.inWEB"]

;;;;;;;; symbol function
VS.spre                 := ["{F12}"                                                           ,"Symbol: Definition.Quick.Preview"]
VS.sjump                := ["{F12}"                                                                    ,"Symbol: Definition.Jump"]
VS.stype                := ["^+b"                                                                            ,"Symbol: Type.Jump"]
VS.shelp                := ["^q"                                                                        ,"Symbol: ManualDoc.Open"]
VS.shelpweb             := ["+{F1}"                                                               ,"Symbol: ManualDoc.Open.inWEB"]
;;;VS.shigh                := ["^+{F7}"                                                                         ,"Symbol: Highlight"]
VS.shigh                := ["^!{F3}"                                                                         ,"Symbol: Highlight"]
                                                                           
VS.sbook                := ["+{F11}"                                                                   ,"Symbol: Bookmark.Manage"]
VS.sb                   := ["{F11}"                                                                    ,"Symbol: Bookmark.Toggle"]
                                                                           
                                                                           
;;;;;;;; code                                                              
VS.cc                   := ["^{space}"                                                               ,"Code: Symbol.AutoComplete"]
VS.cp                   := ["^+{space}"                                                           ,"Code: Parameter.AutoComplete"]
VS.ci                   := ["^!o"                                                                    ,"Code: Import.AutoComplete"]
VS.cgen                 := ["!{insert}"                                          ,"Code: Override.Implement.Constructor.Generate"]
VS.cfix                 := ["^.}"                                                                     ,"Code: Error.AutoFix"]
VS.cerr                 := ["^{F1}"                                                                            ,"Code: Error.Tip"]
VS.cf                   := ["^+="                                                                          ,"Code: UnFold,Expand"]
VS.cfc                  := ["^+-"                                                                             ,"Code: Fold,Close"]
VS.ceval                := ["!{F8}"                                                                  ,"Code: Expression.Evaluate"]
VS.cindent              := ["^!i"                                                                           ,"Code: Indent.Block"]
VS.cformat              := ["^!l"                                                                            ,"Code: Indent.File"]


;;;;;;;; build
VS.build                := [Func( "_VSAction" ).Bind( "^+a", 100, "gradle")                             ,"Build: List.Cmd.Gradle"]
VS.bb                   := ["^{F9}"                                                                             ,"Build: Project"]
VS.bt                   := ["^+{F9}"                                                                     ,"Build: Current.Target"]
VS.bc                   := [Func( "_VSAction" ).Bind( "^+a", 100, "Clean Project" )                              ," Build: Clean"]
VS.br                   := [Func( "_VSAction" ).Bind( "^+a", 100, "{text}ReBuild Project")                 ,"Run: Agagin.reBuild"]
;;;; prerequite: autoscroll to source, autoscroll from source need to checked in prject view          
VS.run                  := ["^{f5}"                                                                          ,"Run: List.Cmd.Run"]
VS.rr                   := [Func( "_VSAction" ).Bind( "^+p", 50, "Run Python File in Terminal{enter}")    ,"Run: Run.Current.File"]
VS.rdebug               := ["^{F5}"                                                                       ,"Run: and.Start.Debug"]


;;;;;;;; vcs
VS.ver                  := ["!``"                                                            ,      "VCS: Menu.History.Blame.ETC"]
VS.vlog                 := [Func( "_VSAction" ).Bind( "^+a", 700, "{text}Show VCS Log")                        ,"VCS: log,revert"]
VS.vs                   := [Func( "_VSAction" ).Bind( "^+a", 100, "{text}Show Local Changes")                      ,"VCS: Status"]
VS.vc                   := ["^k"                                                                                   ,"VCS: Commit"]
VS.va                   := ["^!a"                                                                                     ,"VCS: Add"]
VS.vpush                := ["^+k"                                                                              ,"VCS: Push/Amemd"]
VS.vpull                := [Func( "_VSAction" ).Bind( "^+a", 100, "{text}Pull git")                                  ,"VCS: Pull"]


;;;;;;;; windows
VS.window               := [Func( "_VSAction" ).Bind( "^+a", 100, "{text}Tool Windows")                      ,"Window: List.Menu"]
VS.wedit                := ["{ESC}"                                                                      ,"Window: Backto.Editor"]
VS.wdir                 := ["!1"                                                                        ,"Window: Directory.View"]
VS.wlayout              := ["!7"                                                                         ,"Window: Symbol.Layout"]
VS.whier                := ["^h"                                                                       ,"Window: Class.Hierarchy"]
VS.wcall                := ["^!h"                                                                           ,"Window: Call.Graph"]
VS.wmsg                 := ["sendinput, ^+a `n sleep, 100 `n sendinput, Tool Windows `n sleep, 300 `n sendinput, {enter} `n sleep, 200 `n sendinput, {text}build"  ,"Window: Build.Log.Message"]
VS.wdebug               := ["!5"                                                                            ,"Window: Debug.View"]
VS.wlog                 := ["!6"                                                             ,"Window: Runtime.Log.Debug.Message"]
VS.wplug                := [Func( "_VSAction" ).Bind( "^+a", 100, "Plugins")                            ,"Window: Plugin.Manager"]
VS.wpresent             := [Func( "_VSAction" ).Bind( "^+a", 100, "{text}Presentation Mode")        ,"Window: FullScreen.Present"]
VS.wfull                := [Func( "_VSAction" ).Bind( "^+p", 100, "Toggle Maximized Panel{enter}")   ,"Window: FullScreen.Toggle"]



;;;;;;;; tool
VS.tpath                := ["+!c"                                                                          ,"Tool: FullPath.Copy"]
VS.tt                   := ["+!r"                                                                        ,"Tool: Explorer.Launch"]
VS.tcmd                 := [Func( "_OSRunTool" ).Bind("+!c", "cmd")                                ,"Tool: CommandLine.Interface"]
VS.tshell               := [Func( "_OSRunTool" ).Bind("+!c", "shell")                               ,"Tool: ExtraShell.Interface"]
VS.tedit                := [Func( "_OSRunTool" ).Bind("+!c", "editor")                           ,"Tool: OpenWith.ExternalEditor"]
VS.chat                 := ["^!i"                                                                                 ,"Tool: ChatAI"]


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
Hotkey, IfWinActive, ahk_exe Code.exe
;;#IfWinActive, ahk_class Chrome_WidgetWin_1 || ahk_exe Code.exe
;;#If WinActive("ahk_class Progman") || WinActive("ahk_class WorkerW")

;;;; move, edit functionality must be defined in shortcut not abbreviation for convenience
;;;Hotkey, xxxxxxx      ,Action to do (remapped here)   ;;Orinal Key assigned to each editor
;;;;;;;; move
;;;   Hotkey, $!Right      ,VS.MoveNextCurPosition   
;;;   Hotkey, $!Left       ,VS.MovePrevCurPosition
;;;   Hotkey, $!+Right     ,VS.MoveNextModiPosition
;;;   Hotkey, $!+Left      ,VS.MovePrevModiPosition   
   
;;;Hotkey, $!Right      ,VS.MoveNextModiPosition        ;;^!Right
;;;Hotkey, $!Left       ,VS.MovePrevModiPosition        ;;^!Left
   Hotkey, $!+Up        ,VS.PreviewDefinition           ;;^+i
   Hotkey, $!+Down      ,VS.JumpToDefinition            ;;^b
   Hotkey, $!+Right     ,VS.JumpToOverrideMethod        ;;^!b
;;;Hotkey, $^tab        ,VS.NextFileorTab               ;;^tab
;;;Hotkey, $^+tab       ,VS.PrevFileorTab               ;;^+tab
   Hotkey, $^+o         ,VS.OpenAllSymbol               ;;^+!n
   Hotkey, $^w          ,VS.CloseCurrentFile            ;;^{F4}
   Hotkey, $^+t         ,VS.ReopenRecentFileorTab       ;;^e
;;;Hotkey, $^g          ,VS.JumpToLine                  ;;^g
;;;Hotkey, $^\          ,VS.JumpToMatchingBrace         ;;^+m
   Hotkey, $+Space      ,VS.JumpOutOfMatchingBrace      ;;
;;;Hotkey, $!+Left      ,VS.FindWordAtCurrentPos        ;;^F3
;;;Hotkey, $!Down       ,VS.FindWordAtCurrentPosDown    ;;F3
;;;Hotkey, $!Up         ,VS.FindWordAtCurrentPosUp      ;;+F3


   Hotkey, $^y          ,VS.Redo                        ;;^+z
   Hotkey, $^+d         ,VS.DeleteCurrentLine           ;;^y
   Hotkey, $^d          ,VS.DuplicateCurrentLine        ;;^d
   Hotkey, $^/          ,VS.CommentWithLineComment      ;;^/
   Hotkey, $^+/         ,VS.CommentWithBlockComment     ;;^+/
;;;Hotkey, $^+u         ,VS.ToggleUpperOrLowerCase      ;;^+u
;;;Hotkey, $^+i         ,VS.IndentBlock                 ;;^!i

;;;;;;;;
Hotkey, IfWinActive
;;#IfWinActive
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Goto, VS.EndOfFile


;;;;;;;; move
VS.MoveNextModiPosition:              ;;!Right::    ;;move next position
	sendinput, {F1}
	sendinput, {text}Go Forward in Edit Locations{enter}
    return
	;;;#sendinput, ^!{Right}

VS.MovePrevModiPosition:             ;;!Left::     ;;move previous position
	sendinput, {F1}
	sendinput, {text}Go Back in Edit Locations{enter}
    return
	    ;;;#sendinput, ^!{Left}

VS.PreviewDefinition:            ;;!+Up::      ;;preview definition & type
    sendinput, % VS.spre[1]
    return

VS.JumpToDefinition:             ;;!+Down::    ;;jump to definition
    sendinput, ^b
    return

VS.JumpToOverrideMethod:         ;;!+Right::   ;;jump to Override Method
    sendinput, % VS.simpl[1]
    return
    
VS.NextFileorTab:                ;;^tab::      ;;next file or tab
    sendinput, ^{tab}
    return

VS.PrevFileorTab:                ;;^+tab::     ;;previous file or tab
    sendinput, ^+{tab}
    return
   
VS.OpenAllSymbol:                ;;^+!o:         ;;close current file
    sendinput, {shift}
    sendinput, {shift}
    return
   
VS.CloseCurrentFile:             ;;^w:         ;;close current file
    sendinput, % VS.fc[1]
    return

VS.ReopenRecentFileorTab:        ;;^+t:        ;;reopen recent closed tab or file
;;  MsgBox, A_Hotkey 
    sendinput, % VS.frecent[1]
    return

VS.JumpToLine:                   ;;^g::        ;;goto line
    sendinput, ^g
    return

VS.JumpToMatchingBrace:          ;;^\::        ;;goto matching brace toggle
    sendinput, ^+m
    return

VS.JumpOutOfMatchingBrace:       ;;+ ::        ;;goto matching brace toggle
    sendinput, {Right}
    return
    
VS.FindWordAtCurrentPos:        ;;^F3::        ;;set word as finding-word at current cursor
    sendinput, ^{F3}
    return 
    
VS.FindWordAtCurrentPosDown:    ;;F3::         ;;find word at current cursor
    sendinput, {F3}
    return
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

VS.FindWordAtCurrentPosUp:       ;;+F3::       ;;find word at current cursor
    sendinput, +{F3}
    return
/*
;;    _t1 := 1
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


    
;;;;;;;; edit
VS.Redo:                         ;;^y::        ;;redo
    sendinput, ^+z
    return

VS.DuplicateCurrentLine:         ;;^d::        ;;duplicate line
    sendinput, +!{Down}
    return

VS.DeleteCurrentLine:            ;;^+d::       ;;delete line
    sendinput, ^y
    return

VS.CommentWithLineComment:       ;;^/::        ;;comment with line-comment
;;  MsgBox, A_Hotkey 
    sendinput, ^/
    return

VS.CommentWithBlockComment:      ;;^+/::       ;;comment with block-comment
    sendinput, ^+/
    return

VS.ToggleUpperOrLowerCase:       ;;^+u::       ;;toggle upper or lower case
    sendinput, ^+u
    return

VS.IndentBlock:                  ;;^!i::       ;;indent block
    sendinput, % VS.cindent[1]
    return


VS.EndOfFile: