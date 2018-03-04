IN := {}
IN["name"] := "IntelliJ v2017.3.2"
IN[prog] := idea64.exe
IN[clas] := SunAwtFrame

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; unique action list
_INAction( Menu, Sleep, Key ) {
    ;;MsgBox, %Menu%, %Sleep%, %Key%
    SendInput, %Menu%

    WinWaitActive, % "ahk_class SunAwtDialog ahk_exe " . IN[prog]
    Sleep %Sleep%
    SendInput, {delete}%Key%
    WinWaitClose,  % "ahk_class SunAwtDialog ahk_exe " . IN[prog]
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
IN.plist                := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}Manage Projects.." )       ,"Project.Listup"]
IN.pexit                := [Func( "_ASAction" ).Bind( "^+a", 500, "Close Project")                   ,"Project.Close"]
IN.pset                 := ["^!s"                                                                 ,"Program.Settings"]
IN.pkey                 := [Func( "_ASAction" ).Bind( "^!s", 1200, "{text}Keymap" )   ,"Program.Key.Shortcut.Setting"]
IN.pconf                := ["^!+s"                                                           ,"Project.Configuration"]
IN.psync                := ["^!y"                                                            ,"Project.Database.Sync"]


;;;;;;;; file
IN.fo                   := ["^+n"                                                                        ,"File.Open"]
IN.fr                   := ["^!y"                                                              ,"File.Reload.or.Sync"]
IN.frecent              := ["^e"                                                                  ,"File.Open.Recent"]
IN.fc                   := ["^{F4}"                                                                     ,"File.Close"]
IN.fca                  := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}Close All Editor Close" )  ,"File.All.Close"]
IN.fsa                  := ["^s"                                                                     ,"File.All.Save"]
IN.fencode              := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}file encoding" )    ,"File.Open.as.Encoding"]
IN.fchange              := [Func( "_ASAction" ).Bind( "^+a", 500, "show history")                ,"File.Changes.Show"]


;;;;;;;; symbol search
IN.sfind                := ["^+f"                                                     ,"Symbol.String.Find.inProject"]
IN.sreplace             := ["^+r"                                                  ,"Symbol.String.Replace.inProject"]
IN.sref                 := ["!{F7}"                                                              ,"Symbol.Usage.Find"]
IN.slistgl              := ["^!+n"                                                           ,"Symbol.List.inProject"]
IN.slistlo              := ["^{F12}"                                                            ,"Symbol.List.inFile"]
IN.ssearch              := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}Search Everywhere")     ,"Symbol.Search.All"]
IN.srename              := ["+{F6}"                                                          ,"Symbol.Rename.Smartly"]
IN.sover                := ["^!b"                                                      ,"Symbol.List.Override.Method"]
IN.ssample              := ["!{F8}"                                                 ,"Symbol.Samplecode.Search.inWEB"]

IN.spre                 := ["^+i"                                                        ,"Symbol.Definition.Preview"]
IN.sjump                := ["^b"                                                            ,"Symbol.Definition.Jump"]
IN.stype                := ["^+b"                                                                 ,"Symbol.Type.Jump"]
IN.shelp                := ["+{F1}"                                                             ,"Symbol.Manual.Open"]
IN.shighlight           := ["^+{F7}"                                                              ,"Symbol.Highlight"]

IN.sbook                := ["+{F11}"                                                        ,"Symbol.Bookmark.Manage"]
IN.sb                   := ["{F11}"                                                         ,"Symbol.Bookmark.Toggle"]


;;;;;;;; coding
IN.cc                   := ["^{space}"                                                  ,"Coding.Symbol.AutoComplete"]
IN.cp                   := ["^{space}"                                               ,"Coding.Parameter.AutoComplete"]
IN.ci                   := ["^!o"                                                       ,"Coding,Import.AutoComplete"]
IN.ct                   := ["!{enter}"                              ,"Coding.Override.Implement.Constructor.Generate"]
IN.cfix                 := ["!{enter}"                                                        ,"Coding.Error.AutoFix"]
IN.cerr                 := ["^{F1}"                                                               ,"Coding.Error.Tip"]
IN.cfo                  := ["^+="                                                                    ,"Coding.UnFold"]
IN.cfc                  := ["^+-"                                                                      ,"Coding.Fold"]
IN.ceval                := ["!{F8}"                                                     ,"Coding.Expression.Evaluate"]
IN.cindent              := ["^!i"                                                              ,"Coding.Indent.Block"]
IN.cformat              := ["^!l"                                                               ,"Coding.Indent.File"]


