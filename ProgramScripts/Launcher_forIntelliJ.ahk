IJ := Map()
IJ["name"] := "IntelliJ v2018.3.2"
IJ["prog"] := "idea64.exe"
IJ["clas"] := "SunAwtFrame"
IJ["file"] := "IntelliJ"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; unique action list
_INAction(Menu, DelayMs, Key) {
    ;MsgBox(Menu, DelayMs, Key)
    static InitialDelay := 2000
    SendInput(Menu)

    WinWaitActive("ahk_class SunAwtFrame ahk_exe " . IJ["prog"])
    InitialDelay += DelayMs

    Sleep(InitialDelay)
    InitialDelay := 0
    SendInput("{delete}" Key)
    ;;Sleep(100)
    ;;SendInput("{enter}")
    WinWaitClose("ahk_class SunAwtFrame ahk_exe " . IJ["prog"])
}


_INSync(*) {
    ;;reload current file
    SendInput("^!y")
    ;;sync gradle build output
    _INAction("^+a", 500, "{text}Sync Project with Gradle Files")
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; basic rule of shortcuts
;;;; length of abbreviation should be under 2~5 char.
;;;; basic sequence of chars (object - action - target) or (object - sub object)
;;;; count functionality ends with ~c (means count)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Example
;; Command              := [shortcut key,                                                                       ,TAGs]
;; SI["fa"]             := ["^s"                                                                            ,"hotkey"]
;; SI["fb"]             := ["sendinput, ^s"                                                         ,"single command"]
;; SI["fc"]             := ["sendinput, ^+a `n sleep, 500 `n sendinput, {text}Close All "           ,"multi commands"]
;; SI["fd"]             := [_SIAction.Bind( "^+a", 500, "{text}File Encoding" )                     ,"function call"]


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; abbreviation definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;; program
IJ["pset"]               := ["^!s"                                                                 ,"Program: Settings"]
IJ["pkey"]               := [_INAction.Bind( "^!s", 1200, "{text}Keymap" )            ,"Program: Key.Shortcut.Setting"]
IJ["pc"]                 := ["^+a"                                                           ,"Program: Search.Command"]
IJ["project"]            := [_INAction.Bind( "^+a", 500, "{text}Manage Projects.." ),          "Project: List.Project"]
IJ["pnew"]               := [_INAction.Bind( "!f", 200, "N" ),                                  "Project: New.Project"]
IJ["pexit"]              := [_INAction.Bind( "^+a", 500, "Close Project")                            ,"Project: Close"]
IJ["pconf"]              := ["^!+s"                                                     ,"Project: Build Configuration"]
;;;IJ["psync"]              := ["^!y"                                                            ,"Project: Database.Sync"]
IJ["psync"]              := [_INSync                                                         ,"Project: Database.Sync"]


;;;;;;;; file
IJ["fo"]                 := ["^+n"                                                                   ,"File: List.Open"]
;;;IJ["fr"]                 := ["^!y"                                                              ,"File: Reload.or.Sync"]
IJ["frecent"]            := ["^e"                                                                  ,"File: Open.Recent"]
IJ["fc"]                 := ["^{F4}"                                                                     ,"File: Close"]
IJ["fca"]                := [_INAction.Bind( "^+a", 500, "{text}Close All Editor Close" )         ,"File: All.Close"]
IJ["fsa"]                := ["^s"                                                                     ,"File: All.Save"]
IJ["fencode"]            := [_INAction.Bind( "^+a", 500, "{text}file encoding" )              ,"File: Open.as.Encoding"]
IJ["fchange"]            := [_INAction.Bind( "^+a", 500, "show history")                          ,"File: Changes.Show"]
IJ["fclone"]             := ["{F5}"                                                  ,"File: CloneCopy.Duplicate.Class"]


;;;;;;;; symbol search
IJ["sfind"]              := ["^+f"                                                     ,"Symbol: String.Find.inProject"]
IJ["sreplace"]           := ["^+r"                                                  ,"Symbol: String.Replace.inProject"]
IJ["sref"]               := ["!{F7}"                                                         ,"Symbol: Usage.Reference"]
IJ["sglobal"]            := ["^!+n"                                                           ,"Symbol: List.inProject"]
IJ["slocal"]             := ["^{F12}"                                                            ,"Symbol: List.inFile"]
IJ["ss"]                 := ["sendinput, {shift} `n sendinput, {shift}"                      ,"Symbol: Search.AllPlace"]
IJ["srename"]            := ["+{F6}"                                                          ,"Symbol: Rename.Smartly"]
IJ["simpl"]              := ["^!b"                                                ,"Symbol: List.implementation.Method"]
IJ["ssample"]            := ["!{F8}"                                                 ,"Symbol: Samplecode.Search.inWEB"]

;;;;;;;; symbol function
IJ["spre"]               := ["^+i"                                                  ,"Symbol: Definition.Quick.Preview"]
IJ["sjump"]              := ["^b"                                                            ,"Symbol: Definition.Jump"]
IJ["stype"]              := ["^+b"                                                                 ,"Symbol: Type.Jump"]
IJ["shelp"]              := ["^q"                                                             ,"Symbol: ManualDoc.Open"]
IJ["shelpweb"]           := ["+{F1}"                                                    ,"Symbol: ManualDoc.Open.inWEB"]
;;IJ["shigh"]              := ["^+{F7}"                                                             ,"Symbol: Highlight"]
IJ["shigh"]              := ["^!{F3}"                                                              ,"Symbol: Highlight"]

IJ["sbook"]              := ["+{F11}"                                                        ,"Symbol: Bookmark.Manage"]
IJ["sb"]                 := ["{F11}"                                                         ,"Symbol: Bookmark.Toggle"]


;;;;;;;; code
IJ["cc"]                 := ["^{space}"                                                    ,"Code: Symbol.AutoComplete"]
IJ["cp"]                 := ["^+{space}"                                                ,"Code: Parameter.AutoComplete"]
IJ["ci"]                 := ["^!o"                                                         ,"Code: Import.AutoComplete"]
IJ["cgen"]               := ["!{insert}"                               ,"Code: Override.Implement.Constructor.Generate"]
IJ["cfix"]               := ["!{enter}"                                                          ,"Code: Error.AutoFix"]
IJ["cerr"]               := ["^{F1}"                                                                 ,"Code: Error.Tip"]
IJ["cf"]                 := ["^+="                                                               ,"Code: UnFold,Expand"]
IJ["cfc"]                := ["^+-"                                                                  ,"Code: Fold,Close"]
IJ["ceval"]              := ["!{F8}"                                                       ,"Code: Expression.Evaluate"]
IJ["cindent"]            := ["^!i"                                                                ,"Code: Indent.Block"]
IJ["cformat"]            := ["^!l"                                                                 ,"Code: Indent.File"]


;;;;;;;; build
IJ["build"]              := [_INAction.Bind( "^+a", 500, "gradle")                           ,"Build: List.Cmd.Gradle"]
IJ["bb"]                 := ["^{F9}"                                                                  ,"Build: Project"]
IJ["bt"]                 := ["^+{F9}"                                                          ,"Build: Current.Target"]
IJ["bc"]                 := [_INAction.Bind( "^+a", 500, "Clean Project" )                            ," Build: Clean"]
IJ["br"]                 := [_INAction.Bind( "^+a", 500, "{text}ReBuild Project")               ,"Run: Agagin.reBuild"]
;;;; prerequite: autoscroll to source, autoscroll from source need to checked IJ prject view
IJ["run"]                := ["!+{f10}"                                                             ,"Run: List.Cmd.Run"]
IJ["rr"]                 := ["^+{f10}"                                                         ,"Run: Run.Current.File"]
IJ["rdebug"]             := ["+{F9}"                                                            ,"Run: and.Start.Debug"]


;;;;;;;; vcs
IJ["ver"]                := ["!``"                                                       ,"VCS: Menu.History.Blame.ETC"]
IJ["vlog"]               := [_INAction.Bind( "^+a", 700, "{text}Show VCS Log")                      ,"VCS: log,revert"]
IJ["vs"]                 := [_INAction.Bind( "^+a", 500, "{text}Show Local Changes")                     ,"VCS: Status"]
IJ["vc"]                 := ["^k"                                                                        ,"VCS: Commit"]
IJ["va"]                 := ["^!a"                                                                          ,"VCS: Add"]
IJ["vpush"]              := ["^+k"                                                                   ,"VCS: Push/Amemd"]
IJ["vpull"]              := [_INAction.Bind( "^+a", 500, "{text}Pull git")                                 ,"VCS: Pull"]


;;;;;;;; windows
IJ["window"]             := [_INAction.Bind( "^+a", 500, "{text}Tool Windows")                    ,"Window: List.Menu"]
IJ["wedit"]              := ["{ESC}"                                                           ,"Window: Backto.Editor"]
IJ["wdir"]               := ["!1"                                                             ,"Window: Directory.View"]
IJ["wlayout"]            := ["!7"                                                              ,"Window: Symbol.Layout"]
IJ["whier"]              := ["^h"                                                            ,"Window: Class.Hierarchy"]
IJ["wcall"]              := ["^!h"                                                                ,"Window: Call.Graph"]
IJ["wmsg"]               := ["sendinput, ^+a `n sleep, 500 `n sendinput, Tool Windows `n sleep, 300 `n sendinput, {enter} `n sleep, 200 `n sendinput, {text}build"  ,"Window: Build.Log.Message"]
IJ["wdebug"]             := ["!5"                                                                 ,"Window: Debug.View"]
IJ["wlog"]               := ["!6"                                                  ,"Window: Runtime.Log.Debug.Message"]
IJ["wplug"]              := [_INAction.Bind( "^+a", 500, "Plugins")                          ,"Window: Plugin.Manager"]
IJ["wpresent"]           := [_INAction.Bind( "^+a", 500, "{text}Presentation Mode")            ,"Window: FullScreen.Present"]
IJ["wfull"]              := ["^+{F12}"                                                     ,"Window: FullScreen.Toggle"]


;;;;;;;; tool
IJ["tpath"]              := [_OSRunTool.Bind("^+c", "copy")                                     ,"Tool: FullPath.Copy"]
IJ["tex"]                := [_OSRunTool.Bind("^+c", "explorer")                               ,"Tool: Explorer.Launch"]
IJ["tt"]                 := IJ["tex"]
IJ["tcmd"]               := [_OSRunTool.Bind("^+c", "cmd")                              ,"Tool: CommandLine.Interface"]
IJ["tshell"]             := [_OSRunTool.Bind("^+c", "shell")                             ,"Tool: ExtraShell.Interface"]
IJ["tedit"]              := [_OSRunTool.Bind("^+c", "editor")                         ,"Tool: OpenWith.ExternalEditor"]
IJ["tbrowser"]           := [_INAction.Bind( "^+a", 500, "{text}Device File Explorer"), "Tool: TargetDevice.File.Explorer"]


;;;;;;;; windows
;;;; font size up/down should mapped with shortcut : ctrl + mouse up/down


;;;;;;;; debug
;;;; debug usually enough convenient or F-Key easily overlapped to other useful functionality
;;;; therefore not mapped
;; run                  ;;{F9}
;; stop                 ;;^{F2}
;; step over            ;;{F8}
;; step IJ              ;;{F7}
;; step out             ;;+{F8}
;; go till here         ;;!{F9}
;; toogle break         ;;^{F8}
;; break option         ;;^+{F8}



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; shortcut keymap definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; apply both of Intellij and AndroidStudio
;HotIfWinActive("ahk_exe idea64.exe")
HotIfWinActive("ahk_class SunAwtFrame")
;;;; move, edit functionality must be defined IJ shortcut not abbreviation for convenience
;;;Hotkey("xxxxxxx"      ,Action to do (remapped here))   ;;Orinal Key assigned to each editor
;;;;;;;; move
Hotkey("$!Right",         IN_MoveNextPostion)             ;;^!Right
Hotkey("$!Left",          IN_MovePrevPosition)            ;;^!Left
Hotkey("$!+Up",           IN_PreviewDefinition)           ;;^+i
Hotkey("$!+Down",         IN_JumpToDefinition)            ;;^b
Hotkey("$!+Right",        IN_JumpToOverrideMethod)        ;;^!b
;;;Hotkey("$^tab"        ,IN_NextFileorTab)               ;;^tab
;;;Hotkey("$^+tab"       ,IN_PrevFileorTab)               ;;^+tab
Hotkey("$^+o",             IN_OpenAllSymbol)               ;;^+!n
Hotkey("$^w",              IN_CloseCurrentFile)            ;;^{F4}
Hotkey("$^+t",             IN_ReopenRecentFileorTab)       ;;^e
;;;Hotkey("$^g"          ,IN_JumpToLine)                  ;;^g
Hotkey("$^\",              IN_JumpToMatchingBrace)         ;;^+m
Hotkey("$+Space",          IN_JumpOutOfMatchingBrace)      ;;
;;;Hotkey("$!+Left"      ,IN_FindWordAtCurrentPos)        ;;^F3
;;;Hotkey("$!Down"       ,IN_FindWordAtCurrentPosDown)    ;;F3
;;;Hotkey("$!Up"         ,IN_FindWordAtCurrentPosUp)      ;;+F3


Hotkey("$^y",              IN_Redo)                        ;;^+z
Hotkey("$^+d",             IN_DeleteCurrentLine)           ;;^y
Hotkey("$^d",              IN_DuplicateCurrentLine)        ;;^d
;;;Hotkey("$^/"          ,IN_CommentWithLineComment)      ;;^/
;;;Hotkey("$^+/"         ,IN_CommentWithBlockComment)     ;;^+/
;;;Hotkey("$^+u"         ,IN_ToggleUpperOrLowerCase)      ;;^+u
;;;Hotkey("$^+i"         ,IN_IndentBlock)                 ;;^!i

;;;;;;;;
HotIfWinActive()
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;; move
IN_MoveNextPostion(*) {          ;;!Right::    ;;move next position
    SendInput("^!{Right}")
}

IN_MovePrevPosition(*) {         ;;!Left::     ;;move previous position
    SendInput("^!{Left}")
}

IN_PreviewDefinition(*) {        ;;!+Up::      ;;preview definition & type
    SendInput(IJ["spre"][1])
}

IN_JumpToDefinition(*) {         ;;!+Down::    ;;jump to definition
    SendInput("^b")
}

IN_JumpToOverrideMethod(*) {     ;;!+Right::   ;;jump to Override Method
    SendInput(IJ["simpl"][1])
}

IN_NextFileorTab(*) {            ;;^tab::      ;;next file or tab
    SendInput("^{tab}")
}

IN_PrevFileorTab(*) {            ;;^+tab::     ;;previous file or tab
    SendInput("^+{tab}")
}

IN_OpenAllSymbol(*) {            ;;^+!o:         ;;close current file
    SendInput("{shift}")
    SendInput("{shift}")
}

IN_CloseCurrentFile(*) {         ;;^w:         ;;close current file
    SendInput(IJ["fc"][1])
}

IN_ReopenRecentFileorTab(*) {    ;;^+t:        ;;reopen recent closed tab or file
;;  MsgBox(A_Hotkey)
    SendInput(IJ["frecent"][1])
}

IN_JumpToLine(*) {               ;;^g::        ;;goto line
    SendInput("^g")
}

IN_JumpToMatchingBrace(*) {      ;;^\::        ;;goto matching brace toggle
    SendInput("^+m")
}

IN_JumpOutOfMatchingBrace(*) {   ;;+ ::        ;;goto matching brace toggle
    SendInput("{Right}")
}

IN_FindWordAtCurrentPos(*) {    ;;^F3::        ;;set word as finding-word at current cursor
    SendInput("^{F3}")
}

IN_FindWordAtCurrentPosDown(*) { ;;F3::         ;;find word at current cursor
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

IN_FindWordAtCurrentPosUp(*) {   ;;+F3::       ;;find word at current cursor
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
IN_Redo(*) {                     ;;^y::        ;;redo
    SendInput("^+z")
}

IN_DuplicateCurrentLine(*) {     ;;^d::        ;;duplicate line
    SendInput("^d")
}

IN_DeleteCurrentLine(*) {        ;;^+d::       ;;delete line
    SendInput("^y")
}

IN_CommentWithLineComment(*) {   ;;^/::        ;;comment with line-comment
    SendInput("^/")
}

IN_CommentWithBlockComment(*) {  ;;^+/::       ;;comment with block-comment
    SendInput("^+/")
}

IN_ToggleUpperOrLowerCase(*) {   ;;^+u::       ;;toggle upper or lower case
    SendInput("^+u")
}

IN_IndentBlock(*) {              ;;^!i::       ;;indent block
    SendInput(IJ["cindent"][1])
}