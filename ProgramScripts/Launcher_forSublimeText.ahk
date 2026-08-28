ST := Map()
ST["name"] := "Sublime Text 3"
ST["prog"] := "sublime_text.exe"
ST["clas"] := "PX_WINDOW_CLASS"
ST["file"] := "SublimeText"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; unique action list
_STAction(Menu, Sleep, Key) {
    ;;MsgBox(Menu, Sleep, Key)
    SendInput(Menu)

    WinWaitActive("ahk_class #32770 ahk_exe " . ST["prog"])
    Sleep(Sleep)
    SendInput("{delete}" Key)
    SendInput("{enter}")
    WinWaitClose("ahk_class #32770 ahk_exe " . ST["prog"])
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
ST["plist"]              := ["sendinput, !p `n sendinput, o `n sendinput, {Enter}"                   ,"Project:Listup"]
ST["pexit"]              := ["sendinput, !p `n sendinput, c"                                          ,"Project:Close"]
ST["pset"]               := ["sendinput, !n `n sendinput, s `n sendinput, {Enter}"                 ,"Program:Settings"]
ST["pkey"]               := ["sendinput, !n `n sendinput, k"                           ,"Program:Key.Shortcut.Setting"]
ST["pconf"]              := ["SoundPlay *-1"                                                  ,"Project:Configuration"]


;;;;;;;; file
ST["fo"]                 := ["^o"                                                                         ,"File:Open"]
ST["fr"]                 := ["SoundPlay *-1"                                                    ,"File:Reload.or.Sync"]
ST["fc"]                 := ["^w"                                                                        ,"File:Close"]
ST["fca"]                := ["SoundPlay *-1"                                                         ,"File:All.Close"]
ST["fsa"]                := ["sendinput, !f `n sendinput, l"                                          ,"File:All.Save"]

ST["fencode"]            := ["SoundPlay *-1"                                        ,"File:Open.as.Encoding, NEED2MAP"]


;;;;;;;; symbol search
ST["sf"]                 := ["^+f"                                                     ,"Symbol:String.Find.inProject"]
ST["sr"]                 := ["^+f"                                                  ,"Symbol:String.Replace.inProject"]
ST["cfo"]                := ["^+]"                                                                    ,"Coding:Unfold"]
ST["cfc"]                := ["^+["                                                                      ,"Coding:Fold"]

;;;;;;;; windows
ST["wfull"]              := ["{F11}"                                                       ,"Window:FullScreen.Toggle"]
ST["wlist"]              := ["SoundPlay *-1"                                                   ,"Window:List.toSwitch"]
ST["wdir"]               := ["^k^b"                                                           ,"Window:Directory.View"]
ST["wlayout"]            := ["!s"                                                              ,"Window:Symbol.Layout"]

;;;; tool
ST["tpath"]              := [_OSRunTool.Bind("^+c", "copy")                           ,"Tool:FullPath.Copy, NEED2MAP"]
ST["tex"]                := [_OSRunTool.Bind("^+c", "explorer")                               ,"Tool:Explorer.Launch"]
ST["tt"]                 := ST["tex"]
ST["tcmd"]               := [_OSRunTool.Bind("^+c", "cmd")                              ,"Tool:CommandLine.Interface"]
ST["tedit"]              := [_OSRunTool.Bind("^+c", "editor")                         ,"Tool:OpenWith.ExternalEditor"]
;;ST["wedit"]              := ["{ESC}{ESC}{ESC}"                                                 ,"Window:Backto.Editor"]


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; shortcut keymap definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


HotIfWinActive("ahk_class PX_WINDOW_CLASS")
;;;; move, edit functionality must be defined in shortcut not abbreviation for convenience
;;;;;;;; move
;;;Hotkey("$!Right"      ,ST_MoveNextPostion)
;;;Hotkey("$!Left"       ,ST_MovePrevPosition)
;;;Hotkey("$!+Up"        ,ST_SearchCaller)
;;;Hotkey("$!+Down"      ,ST_JumpToDefinition)
;;;Hotkey("$^tab"        ,ST_NextFileorTab)
;;;Hotkey("$^+tab"       ,ST_PrevFileorTab)
;;;Hotkey("$^+t"         ,ST_ReopenRecentFileorTab)
;;;Hotkey("$^g"          ,ST_JumpToLine)
;;;Hotkey("$^\\"         ,ST_JumpToMatchingBrace)
;;;Hotkey("$^F3"         ,ST_FindWordAtCurrentPosition)

;;;;;;;;;; edit
;;;Hotkey("$^y"          ,ST_Redo)
Hotkey("$^d",              ST_DuplicateCurrentLine)
Hotkey("$^+d",             ST_DeleteCurrentLine)
;;;Hotkey("$^/"          ,ST_CommentWithLineComment)
;;;Hotkey("$^+/"         ,ST_CommentWithBlockComment)
;;;Hotkey("$^+u"         ,ST_ToggleUpperOrLowerCase)
;;;Hotkey("$^+i"         ,ST_IndentBlock)
;;;Hotkey("$^+!i"        ,ST_IndentFile)
;;;;;;;;
HotIfWinActive()
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


ST_JumpToMatchingBrace(*) {      ;;^\::        ;;goto matching brace toggle
    SendInput("^b")
}

ST_DuplicateCurrentLine(*) {     ;;^d::        ;;duplicate line
    SendInput("^+D")
}

ST_DeleteCurrentLine(*) {        ;;^+d::       ;;delete line
    SendInput("^+K")
}

ST_CommentWithLineComment(*) {   ;;^/::        ;;comment with line-comment
    ;;MsgBox(A_ThisHotkey)
}

ST_CommentWithBlockComment(*) {  ;;^+/::       ;;comment with block-comment
}