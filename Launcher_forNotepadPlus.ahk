NP := {}
NP["name"] := "Notepad++"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; unique action list
_NPAction( Menu, Sleep, Key ) {
    ;;MsgBox, %Menu%, %Sleep%, %Key%
    SendInput, %Menu%

    WinWaitActive, ahk_class #32770 ahk_exe notepad++.exe
    Sleep %Sleep%
    SendInput, {delete}%Key%
    SendInput, {enter}
    WinWaitClose, ahk_class #32770 ahk_exe notepad++.exe
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; basic rule of shortcuts
;;;; length of abbreviation should be under 2~5 char.
;;;; basic sequence of chars (object - action - target) or (object - sub object)
;;;; count functionality ends with ~c (means count)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Example
;; NP.fsa               := ["sendinput, ^s"                                 ,"save all"                              ]
;; NP.fca               := ["sendinput, ^+a `n sendinput, {text}Close All " ,"close all"                             ]
;; NP.fe                := [Func( "_NPAction" ).Bind( "^+a", 500, "{text}File Encoding" )            ,"file encoding"]


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; abbreviation definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;; program
NP.plist                := ["SoundPlay *-1"                                                           ,"project list"]
NP.pset                 := ["SoundPlay *-1"                                                       ,"program settings"]
NP.pconf                := ["sendinput, !t `n sendinput, p"                                  ,"project configuration"]
NP.pkey                 := ["sendinput, ^+!s"                                             ,"program shortcut setting"]
NP.pk                   := NP.pkey
NP.pexit                := ["sendinput, !{F4}"                                                        ,"program exit"]
NP.px                   := NP.pexit


;;;;;;;; file
NP.fo                   := ["sendinput, ^o"                                                              ,"file open"]
NP.fr                   := ["sendinput, !f `n sendinput, l"                                     ,"file reload & sync"]
NP.fsync                := NP.fr
NP.fc                   := ["sendinput, ^w"                                                             ,"file close"]
NP.fsa                  := ["sendinput, ^+s"                                                         ,"file all save"]
NP.fca                  := ["sendinput, ^+w"                                                        ,"file all close"]
NP.fe                   := ["sendinput, !+e"                            ,"need to set shortcut, mapped convert UTF-8"]


;;;;;;;; symbol search
NP.sf                   := ["sendinput, ^+f"                                            ,"symbol search in all space"]
NP.sr                   := ["sendinput, ^h"                                            ,"symbol replace in all space"]
NP.sfind                := NP.sf
NP.sreplace             := NP.sf

;;;;;;;; windows, need to install Explorer plugin
NP.wfull                := ["sendinput, {F11}"                                          ,"window, toggle full-screen"]
NP.w                    := [Func( "_NPAction" ).Bind( "^+a", 500, "{text}Tool Windows")                ,"window list"]
NP.wedit                := ["sendinput, {ESC}{ESC}{ESC}"                                            ,"window, editor"]
NP.wdir                 := ["sendinput, ^!+e"                                               ,"window, directory view"]
NP.wsym                 := ["sendinput, !s"                                                    ,"windiw, symbol view"]
NP.whier                := ["SoundPlay *-1"                                               ,"window, hierarchy viewer"]
NP.wlog                 := ["SoundPlay *-1"                                               ,"window, log message view"]
NP.wdebug               := ["SoundPlay *-1"                                                   ,"window debugger view"]


;;;; tool, need to install [RunMe plugin
NP.tex                  := [Func( "_NPAction" ).Bind( "{F5}", 500, "{text}explorer.exe $(CURRENT_DIRECTORY)"), "tool explorer"]
NP.tt                   := ["sendinput, ^+{F5}"                             ,"explorer using plugin"                        ]
NP.cmd                  := ["sendinput, ^!{F5}"                                        ,"tool command line interface"]



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; shortcut keymap definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;; edit & etc,
;;;; functionality possible to map abbreviation instead of shortcut
NP.efo                  := ["sendinput, !+0"                                                          ,"edit, unfold"]
NP.efc                  := ["sendinput, !0"                                                             ,"edit, fold"]
NP.eval                 := ["SoundPlay *-1"                                      ,"evaluate expression for debugging"]


Hotkey, IfWinActive, ahk_exe notepad++.exe
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


NP.JumpToMatchingBrace:          ;;^\::        ;;jump to matching brace toggle
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