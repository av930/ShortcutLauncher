ST := {}
ST["name"] := "Sublime Text 3"
ST[prog] := sublime_text.exe
ST[clas] := PX_WINDOW_CLASS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; unique action list
_NPAction( Menu, Sleep, Key ) {
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
ST.plist                := ["sendinput, !p `n sendinput, o `n sendinput, {Enter}"                   ,"Project.Listup"]
ST.pexit                := ["sendinput, !p `n sendinput, c"                                          ,"Project.Close"]
ST.pset                 := ["sendinput, !n `n sendinput, s `n sendinput, {Enter}"                 ,"Program.Settings"]
ST.pkey                 := ["sendinput, !n `n sendinput, k"                           ,"Program.Key.Shortcut.Setting"]
ST.pconf                := ["SoundPlay *-1"                                                  ,"Project.Configuration"]


;;;;;;;; file
ST.fo                   := ["^o"                                                                         ,"File.Open"]
ST.fr                   := ["SoundPlay *-1"                                                    ,"File.Reload.or.Sync"]
ST.fc                   := ["^w"                                                                        ,"File.Close"]
ST.fca                  := ["SoundPlay *-1"                                                         ,"File.All.Close"]
ST.fsa                  := ["sendinput, !f `n sendinput, l"                                          ,"File.All.Save"]

ST.fencode              := ["!+e"                                                  ,"File.Open.as.Encoding, NEED2MAP"]


;;;;;;;; symbol search
ST.sf                   := ["^+f"                                                     ,"Symbol.String.Find.inProject"]
ST.sr                   := ["^h"                                                   ,"Symbol.String.Replace.inProject"]
ST.cfo                  := ["!+0"                                                                    ,"Coding.Unfold"]
ST.cfc                  := ["!0"                                                                       ,"Coding.Fold"]

;;;;;;;; windows, need to install Explorer plugin
ST.wfull                := ["{F11}"                                                       ,"Window.FullScreen.Toggle"]
ST.wlist                := [Func( "_NPAction" ).Bind( "^+a", 500, "{text}Tool Windows")                ,"Window.List"]
ST.wedit                := ["{ESC}{ESC}{ESC}"                                                 ,"Window.Backto.Editor"]
ST.wdir                 := ["^!+e"                                                           ,"Window.Directory.View"]
ST.wlayout              := ["!s"                                                              ,"Window.Symbol.Layout"]

;;;; tool, need to install [RunMe plugin
ST.tex                  := [Func( "_NPAction" ).Bind( "{F5}", 500, "{text}explorer.exe $(CURRENT_DIRECTORY)"), "Tool.Explorer.Launch"]
ST.tt                   := ["^+{F5}"                                                          ,"Tool.Explorer.Launch"]
ST.tcmd                 := ["^!{F5}"                                                    ,"Tool.CommandLine.Interface"]



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
   Hotkey, $^\          ,ST.JumpToMatchingBrace
;;;Hotkey, $^F3         ,ST.FindWordAtCurrentPosition

;;;;;;;;;; edit
;;;Hotkey, $^y          ,ST.Redo
;;;Hotkey, $^d          ,ST.DuplicateCurrentLine
   Hotkey, $^+d         ,ST.DeleteCurrentLine
   Hotkey, $^/          ,ST.CommentWithLineComment
   Hotkey, $^+/         ,ST.CommentWithBlockComment
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

ST.DeleteCurrentLine:            ;;^+d::       ;;delete line
    sendinput, ^+l
    return

ST.CommentWithLineComment:       ;;^/::        ;;comment with line-comment
    ;;Msgbox, % A_ThisHotkey
    sendinput, % (_t1 := !_t1) ? ("^k") : ("^+k")
    return

ST.CommentWithBlockComment:      ;;^+/::       ;;comment with block-comment
    sendinput, % (_t2 := !_t2) ? ("^+q") : ("")
    return


ST.EndOfFile: