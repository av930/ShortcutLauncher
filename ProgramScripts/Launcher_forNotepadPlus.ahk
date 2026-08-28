NP := Map()
NP["name"] := "Notepad++ v7.5"
NP["prog"] := "notepad++.exe"
NP["clas"] := "Notepad++"
NP["file"] := "NotepadPlus"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; unique action list
_NPAction(Menu, Sleep, Key) {
    ;;MsgBox(Menu, Sleep, Key)
    SendInput(Menu)

    WinWaitActive("ahk_class #32770 ahk_exe " . NP["prog"])
    Sleep(Sleep)
    SendInput("{delete}" Key)
    SendInput("{enter}")
    WinWaitClose("ahk_class #32770 ahk_exe " . NP["prog"])
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; basic rule of shortcuts
;;;; length of abbreviation should be under 2~5 char.
;;;; basic sequence of chars (object - action - target) or (object - sub object)
;;;; count functionality ends with ~c (means count)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Example
;; SI["fa"]             := ["^s"                                                                            ,"hotkey"]
;; SI["fb"]             := ["sendinput, ^s"                                                         ,"single command"]
;; SI["fc"]             := ["sendinput, ^+a `n sleep, 500 `n sendinput, {text}Close All "           ,"multi commands"]
;; SI["fd"]             := [_SIAction.Bind( "^+a", 500, "{text}File Encoding" )                     ,"function call"]


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; abbreviation definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;; program
NP["pset"]               := ["sendinput, !t `n sendinput, p"                                       ,"Program:Settings"]
NP["pkey"]               := ["sendinput, !t `n sendinput, {down}{down}{enter}"         ,"Program:Key.Shortcut.Setting"]


;;;;;;;; file
NP["fo"]                 := ["^o"                                                                         ,"File:Open"]
NP["fr"]                 := ["sendinput, !f `n sendinput, l"                                    ,"File:Reload.or.Sync"]
NP["fc"]                 := ["^w"                                                                        ,"File:Close"]
NP["fca"]                := ["^+w"                                                                   ,"File:All.Close"]
NP["fsa"]                := ["^+s"                                                                    ,"File:All.Save"]

NP["fencode"]            := ["!+e"                                                  ,"File:Open.as.Encoding, NEED2MAP"]


;;;;;;;; symbol search
NP["sf"]                 := ["^+f"                                                     ,"Symbol:String.Find.inProject"]
NP["sr"]                 := ["^h"                                                   ,"Symbol:String.Replace.inProject"]
NP["cfo"]                := ["!+0"                                                                    ,"Coding:Unfold"]
NP["cfc"]                := ["!0"                                                                       ,"Coding:Fold"]

;;;;;;;; windows, need to install Explorer plugin
NP["wfull"]              := ["{F11}"                                                       ,"Window:FullScreen.Toggle"]
NP["wlist"]              := ["SoundPlay *-1"                                                   ,"Window:List.toSwitch"]
NP["wedit"]              := ["{ESC}{ESC}{ESC}"                                                 ,"Window:Backto.Editor"]
NP["wdir"]               := ["^!+e"                                                           ,"Window:Directory.View"]
NP["wlayout"]            := ["!s"                                                              ,"Window:Symbol.Layout"]

;;;; tool 
;; need to install startexplorer
NP["tpath"]              := [_OSCopyText.Bind("^+c", "copy")                          ,"Tool:FullPath.Copy, NEED2MAP"]
NP["tt"]                 := [_OSRunTool.Bind("^+c", "explorer")                               ,"Tool:Explorer.Launch"]
NP["tcmd"]               := [_OSRunTool.Bind("^+c", "cmd")                              ,"Tool:CommandLine.Interface"]
NP["tedit"]              := [_OSRunTool.Bind("^+c", "editor")                         ,"Tool:OpenWith.ExternalEditor"]


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; shortcut keymap definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


HotIfWinActive("ahk_class Notepad++")
;;;; move, edit functionality must be defined in shortcut not abbreviation for convenience
;;;;;;;; move
Hotkey("$!Right",         NP_MoveNextCurPosition)
Hotkey("$!Left",          NP_MovePrevCurPosition)
Hotkey("$!+Right",        NP_MoveNextModiPostion)
Hotkey("$!+Left",         NP_MovePrevModiPosition)

;;;Hotkey("$!+Up"        ,NP_SearchCaller)
;;;Hotkey("$!+Down"      ,NP_JumpToDefinition)
;;;Hotkey("$^tab"        ,NP_NextFileorTab)
;;;Hotkey("$^+tab"       ,NP_PrevFileorTab)
;;;Hotkey("$^+t"         ,NP_ReopenRecentFileorTab)
;;;Hotkey("$^g"          ,NP_JumpToLine)
Hotkey("$^\",             NP_JumpToMatchingBrace)
;;;Hotkey("$+Space"      ,NP_JumpOutOfMatchingBrace)      ;;   
;;;Hotkey("$!+Left"      ,NP_FindWordAtCurrentPos)        ;;^F3
;;;Hotkey("$!Down"       ,NP_FindWordAtCurrentPosDown)    ;;F3
;;;Hotkey("$!Up"         ,NP_FindWordAtCurrentPosUp)      ;;+F3


;;;;;;;;;; edit
;;;Hotkey("$^y"          ,NP_Redo)
;;;Hotkey("$^d"          ,NP_DuplicateCurrentLine)
Hotkey("$^+d",             NP_DeleteCurrentLine)
Hotkey("$^/",              NP_CommentWithLineComment)
Hotkey("$^+/",             NP_CommentWithBlockComment)
;;;Hotkey("$^+u"         ,NP_ToggleUpperOrLowerCase)
;;;Hotkey("$^+i"         ,NP_IndentBlock)
;;;Hotkey("$^+!i"        ,NP_IndentFile)
;;;;;;;;
HotIfWinActive()
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

NP_MoveNextModiPostion(*) {          ;;!Right::      ;;next modified location
    SendInput("^!y")
}

NP_MovePrevModiPosition(*) {         ;;!Left::       ;;previous modified location
    SendInput("^!z")
}

NP_MoveNextCurPosition(*) {      ;;!Right::       ;;previous modified location
    SendInput("^+-")
}

NP_MovePrevCurPosition(*) {      ;;!Left::       ;;previous modified location
    SendInput("^-")
}

NP_JumpToMatchingBrace(*) {      ;;^\::        ;;goto matching brace toggle
    SendInput("^b")
}

NP_DeleteCurrentLine(*) {        ;;^+d::       ;;delete line
    SendInput("^+l")
}

NP_CommentWithLineComment(*) {   ;;^/::        ;;comment with line-comment
    global _t1
    ;;MsgBox(A_ThisHotkey)
    SendInput((_t1 := !_t1) ? "^k" : "^+k")
}

NP_CommentWithBlockComment(*) {  ;;^+/::       ;;comment with block-comment
    global _t2
    SendInput((_t2 := !_t2) ? "^+q" : "")
}

NP_FindWordAtCurrentPos(*) {    ;;^F3::        ;;set word as finding-word at current cursor
    SendInput("^{F3}")
}

NP_FindWordAtCurrentPosDown(*) { ;;F3::         ;;find word forward
    SendInput("{F3}")
}

NP_FindWordAtCurrentPosUp(*) {   ;;+F3::       ;;find word backword
    SendInput("+{F3}")
}