;;;;;;;; build
IN.bb                   := ["^+{F9}"                 ,                                                 "Build.Module"]
IN.bp                   := ["^{F9}"                                                                  ,"Build.Project"]
IN.brun                 := ["sendinput, ^+{f9} `n sleep, 500 `n sendinput, ^+{f10} "                 ,"Build.and.Run"]
IN.bre                  := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}ReBuild Project")    ,"Build.Agagin.reBuild"]
IN.bc                   := [Func( "_ASAction" ).Bind( "^+a", 500, "Clean Project" )                   ," Build.Clean"]
IN.bd                   := ["+{F9}"                                                          ,"Build.and.Start.Debug"]


;;;;;;;; vcs
IN.vhis                 := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}Show History")                ,"VCS.History"]
IN.vlog                 := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}show Git repository Log...")      ,"VCS.Log"]
IN.vs                   := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}Show Local Changes")           ,"VCS.Status"]
IN.vc                   := ["^k"                                                                        ,"VCS.Commit"]
IN.va                   := ["^!a"                                                                          ,"VCS.Add"]
IN.vpush                := ["^+k"                                                                         ,"VCS.Push"]
IN.vpull                := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}Pull...")                        ,"VCS.Pull"]


;;;;;;;; windows
IN.wfull                := ["^+{F12}"                                                     ,"Window.FullScreen.Toggle"]
IN.wlist                := [Func( "_ASAction" ).Bind( "^+a", 500, "{text}Tool Windows")                ,"Window.List"]
IN.wedit                := ["{ESC}"                                                           ,"Window.Backto.Editor"]
IN.wdir                 := ["!1"                                                             ,"Window.Directory.View"]
IN.wlayout              := ["!7"                                                              ,"Window.Symbol.Layout"]
IN.whier                := ["^h"                                                            ,"Window.Class.Hierarchy"]
IN.wcall                := ["^!h"                                                                ,"Window.Call.Graph"]
IN.wmsg                 := ["!1"                                                              ,"Window.Build.Message"]
IN.wlog                 := ["!6"                                                        ,"Window.Runtime.Log.Message"]
IN.wdebug               := ["!5"                                                                 ,"Window.Debug.View"]
IN.wplug                := [Func( "_ASAction" ).Bind( "^+a", 500, "Plugins")                 ,"Window.Plugin.Manager"]


;;;;;;;; tool
IN.tpath                := [Func( "_OSRunTool" ).Bind("^+c", "copy")                  ,"Tool.FullPath.Copy, NEED2MAP"]
IN.tex                  := [Func( "_OSRunTool" ).Bind("^+c", "explorer")                      ,"Tool.Explorer.Launch"]
IN.tt                   := IN.tex
IN.tcmd                 := [Func( "_OSRunTool" ).Bind("^+c", "cmd")                     ,"Tool.CommandLine.Interface"]
IN.tedit                := [Func( "_OSRunTool" ).Bind("^+c", "notepad++")             ,"Tool.OpenWith.ExternalEditor"]



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
   Hotkey, $!Right      ,IN.MoveNextPostion             ;;^!Right
   Hotkey, $!Left       ,IN.MovePrevPosition            ;;^!Left
   Hotkey, $!+Up        ,IN.PreviewDefinition           ;;^+i
   Hotkey, $!+Down      ,IN.JumpToDefinition            ;;^b
   Hotkey, $!+Right     ,IN.JumpToOverrideMethod        ;;^!b
;;;Hotkey, $^tab        ,IN.NextFileorTab               ;;^tab
;;;Hotkey, $^+tab       ,IN.PrevFileorTab               ;;^+tab
   Hotkey, $^w          ,IN.CloseCurrentFile            ;;^{F4}
   Hotkey, $^+t         ,IN.ReopenRecentFileorTab       ;;^e
;;;Hotkey, $^g          ,IN.JumpToLine                  ;;^g
   Hotkey, $^\          ,IN.JumpToMatchingBrace         ;;^+m
;;;Hotkey, $^F3         ,IN.FindWordAtCurrentPosition   ;;^F3


   Hotkey, $^y          ,IN.Redo                        ;;^+z
;;;Hotkey, $^d          ,IN.DuplicateCurrentLine        ;;^d
   Hotkey, $^+d         ,IN.DeleteCurrentLine           ;;^y
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
    MsgBox, A_Hotkey asdfasdf
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
    sendinput, % IN.cindent[1]
    return


IN.EndOfFile: