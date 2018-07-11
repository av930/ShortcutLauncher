ST := {}
ST["name"] := "Sublime Text 3"
ST[prog] := sublime_text.exe
ST[clas] := PX_WINDOW_CLASS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; unique action list
_STAction( Menu, Sleep, Key ) {
    ;;MsgBox, %Menu%, %Sleep%, %Key%
    SendInput, %Menu%

    WinWaitActive, % "ahk_class #32770 ahk_exe " . ST[prog]
    Sleep %Sleep%
    SendInput, {delete}%Key%
    SendInput, {enter}
    WinWaitClose,  % "ahk_class #32770 ahk_exe " . ST[prog]
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
ST.plist                := ["sendinput, !p `n sendinput, o `n sendinput, {Enter}"                   ,"Project:Listup"]
ST.pexit                := ["sendinput, !p `n sendinput, c"                                          ,"Project:Close"]
ST.pset                 := ["sendinput, !n `n sendinput, s `n sendinput, {Enter}"                 ,"Program:Settings"]
ST.pkey                 := ["sendinput, !n `n sendinput, k"                           ,"Program:Key.Shortcut.Setting"]
ST.pconf                := ["SoundPlay *-1"                                                  ,"Project:Configuration"]


;;;;;;;; file
ST.fo                   := ["^o"                                                                         ,"File:Open"]
ST.fr                   := ["SoundPlay *-1"                                                    ,"File:Reload.or.Sync"]
ST.fc                   := ["^w"                                                                        ,"File:Close"]
ST.fca                  := ["SoundPlay *-1"                                                         ,"File:All.Close"]
ST.fsa                  := ["sendinput, !f `n sendinput, l"                                          ,"File:All.Save"]

ST.fencode              := ["SoundPlay *-1"                                        ,"File:Open.as.Encoding, NEED2MAP"]


;;;;;;;; symbol search
ST.sf                   := ["^+f"                                                     ,"Symbol:String.Find.inProject"]
ST.sr                   := ["^+f"                                                  ,"Symbol:String.Replace.inProject"]
ST.cfo                  := ["^+]"                                                                    ,"Coding:Unfold"]
ST.cfc                  := ["^+["                                                                      ,"Coding:Fold"]

;;;;;;;; windows
ST.wfull                := ["{F11}"                                                       ,"Window:FullScreen.Toggle"]
ST.wlist                := ["SoundPlay *-1"                                                   ,"Window:List.toSwitch"]
ST.wedit                := ["{ESC}{ESC}{ESC}"                                                 ,"Window:Backto.Editor"]
ST.wdir                 := ["^k^b"                                                           ,"Window:Directory.View"]
ST.wlayout              := ["!s"                                                              ,"Window:Symbol.Layout"]

;;;; tool
ST.tpath                := [Func( "_OSRunTool" ).Bind("^+c", "copy")                  ,"Tool:FullPath.Copy, NEED2MAP"]
ST.tex                  := [Func( "_OSRunTool" ).Bind("^+c", "explorer")                      ,"Tool:Explorer.Launch"]
ST.tt                   := ST.tex
ST.tcmd                 := [Func( "_OSRunTool" ).Bind("^+c", "cmd")                     ,"Tool:CommandLine.Interface"]
ST.tedit                := [Func( "_OSRunTool" ).Bind("^+c", "editor")             ,"Tool:OpenWith.ExternalEditor"]



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; shortcut keymap definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


Hotkey, IfWinActive, ahk_class PX_WINDOW_CLASS
;;;; move, edit functionality must be defined in shortcut not abbreviation for convenience
;;;;;;;; move
;;;Hotkey, $!Right      ,ST.MoveNextPostion
;;;Hotkey, $!Left       ,ST.MovePrevPosition
;;;Hotkey, $!+Up        ,ST.SearchCaller
;;;Hotkey, $!+Down      ,ST.JumpToDefinition
;;;Hotkey, $^tab        ,ST.NextFileorTab
;;;Hotkey, $^+tab       ,ST.PrevFileorTab
;;;Hotkey, $^+t         ,ST.ReopenRecentFileorTab
;;;Hotkey, $^g          ,ST.JumpToLine
;;;Hotkey, $^\          ,ST.JumpToMatchingBrace
;;;Hotkey, $^F3         ,ST.FindWordAtCurrentPosition

;;;;;;;;;; edit
;;;Hotkey, $^y          ,ST.Redo
   Hotkey, $^d          ,ST.DuplicateCurrentLine
   Hotkey, $^+d         ,ST.DeleteCurrentLine
;;;Hotkey, $^/          ,ST.CommentWithLineComment
;;;Hotkey, $^+/         ,ST.CommentWithBlockComment
;;;Hotkey, $^+u         ,ST.ToggleUpperOrLowerCase
;;;Hotkey, $^+i         ,ST.IndentBlock
;;;Hotkey, $^+!i        ,ST.IndentFile
;;;;;;;;
Hotkey, IfWinActive
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Goto, ST.EndOfFile


ST.JumpToMatchingBrace:          ;;^\::        ;;goto matching brace toggle
    sendinput, ^b
    return

ST.DuplicateCurrentLine:         ;;^d::        ;;duplicate line
    sendinput, ^+D
    return
    
ST.DeleteCurrentLine:            ;;^+d::       ;;delete line
    sendinput, ^+K
    return

ST.CommentWithLineComment:       ;;^/::        ;;comment with line-comment
    ;;Msgbox, % A_ThisHotkey
    return

ST.CommentWithBlockComment:      ;;^+/::       ;;comment with block-comment
    return


ST.EndOfFile: