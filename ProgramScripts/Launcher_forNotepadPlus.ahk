NP := {}
NP["name"] := "Notepad++ v7.5"
NP[prog] := notepad++.exe
NP[clas] := Notepad++
NP[file] := "NotepadPlus"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; unique action list
_NPAction( Menu, Sleep, Key ) {
    ;;MsgBox, %Menu%, %Sleep%, %Key%
    SendInput, %Menu%

    WinWaitActive, % "ahk_class #32770 ahk_exe " . NP[prog]
    Sleep %Sleep%
    SendInput, {delete}%Key%
    SendInput, {enter}
    WinWaitClose,  % "ahk_class #32770 ahk_exe " . NP[prog]
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
NP.pset                 := ["sendinput, !t `n sendinput, p"                                       ,"Program:Settings"]
NP.pkey                 := ["^+!s"                                                    ,"Program:Key.Shortcut.Setting"]


;;;;;;;; file
NP.fo                   := ["^o"                                                                         ,"File:Open"]
NP.fr                   := ["sendinput, !f `n sendinput, l"                                    ,"File:Reload.or.Sync"]
NP.fc                   := ["^w"                                                                        ,"File:Close"]
NP.fca                  := ["^+w"                                                                   ,"File:All.Close"]
NP.fsa                  := ["^+s"                                                                    ,"File:All.Save"]

NP.fencode              := ["!+e"                                                  ,"File:Open.as.Encoding, NEED2MAP"]


;;;;;;;; symbol search
NP.sf                   := ["^+f"                                                     ,"Symbol:String.Find.inProject"]
NP.sr                   := ["^h"                                                   ,"Symbol:String.Replace.inProject"]
NP.cfo                  := ["!+0"                                                                    ,"Coding:Unfold"]
NP.cfc                  := ["!0"                                                                       ,"Coding:Fold"]

;;;;;;;; windows, need to install Explorer plugin
NP.wfull                := ["{F11}"                                                       ,"Window:FullScreen.Toggle"]
NP.wlist                := ["SoundPlay *-1"                                                   ,"Window:List.toSwitch"]
NP.wedit                := ["{ESC}{ESC}{ESC}"                                                 ,"Window:Backto.Editor"]
NP.wdir                 := ["^!+e"                                                           ,"Window:Directory.View"]
NP.wlayout              := ["!s"                                                              ,"Window:Symbol.Layout"]

;;;; tool 
;; need to install startexplorer
NP.tpath                := [Func( "_OSRunTool" ).Bind("^+c", "copy")                  ,"Tool:FullPath.Copy, NEED2MAP"]
NP.tee                  := [Func( "_OSRunTool" ).Bind("^+c", "explorer")                      ,"Tool:Explorer.Launch"]
NP.tcmd                 := [Func( "_OSRunTool" ).Bind("^+c", "cmd")                     ,"Tool:CommandLine.Interface"]
NP.tedit                := [Func( "_OSRunTool" ).Bind("^+c", "editor")                ,"Tool:OpenWith.ExternalEditor"]


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; shortcut keymap definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


Hotkey, IfWinActive, ahk_class Notepad++
;;;; move, edit functionality must be defined in shortcut not abbreviation for convenience
;;;;;;;; move
;;;Hotkey, $!Right      ,NP.MoveNextPostion
;;;Hotkey, $!Left       ,NP.MovePrevPosition
;;;Hotkey, $!+Up        ,NP.SearchCaller
;;;Hotkey, $!+Down      ,NP.JumpToDefinition
;;;Hotkey, $^tab        ,NP.NextFileorTab
;;;Hotkey, $^+tab       ,NP.PrevFileorTab
;;;Hotkey, $^+t         ,NP.ReopenRecentFileorTab
;;;Hotkey, $^g          ,NP.JumpToLine
   Hotkey, $^\          ,NP.JumpToMatchingBrace
;;;Hotkey, $^F3         ,NP.FindWordAtCurrentPosition

;;;;;;;;;; edit
;;;Hotkey, $^y          ,NP.Redo
;;;Hotkey, $^d          ,NP.DuplicateCurrentLine
   Hotkey, $^+d         ,NP.DeleteCurrentLine
   Hotkey, $^/          ,NP.CommentWithLineComment
   Hotkey, $^+/         ,NP.CommentWithBlockComment
;;;Hotkey, $^+u         ,NP.ToggleUpperOrLowerCase
;;;Hotkey, $^+i         ,NP.IndentBlock
;;;Hotkey, $^+!i        ,NP.IndentFile
;;;;;;;;
Hotkey, IfWinActive
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Goto, NP.EndOfFile


NP.JumpToMatchingBrace:          ;;^\::        ;;goto matching brace toggle
    sendinput, ^b
    return

NP.DeleteCurrentLine:            ;;^+d::       ;;delete line
    sendinput, ^+l
    return

NP.CommentWithLineComment:       ;;^/::        ;;comment with line-comment
    ;;Msgbox, % A_ThisHotkey
    sendinput, % (_t1 := !_t1) ? ("^k") : ("^+k")
    return

NP.CommentWithBlockComment:      ;;^+/::       ;;comment with block-comment
    sendinput, % (_t2 := !_t2) ? ("^+q") : ("")
    return


NP.EndOfFile: