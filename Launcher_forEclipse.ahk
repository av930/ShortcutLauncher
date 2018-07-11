EC := {}
EC["name"] := "Eclipse Photon"
EC[prog] := eclipse.exe
EC[clas] := SWT_Window0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; unique action list
_ECAction( Menu, Sub, Sleep, Key ) {
    ;;MsgBox, %Menu%, %Sleep%, %Key%
    SendInput, %Menu%
    SendInput, %Sub%    
    Sleep %Sleep%
    SendInput, %Key%
    SendInput, {enter}
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; basic rule of shortcuts
;;;; length of abbreviation should be under 2~5 char.
;;;; basic sequence of chars (object - action - target) or (object - sub object)
;;;; count functionality ends with ~c (means count)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Example
;; SI.fa                := ["^s"                                                                                 ,"hotkey"]
;; SI.fb                := ["sendinput, ^s"                                                              ,"single command"]
;; SI.fc                := ["sendinput, ^+a `n sleep, 500 `n sendinput, {text}Close All "                ,"multi commands"]
;; SI.fd                := [Func( "_SIAction" ).Bind( "^+a", 500, "{text}File Encoding" )                 ,"function call"]


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; abbreviation definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;; program
EC.pexit                := ["sendinput, !f `n sleep, 300 `n sendinput, x"                                 ,"Project:Close"]
EC.pset                 := ["sendinput, !w `n sleep, 300 `n sendinput, p"                              ,"Program:Settings"]
EC.pkey                 := [Func( "_ECAction" ).Bind( "{F12}", "^3", 100, "Keys - General" ) ,"Program:Key.Shortcut.Setting"]
EC.pconf                := [Func( "_ECAction" ).Bind( "!p", "p", 300, "Java build path" )         ,"Project:Configuration"]
EC.psync                := ["F5"                                                                  ,"Project:Database.Sync"]


;;;;;;;; file
EC.fo                   := ["^+r"                                                                   ,"File:Open.inProject"]
EC.fr                   := ["F5"                                                                    ,"File:Reload.or.Sync"]
EC.frecent              := ["sendinput, !f `n sleep, 300 `n sendinput, {down}{down}{down}{Right}"      ,"File:Open.Recent"]
EC.fc                   := ["^w"                                                                             ,"File:Close"]
EC.fca                  := ["^+w"                                                                        ,"File:All.Close"]
EC.fsa                  := ["^+s"                                                                         ,"File:All.Save"]
EC.fencode              := ["sendinput, !e `n sleep, 300 `n sendinput, g"                         ,"File:Open.as.Encoding"]
EC.fchange              := ["sendinput, {F12} `n sendinput, +{F10} `n sendinput, e `n sendinput, h"   ,"File:Changes.Show"]


;;;;;;;; symbol search
EC.sfind                := ["^!g"                                                          ,"Symbol:String.Find.inProject"]
EC.sreplace             := ["sendinput, !a `n sleep, 300 `n sendinput, f"                  ,"Symbol:String.Replace.inFile"]
EC.sref                 := ["^+g"                                                                     ,"Symbol:Usage.Find"]
EC.slistg               := ["^+t"                                                                 ,"Symbol:List.inProject"]
EC.slistl               := ["^o"                                                                     ,"Symbol:List.inFile"]
EC.srename              := ["!+r"                                                                 ,"Symbol:Rename.Smartly"]
EC.sover                := ["SoundPlay *-1"                                                 ,"Symbol:List.Override.Method"]


;;;;;;;; symbol function                                                             
EC.spre                 := ["sendinput, !+q `n sleep, 300 `n sendinput, d"                    ,"Symbol:Definition.Preview"]
EC.sjump                := ["F3"                                                                 ,"Symbol:Definition.Jump"]
EC.stype                := ["^+b"                                                                      ,"Symbol:Type.Jump"]
EC.shelp                := ["{F2}"                                                                   ,"Symbol:Manual.Open"]
EC.shigh                := ["!+o"                                                                      ,"Symbol:Highlight"]                                                                                     
EC.sbook                := ["sendinput, !e `n sleep, 300 `n sendinput, k"                           ,"Symbol:Bookmark.add"]


;;;;;;;; coding                                                                      
EC.cc                   := ["^{space}"                                                       ,"Coding:Symbol.AutoComplete"]
EC.ci                   := ["^+o"                                                            ,"Coding:Import.AutoComplete"]
EC.ct                   := ["sendinput, !s `n sleep, 300 `n sendinput, v"            ,"Coding:Override.Implement.Generate"]
EC.cfix                 := ["^1"                                                                   ,"Coding:Error.AutoFix"]
EC.cerr                 := ["{F2}"                                                                     ,"Coding:Error.Tip"]
EC.cfo                  := ["^{NumpadDiv}"                                                                ,"Coding:UnFold"]
EC.cfc                  := ["^{NumpadDiv}"                                                                  ,"Coding:Fold"]
EC.ceval                := ["^+d"                                                    ,"Coding:Expression.Evaluate.inDebug"]
EC.cindent              := ["^i"                                                                    ,"Coding:Indent.Block"]
EC.cformat              := ["^+f"                                                                    ,"Coding:Indent.File"]


;;;;;;;; build                                                          
EC.bl                   := ["!p"                                                                        ,"Build:List.Menu"]
EC.bb                   := ["^b"                                                                          ,"Build:Project"]
EC.bt                   := ["+{F9}"                                                                ,"Build:Current.Target"]
;;;; prerequite: autoscroll to source, autoscroll from source need to checked in prject view     
EC.brun                 := ["^{f11}"                                                                     ,"Build:Run.only"]
EC.bre                  := ["{F9}"                                                                 ,"Build:Agagin.reBuild"]
EC.bc                   := ["sendinput, !p `n sleep, 300 `n sendinput, n"                                   ,"Build:Clean"]
EC.bd                   := ["{F11}"                                                               ,"Build:and.Start.Debug"]


;;;;;;;; vcs
EC.vhis                 := ["sendinput, {F12} `n sendinput, +{F10} `n sleep, 300 `n sendinput, e"   ,"VCS:Menu.History.Blame.ETC"]
EC.vlog                 := [Func( "_ECAction" ).Bind( "{F12}", "^3", 100, "git reflog" )                        ,"VCS:Log"]
EC.vs                   := [Func( "_ECAction" ).Bind( "{F12}", "^3", 100, "git staging" )                    ,"VCS:Status"]
EC.vc                   := [Func( "_ECAction" ).Bind( "{F12}", "^3", 100, "Commit..." )                      ,"VCS:Commit"]
EC.va                   := [Func( "_ECAction" ).Bind( "{F12}", "^3", 100, "Commit..." )                         ,"VCS:Add"]
EC.vpush                := [Func( "_ECAction" ).Bind( "{F12}", "^3", 100, "Push Branch" )                      ,"VCS:Push"]
EC.vpull                := [Func( "_ECAction" ).Bind( "{F12}", "^3", 100, "Pul..." )                           ,"VCS:Pull"]


;;;;;;;; windows
EC.wfull                := ["^m"                                                               ,"Window:FullScreen.Toggle"]
EC.wlist                := ["sendinput, !+q `n sleep, 300 `n sendinput, q"                                  ,"Window:List"]
EC.wedit                := ["{F12}"                                                                ,"Window:Backto.Editor"]
EC.wdir                 := ["sendinput, !+q `n sleep, 300 `n sendinput, p"                 ,"Window:Directory.PackageView"]
EC.wlayout              := ["^o"                                                            ,"Window:Symbol.Layout.InFile"]
EC.whier                := ["F4"                                                                 ,"Window:Class.Hierarchy"]
EC.wcall                := ["^!h"                                                                     ,"Window:Call.Graph"]
EC.wmsg                 := ["sendinput, !+q `n sleep, 300 `n sendinput, c"                         ,"Window:Build.Message"]
EC.wdebug               := [Func( "_ECAction" ).Bind( "{F12}", "^3", 100, "Debug (Debug)" )           ,"Window:Debug.View"]
EC.wlog                 := [Func( "_ECAction" ).Bind( "{F12}", "^3", 100, "Logcat (Android)" )  ,"Window:Runtime.Log.Message"]
EC.wplug                := ["sendinput, !h `n sleep, 300 `n sendinput, m"                  ,"Window:Plugin.Market.Manager"]


;;;;;;;; tool                                                                               
EC.tpath                := [Func( "_OSRunTool" ).Bind("^!c", "copy")                                 ,"Tool:FullPath.Copy"]
EC.tex                  := [Func( "_OSRunTool" ).Bind("^!c", "explorer")                           ,"Tool:Explorer.Launch"]
EC.tt                   := EC.tex                                                           
EC.tcmd                 := [Func( "_OSRunTool" ).Bind("^!c", "cmd")                          ,"Tool:CommandLine.Interface"]
EC.tedit                := [Func( "_OSRunTool" ).Bind("^!c", "editor")                     ,"Tool:OpenWith.ExternalEditor"]


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
Hotkey, IfWinActive, ahk_class SWT_Window0  
;;;; move, edit functionality must be defined in shortcut not abbreviation for convenience
;;;;;;;; move
;;;Hotkey, $!Right      ,EC.MoveNextPostion             ;;^!Right
;;;Hotkey, $!Left       ,EC.MovePrevPosition            ;;^!Left
   Hotkey, $!+Up        ,EC.PreviewDefinition           ;;^+i
   Hotkey, $!+Down      ,EC.JumpToDefinition            ;;^b
   Hotkey, $!+Right     ,EC.JumpToOverrideMethod        ;;^!b
   Hotkey, $^tab        ,EC.NextFileorTab               ;;^tab
   Hotkey, $^+tab       ,EC.PrevFileorTab               ;;^+tab
;;;Hotkey, $^w          ,EC.CloseCurrentFile            ;;^{F4}
;;;Hotkey, $^+t         ,EC.ReopenRecentFileorTab       ;;^e
   Hotkey, $^g          ,EC.JumpToLine                  ;;^g
   Hotkey, $^\          ,EC.JumpToMatchingBrace         ;;^+m
   Hotkey, $^F3         ,EC.FindWordAtCurrentPosition   ;;^F3


;;;Hotkey, $^y          ,EC.Redo                        ;;^+z
   Hotkey, $^d          ,EC.DuplicateCurrentLine        ;;^d
   Hotkey, $^+d         ,EC.DeleteCurrentLine           ;;^y
;;;Hotkey, $^/          ,EC.CommentWithLineComment      ;;^/
;;;Hotkey, $^+/         ,EC.CommentWithBlockComment     ;;^+/
   Hotkey, $^+u         ,EC.ToggleUpperOrLowerCase      ;;^+u
   Hotkey, $^+i         ,EC.IndentBlock                 ;;^!i

;;;;;;;;
Hotkey, IfWinActive
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Goto, EC.EndOfFile


;;;;;;;; move
EC.MoveNextPostion:              ;;!Right::    ;;move next position
    sendinput, ^!{Right}
    return

EC.MovePrevPosition:             ;;!Left::     ;;move previous position
    sendinput, ^!{Left}
    return

EC.PreviewDefinition:            ;;!+Up::      ;;preview definition & type
    sendinput, !+q 
    sleep, 300 
    sendinput, d 
    return

EC.JumpToDefinition:             ;;!+Down::    ;;jump to definition
    sendinput, {F3}
    return

EC.JumpToOverrideMethod:         ;;!+Right::   ;;jump to Override Method
    ;;Func( "_ECAction" ).Bind( "{F12}", "^3", 100, "Open Implementation" )
    sendinput, ^3
    sendinput, {Text}Open Implementation
    sendinput, {Enter}
    ;sendinput, $!n
    ;sendinput, $p
    return
    
EC.NextFileorTab:                ;;^tab::      ;;next file or tab
    sendinput, ^{PgDn}
    return

EC.PrevFileorTab:                ;;^+tab::     ;;previous file or tab
    sendinput, ^{PgUp}
    return
    
EC.CloseCurrentFile:             ;;^w:         ;;close current file
    sendinput, % EC.fc[1]
    return

EC.ReopenRecentFileorTab:        ;;^+t:        ;;reopen recent closed tab or file
    ;;MsgBox, A_Hotkey 
    sendinput, % EC.frecent[1]
    return

EC.JumpToLine:                   ;;^g::        ;;goto line
    sendinput, ^l
    return

EC.JumpToMatchingBrace:          ;;^\::        ;;goto matching brace toggle
    sendinput, ^+p
    return

EC.FindWordAtCurrentPosition:    ;;^F3::       ;;find word at current cursor
    sendinput, % (_t1 := !_t1) ? ("^k") : ("^+k")
    return
    
;;;;;;;; edit
EC.Redo:                         ;;^y::        ;;redo
    sendinput, ^+z
    return

EC.DuplicateCurrentLine:         ;;^d::        ;;duplicate line
    sendinput, ^!{Up}
    return

EC.DeleteCurrentLine:            ;;^+d::       ;;delete line
    sendinput, ^d
    return

EC.CommentWithLineComment:       ;;^/::        ;;comment with line-comment
    sendinput, ^/
    return

EC.CommentWithBlockComment:      ;;^+/::       ;;comment with block-comment
    sendinput, ^+/
    return

EC.ToggleUpperOrLowerCase:       ;;^+u::       ;;toggle upper or lower case
    sendinput, % (_t1 := !_t1) ? ("^+y") : ("^+x")
    return

EC.IndentBlock:                  ;;^!i::       ;;indent block
    sendinput, % EC.cindent[1]
    return


EC.EndOfFile: