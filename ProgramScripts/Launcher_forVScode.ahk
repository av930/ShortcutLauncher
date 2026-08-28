VS := Map()
VS["name"] := "VScode v1.70"
VS["prog"] := "Code.exe"
VS["clas"] := "Chrome_WidgetWin_1"
VS["file"] := "VScode"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; unique action list
_VSAction(Menu, Sleep, Key) {
    ;MsgBox(Menu, Sleep, Key)
    static InitialDelay := 50 ;;popup delay
    SendInput(Menu)

    WinWaitActive("ahk_class Chrome_WidgetWin_1 ahk_exe " . VS["prog"])
    InitialDelay += Sleep

    Sleep(InitialDelay)
    InitialDelay := 0
    SendInput("{delete}" Key)
    Sleep(50)
    ;;SendInput("{enter}")
    WinWaitClose("ahk_class Chrome_WidgetWin_1 ahk_exe " . VS["prog"])
}


_VSSync(*) {
    ;;reload current file
    SendInput("^!y")
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
;; SI["fa"]             := ["^s"                                                                            ,"hotkey"]
;; SI["fb"]             := ["sendinput, ^s"                                                         ,"single command"]
;; SI["fc"]             := ["sendinput, ^+a `n sleep, 100 `n sendinput, {text}Close All "           ,"multi commands"]
;; SI["fd"]             := [_SIAction.Bind( "^+a", 100, "{text}File Encoding" )                     ,"function call"]


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; abbreviation definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;; program
VS["pset"]               := ["^,"                                                                             ,"Program: Settings"]
VS["pkey"]               := ["sendinput, ^k `n sendinput, ^s"                                     ,"Program: Key.Shortcut.Setting"]
VS["pc"]                 := ["^+p"                                                                      ,"Program: Search.Command"]
VS["project"]            := ["^r"                                                       ,"Project: List.Project(Workspace/Folder)"]
VS["pnew"]               := [_VSAction.Bind( "^+p", 100, "{text}add Folder to Workspace" ),               "Project: New.Project"]
VS["pexit"]              := [_VSAction.Bind( "^+p", 100, "{text}close Workspace" ),           "Project(Workspace/Folder): Close"]
VS["pconf"]              := ["^+d"                                                                   ,"Project: Run Configuration"]
VS["preload"]            := [_VSAction.Bind( "^+p", 100, "{text}Reload Window" ),               "Project: Reload Setting(reset)"]
;;;VS["psync"]              := ["^!y"                                                                    ,"Project: Database.Sync"]


;;;;;;;; file
VS["fo"]                 := ["^p"                                                                               ,"File: List.Open"]
;;;VS["fr"]                 := ["^!y"                                                                      ,"File: Reload.or.Sync"]
VS["frecent"]            := ["^p"                                                                             ,"File: Open.Recent"]
VS["fc"]                 := ["^w"                                                                                   ,"File: Close"]
VS["fca"]                := ["sendinput, ^k `n sendinput, ^w"                                                   ,"File: All.Close"]
VS["fsa"]                := [_VSAction.Bind( "^+a", 100, "{text}File: All.Save")                                 ,"File: All.Save"]
VS["fencode"]            := [_VSAction.Bind( "^+p", 100, "{text}Change File Encoding" )                  ,"File: Open.as.Encoding"]
VS["fchange"]            := [_VSAction.Bind( "^+p", 100, "{text}Open All change")                          ,"File: Changes.Show"]
VS["fclone"]             := ["^+s"                                                             ,"File: CloneCopy.SaveAs.Duplicate"]


;;;;;;;; symbol search
VS["sfind"]              := ["^+f"                                                                ,"Symbol: String.Find.inProject"]
VS["sreplace"]           := ["^+h"                                                             ,"Symbol: String.Replace.inProject"]
VS["sref"]               := ["+!{F12}"                                                        ,"Symbol: Usage.Reference.inProject"]
VS["sglobal"]            := ["^t"                                                                        ,"Symbol: List.inProject"]
VS["slocal"]             := ["^+o"                                                                          ,"Symbol: List.inFile"]
VS["srename"]            := ["{F2}"                                                                      ,"Symbol: Rename.Smartly"]
VS["ssample"]            := ["SoundPlay *-1"                                                    ,"Symbol: Samplecode.Search.inWEB"]

;;;;;;;; symbol function
VS["spre"]               := ["{F12}"                                                           ,"Symbol: Definition.Quick.Preview"]
VS["sjump"]              := ["{F12}"                                                                    ,"Symbol: Definition.Jump"]
VS["stype"]              := ["^+b"                                                                            ,"Symbol: Type.Jump"]
VS["shelp"]              := ["^q"                                                                        ,"Symbol: ManualDoc.Open"]
VS["shelpweb"]           := ["+{F1}"                                                               ,"Symbol: ManualDoc.Open.inWEB"]
;;;VS["shigh"]              := ["^+{F7}"                                                                        ,"Symbol: Highlight"]
VS["shigh"]              := ["^!{F3}"                                                                         ,"Symbol: Highlight"]

VS["sbook"]              := ["+{F11}"                                                                   ,"Symbol: Bookmark.Manage"]
VS["sb"]                 := ["{F11}"                                                                    ,"Symbol: Bookmark.Toggle"]


;;;;;;;; code
VS["cc"]                 := ["^{space}"                                                               ,"Code: Symbol.AutoComplete"]
VS["cp"]                 := ["^+{space}"                                                           ,"Code: Parameter.AutoComplete"]
VS["ci"]                 := ["^!o"                                                                    ,"Code: Import.AutoComplete"]
VS["cgen"]               := ["!{insert}"                                          ,"Code: Override.Implement.Constructor.Generate"]
VS["cfix"]               := ["^.}"                                                                     ,"Code: Error.AutoFix"]
VS["cerr"]               := ["^{F1}"                                                                            ,"Code: Error.Tip"]
VS["cf"]                 := ["^+="                                                                          ,"Code: UnFold,Expand"]
VS["cfc"]                := ["^+-"                                                                             ,"Code: Fold,Close"]
VS["ceval"]              := ["!{F8}"                                                                  ,"Code: Expression.Evaluate"]
VS["cindent"]            := ["^!i"                                                                           ,"Code: Indent.Block"]
VS["cformat"]            := ["^!l"                                                                            ,"Code: Indent.File"]


;;;;;;;; build
VS["build"]              := [_VSAction.Bind( "^+a", 100, "gradle")                                    ,"Build: List.Cmd.Gradle"]
VS["bb"]                 := ["^{F9}"                                                                             ,"Build: Project"]
VS["bt"]                 := ["^+{F9}"                                                                     ,"Build: Current.Target"]
VS["bc"]                 := [_VSAction.Bind( "^+a", 100, "Clean Project" )                                     ," Build: Clean"]
VS["br"]                 := [_VSAction.Bind( "^+a", 100, "{text}ReBuild Project")                          ,"Run: Again.reBuild"]
;;;; prerequite: autoscroll to source, autoscroll from source need to checked in prject view
VS["run"]                := ["^{f5}"                                                                          ,"Run: List.Cmd.Run"]
VS["rr"]                 := [_VSAction.Bind( "^+p", 50, "Run Python File in Terminal{enter}")          ,"Run: Run.Current.File"]
VS["rdebug"]             := ["^{F5}"                                                                       ,"Run: and.Start.Debug"]


;;;;;;;; vcs
VS["ver"]                := ["!``"                                                            ,      "VCS: Menu.History.Blame.ETC"]
VS["vlog"]               := [_VSAction.Bind( "^+a", 700, "{text}Show VCS Log")                               ,"VCS: log,revert"]
VS["vs"]                 := [_VSAction.Bind( "^+a", 100, "{text}Show Local Changes")                             ,"VCS: Status"]
VS["vc"]                 := ["^k"                                                                                   ,"VCS: Commit"]
VS["va"]                 := ["^!a"                                                                                     ,"VCS: Add"]
VS["vpush"]              := ["^+k"                                                                              ,"VCS: Push/Amemd"]
VS["vpull"]              := [_VSAction.Bind( "^+a", 100, "{text}Pull git")                                         ,"VCS: Pull"]


;;;;;;;; layout
VS["lhori"]              := ["^k^\"                                                                       ,"layout: Horizen.Split"]
VS["lveti"]              := ["^\"                                                                        ,"layout: Vertical.Split"]


;;;;;;;; windows
VS["window"]             := [_VSAction.Bind( "^+a", 100, "{text}Tool Windows")                             ,"Window: List.Menu"]
VS["wedit"]              := ["{ESC}"                                                                      ,"Window: Backto.Editor"]
VS["wdir"]               := ["!1"                                                                        ,"Window: Directory.View"]
VS["wsymbol"]            := ["!7"                                                                         ,"Window: Symbol.Layout"]
VS["whier"]              := ["^h"                                                                       ,"Window: Class.Hierarchy"]
VS["wcall"]              := ["^!h"                                                                           ,"Window: Call.Graph"]
VS["wmsg"]               := ["sendinput, ^+a `n sleep, 100 `n sendinput, Tool Windows `n sleep, 300 `n sendinput, {enter} `n sleep, 200 `n sendinput, {text}build"  ,"Window: Build.Log.Message"]
VS["wdebug"]             := ["!5"                                                                            ,"Window: Debug.View"]
VS["wlog"]               := ["!6"                                                             ,"Window: Runtime.Log.Debug.Message"]
VS["wplug"]              := [_VSAction.Bind( "^+p", 100, "Extensions: Show Installed Extensions{enter}")     ,"Window: Plugin.Extension,Manager"]
VS["wfull"]              := [_VSAction.Bind( "^+p", 100, "Toggle Maximized Panel{enter}")           ,"Window: FullScreen.Toggle"]



;;;;;;;; tool
VS["tpath"]              := ["+!c"                                                                          ,"Tool: FullPath.Copy"]
VS["tt"]                 := [_VSAction.Bind( "^+p", 100, "Reveal in File Explorer {enter}")             ,"Tool: Explorer.Launch"]
VS["tcmd"]               := [_OSRunTool.Bind("+!c", "cmd")                                        ,"Tool: CommandLine.Interface"]
VS["tshell"]             := [_OSRunTool.Bind("+!c", "shell")                                       ,"Tool: ExtraShell.Interface"]
VS["tterm"]              := ["^+``"                                                                    ,"Tool: Terminal.Window.go"]
VS["tedit"]              := [_OSRunTool.Bind("+!c", "editor")                                   ,"Tool: OpenWith.ExternalEditor"]
VS["mark"]               := ["^+v"                                                                        ,"Tool: Viewer.Markdown"]
VS["chat"]               := ["^!i"                                                                                 ,"Tool: ChatAI"]
VS["chatextra"]          := [_VSAction.Bind( "^+p", 100, "Chat: New chat window{enter}")              ,"Tool: ChatAI.extraWindow"]
VS["chatclear"]          := [_VSAction.Bind( "^+p", 100, "Chat: Delete All Local Workspace Chat Sessions{enter}")  ,"Tool: ChatAI.deleteclear.AllHistory"]
VS["chatexport"]         := [_VSAction.Bind( "^+p", 100, "Chat: Export Chat...{enter}")               ,"Tool: ChatAI.exportLog"]



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
HotIfWinActive("ahk_exe Code.exe")
;;HotIfWinActive("ahk_class Chrome_WidgetWin_1 || ahk_exe Code.exe")

;;;; move, edit functionality must be defined in shortcut not abbreviation for convenience
;;;Hotkey("xxxxxxx"      ,Action to do (remapped here))   ;;Orinal Key assigned to each editor
;;;;;;;; move
;;;   Hotkey("$!Right"      ,VS_MoveNextCurPosition)
;;;   Hotkey("$!Left"       ,VS_MovePrevCurPosition)
Hotkey("$^!Right",         VS_MoveNextModiPosition)        ;;^!Right
Hotkey("$^!Left",          VS_MovePrevModiPosition)        ;;^!Left

Hotkey("$!+Up",            VS_PreviewDefinition)           ;;^+i
Hotkey("$!+Down",          VS_JumpToDefinition)            ;;^b
;;;Hotkey("$!+Right"     ,VS_JumpToOverrideMethod)        ;;^!b
;;;Hotkey("$^tab"        ,VS_NextFileorTab)               ;;^tab
;;;Hotkey("$^+tab"       ,VS_PrevFileorTab)               ;;^+tab
Hotkey("$^+o",             VS_OpenAllSymbol)               ;;^+!n
Hotkey("$^w",              VS_CloseCurrentFile)            ;;^{F4}
Hotkey("$^+t",             VS_ReopenRecentFileorTab)       ;;^e
;;;Hotkey("$^g"          ,VS_JumpToLine)                  ;;^g
;;;Hotkey("$^\"          ,VS_JumpToMatchingBrace)         ;;^+m
Hotkey("$+Space",          VS_JumpOutOfMatchingBrace)      ;;
;;;Hotkey("$!+Left"      ,VS_FindWordAtCurrentPos)        ;;^F3
;;;Hotkey("$!Down"       ,VS_FindWordAtCurrentPosDown)    ;;F3
;;;Hotkey("$!Up"         ,VS_FindWordAtCurrentPosUp)      ;;+F3


Hotkey("$^y",              VS_Redo)                        ;;^+z
Hotkey("$^+d",             VS_DeleteCurrentLine)           ;;^y
Hotkey("$^d",              VS_DuplicateCurrentLine)        ;;^d
Hotkey("$^/",              VS_CommentWithLineComment)      ;;^/
Hotkey("$^+/",             VS_CommentWithBlockComment)     ;;^+/
;;;Hotkey("$^+u"         ,VS_ToggleUpperOrLowerCase)      ;;^+u
;;;Hotkey("$^+i"         ,VS_IndentBlock)                 ;;^!i

;;;;;;;;
HotIfWinActive()
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;; move
VS_MoveNextModiPosition(*) {          ;;!Right::    ;;move next position
    SendInput("{F1}")
    SendInput("{text}Go Forward in Edit Locations{enter}")
    ;;;#SendInput("^!{Right}")
}

VS_MovePrevModiPosition(*) {         ;;!Left::     ;;move previous position
    SendInput("{F1}")
    SendInput("{text}Go Back in Edit Locations{enter}")
    ;;;#SendInput("^!{Left}")
}

VS_PreviewDefinition(*) {        ;;!+Up::      ;;preview definition & type
    SendInput(VS["spre"][1])
}

VS_JumpToDefinition(*) {         ;;!+Down::    ;;jump to definition
    SendInput("^b")
}

VS_JumpToOverrideMethod(*) {     ;;!+Right::   ;;jump to Override Method
    SendInput(VS["simpl"][1])
}

VS_NextFileorTab(*) {            ;;^tab::      ;;next file or tab
    SendInput("^{tab}")
}

VS_PrevFileorTab(*) {            ;;^+tab::     ;;previous file or tab
    SendInput("^+{tab}")
}

VS_OpenAllSymbol(*) {            ;;^+!o:         ;;close current file
    SendInput("{shift}")
    SendInput("{shift}")
}

VS_CloseCurrentFile(*) {         ;;^w:         ;;close current file
    SendInput(VS["fc"][1])
}

VS_ReopenRecentFileorTab(*) {    ;;^+t:        ;;reopen recent closed tab or file
;;  MsgBox(A_Hotkey)
    SendInput(VS["frecent"][1])
}

VS_JumpToLine(*) {               ;;^g::        ;;goto line
    SendInput("^g")
}

VS_JumpToMatchingBrace(*) {      ;;^\::        ;;goto matching brace toggle
    SendInput("^+m")
}

VS_JumpOutOfMatchingBrace(*) {   ;;+ ::        ;;goto matching brace toggle
    SendInput("{Right}")
}

VS_FindWordAtCurrentPos(*) {    ;;^F3::        ;;set word as finding-word at current cursor
    SendInput("^{F3}")
}

VS_FindWordAtCurrentPosDown(*) { ;;F3::         ;;find word at current cursor
    SendInput("{F3}")
}
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

VS_FindWordAtCurrentPosUp(*) {   ;;+F3::       ;;find word at current cursor
    SendInput("+{F3}")
}
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
VS_Redo(*) {                     ;;^y::        ;;redo
    SendInput("^+z")
}

VS_DuplicateCurrentLine(*) {     ;;^d::        ;;duplicate line
    SendInput("+!{Down}")
}

VS_DeleteCurrentLine(*) {        ;;^+d::       ;;delete line
    SendInput("^y")
}

VS_CommentWithLineComment(*) {   ;;^/::        ;;comment with line-comment
;;  MsgBox(A_Hotkey)
    SendInput("^/")
}

VS_CommentWithBlockComment(*) {  ;;^+/::       ;;comment with block-comment
    SendInput("^+/")
}

VS_ToggleUpperOrLowerCase(*) {   ;;^+u::       ;;toggle upper or lower case
    SendInput("^+u")
}

VS_IndentBlock(*) {              ;;^!i::       ;;indent block
    SendInput(VS["cindent"][1])
}