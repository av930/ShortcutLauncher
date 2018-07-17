SI := {}
SI["name"] := "SourceInsight v4.0"
SI[prog] := sourceinsight4.exe
SI[clas] := si4_Frame
SI[file] := "SourceInsight"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; unique action list
_SIAction( Menu, Sleep, Key ) {
    ;;MsgBox, %Menu%, %Sleep%, %Key%
    SendInput, %Menu%

    WinWaitActive, % ahk_class #32770 ahk_exe . SI[prog]
    SendInput, {delete}%Key%
    WinWaitClose,  % ahk_class #32770 ahk_exe . SI[prog]
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
;; SI.fc                := ["sendinput, ^+a `n sleep, 500 `n sendinput, {text}Close All"            ,"multi commands"]
;; SI.fd                := [Func( "_SIAction" ).Bind( "^+a", 500, "{text}File Encoding" )            ,"function call"]
;; SI.fa                := SI.fb



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; abbreviation definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;; program
SI.plist                := ["sendinput, !p `n sleep, 300 `n sendinput, o"                           ,"Project:Listup"]
SI.pexit                := ["!+W"                                                                    ,"Project:Close"]
SI.pset                 := ["sendinput, !o `n sleep, 300 `n sendinput, p"                         ,"Program:Settings"]

SI.pkey                 := ["sendinput, !h `n sleep, 300 `n sendinput, c"             ,"Program:Key.Shortcut.Setting"]
SI.pconf                := ["sendinput, !p `n sleep, 300 `n sendinput, i"                    ,"Project:Configuration"]
SI.psync                := ["!+s"                                                            ,"Project:Database.Sync"]



;;;;;;;; file
SI.fo                   := ["^o"                                                                         ,"File:Open"]
SI.fr                   := ["^+o"                                                              ,"File:Reload.or.Sync"]
SI.frecent              := ["sendinput, !f `n sleep, 300 `n sendinput, f"                         ,"File:Open.Recent"]
SI.fc                   := ["^w"                                                                        ,"File:Close"]
SI.fca                  := ["^+w"                                                                   ,"File:All.Close"]
SI.fsa                  := ["^!a"                                                                    ,"File:All.Save"]
SI.fencode              := ["!+e"                                                      ,"File:Changes.Show, NEED2MAP"]
SI.fchange              := ["!{NumpadAdd}"                                                       ,"File:Changes.Show"]

;;;;;;;; symbol search
SI.sfind                := ["^+f",                                                    ,"Symbol:String.Find.inProject"]
SI.sreplace             := ["^+h"                                                  ,"Symbol:String.Replace.inProject"]
SI.sref                 := ["^/"                                                                 ,"Symbol:Usage.Find"]
SI.slistgl              := ["{f7}"                                                           ,"Symbol:List.inProject"]
SI.slistlo              := ["{f8}"                                                              ,"Symbol:List.inFile"]

SI.ssearch              := ["^i"                                                                 ,"Symbol:Search.All"]
SI.srename              := ["^'"                                                             ,"Symbol:Rename.Smartly"]
SI.ssample              := ["^!w"                                                   ,"Symbol:Samplecode.Search.inWEB"]

SI.spre                 := ["^["                                                         ,"Symbol:Definition.Preview"]
SI.sjump                := ["^="                                                            ,"Symbol:Definition.Jump"]
SI.stype                := ["!0"                                                                  ,"Symbol:Type.Jump"]

SI.shighlight           := ["+{F8}"                                                                "Symbol:Highlight"]
SI.sbook                := ["^+m"                                                          ,"Symbol,Manage.Bookmarks"]
SI.sb                   := ["^m"                                                            ,"Symbol,Toggle.Bookmark"]



;;;;;;;; coding
SI.cc                   := ["^e"                                                       ,"coding:Symbol.Auto.Complete"]
SI.ct                   := ["^!s"                                                      ,"Coding:Generation.BySnippet"]
SI.cfo                  := ["^+="                                                                    ,"Coding:UnFold"]
SI.cfc                  := ["^+-"                                                                      ,"Coding:Fold"]
SI.cindent              := ["^!i"                                                              ,"Coding:Indent.Block"]



;;;;;;;; windows
SI.wfull                := ["{F11}"                                                       ,"Window:FullScreen.Toggle"]
SI.wlist                := ["sendinput, !v `n sleep, 300 `n sendinput, p"                              ,"Window:List"]
SI.wedit                := ["{ESC}"                                                           ,"Window:Backto.Editor"]
SI.wdir                 := ["^p"                                                             ,"Window:Directory.View"]
SI.wlayout              := ["^]"                                                              ,"Window:Symbol.Layout"]
SI.whier                := ["!+h"                                                  ,"Window:Call.Hierarchy, NEED2MAP"]
SI.wcall                := ["^`"                                                                  ,"Window:Call.find"]
SI.wplug                := ["!k"                                                             ,"Window:Plugin.Manager"]
 
;;;;;;;; tool
SI.tpath                := [Func( "_OSRunTool" ).Bind("^+c", "copy")                  ,"Tool:FullPath.Copy, NEED2MAP"]
SI.tex                  := [Func( "_OSRunTool" ).Bind("^+c", "explorer")                      ,"Tool:Explorer.Launch"]
SI.tt                   := SI.tex
SI.tcmd                 := [Func( "_OSRunTool" ).Bind("^+c", "cmd")                     ,"Tool:CommandLine.Interface"]
SI.tedit                := [Func( "_OSRunTool" ).Bind("^+c", "editor")             ,"Tool:OpenWith.ExternalEditor"]



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
Hotkey, IfWinActive, ahk_class si4_Frame
;;;; move, edit functionality must be defined in shortcut not abbreviation for convenience
;;;;;;;; move
   Hotkey, $!Right      ,SI.MoveNextPostion
   Hotkey, $!Left       ,SI.MovePrevPosition
   Hotkey, $!+Up        ,SI.PreviewDefinition
   Hotkey, $!+Down      ,SI.JumpToDefinition
;;;Hotkey, $!+Right     ,SI.JumpToOverrideMethod       
;;;Hotkey, $^tab        ,SI.NextFileorTab
;;;Hotkey, $^+tab       ,SI.PrevFileorTab
;;;Hotkey, $^w          ,SI.CloseCurrentFile            
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

SI.PreviewDefinition:            ;;!+Up::      ;;preview definition & type
    sendinput, % SI.spre[1]
    return

SI.JumpToDefinition:             ;;!+Down::    ;;jump to definition
    sendinput, ^=
    return

SI.JumpToOverrideMethod:         ;;!+Right::   ;;jump to Override Method
  
    return
SI.NextFileorTab:                ;;^tab::      ;;next file or tab
    sendinput, ^{tab}
    return

SI.PrevFileorTab:                ;;^+tab::     ;;previous file or tab
    sendinput, ^+{tab}
    return

SI.CloseCurrentFile:             ;;^w:         ;;close current file
    sendinput, % SI.fc[1]
    return
    
SI.ReopenRecentFileorTab:
    ;;^+t:        ;;reopen recent closed tab or file
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
    sendinput, % SI.cindent[1]
    return


SI.EndOfFile: