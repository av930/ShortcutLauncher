SI := Map()
SI["name"] := "SourceInsight v4.0"
SI["prog"] := "sourceinsight4.exe"
SI["clas"] := "si4_Frame"
SI["file"] := "SourceInsight"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; unique action list
_SIAction(Menu, DelayMs, Key) {
    ;;MsgBox(Menu, DelayMs, Key)
    SendInput(Menu)

    WinWaitActive("ahk_class #32770 ahk_exe " . SI["prog"])
    SendInput("{delete}" Key)
    WinWaitClose("ahk_class #32770 ahk_exe " . SI["prog"])
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
;; SI["fc"]             := ["sendinput, ^+a `n sleep, 500 `n sendinput, {text}Close All"            ,"multi commands"]
;; SI["fd"]             := [_SIAction.Bind( "^+a", 500, "{text}File Encoding" )                     ,"function call"]
;; SI["fa"]             := SI["fb"]



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; abbreviation definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;; program
SI["plist"]              := ["sendinput, !p `n sleep, 300 `n sendinput, o"                           ,"Project:Listup"]
SI["pexit"]              := ["!+W"                                                                    ,"Project:Close"]
SI["pset"]               := ["sendinput, !o `n sleep, 300 `n sendinput, p"                         ,"Program:Settings"]

SI["pkey"]               := ["sendinput, !h `n sleep, 300 `n sendinput, c"             ,"Program:Key.Shortcut.Setting"]
SI["pconf"]              := ["sendinput, !p `n sleep, 300 `n sendinput, i"                    ,"Project:Configuration"]
SI["psync"]              := ["!+s"                                                            ,"Project:Database.Sync"]



;;;;;;;; file
SI["fo"]                 := ["^o"                                                                         ,"File:Open"]
SI["fr"]                 := ["^+o"                                                              ,"File:Reload.or.Sync"]
SI["frecent"]            := ["sendinput, !f `n sleep, 300 `n sendinput, f"                         ,"File:Open.Recent"]
SI["fc"]                 := ["^w"                                                                        ,"File:Close"]
SI["fca"]                := ["^+w"                                                                   ,"File:All.Close"]
SI["fsa"]                := ["^!a"                                                                    ,"File:All.Save"]
SI["fencode"]            := ["!+e"                                                      ,"File:Changes.Show, NEED2MAP"]
SI["fchange"]            := ["!{NumpadAdd}"                                                       ,"File:Changes.Show"]

;;;;;;;; symbol search
SI["sfind"]              := ["^+f"                                                    ,"Symbol:String.Find.inProject"]
SI["sreplace"]           := ["^+h"                                                  ,"Symbol:String.Replace.inProject"]
SI["sref"]               := ["^/"                                                                 ,"Symbol:Usage.Find"]
SI["slistgl"]            := ["{f7}"                                                           ,"Symbol:List.inProject"]
SI["slistlo"]            := ["{f8}"                                                              ,"Symbol:List.inFile"]

SI["ssearch"]            := ["^i"                                                                 ,"Symbol:Search.All"]
SI["srename"]            := ["^'"                                                             ,"Symbol:Rename.Smartly"]
SI["ssample"]            := ["^!w"                                                   ,"Symbol:Samplecode.Search.inWEB"]

SI["spre"]               := ["^["                                                         ,"Symbol:Definition.Preview"]
SI["sjump"]              := ["^="                                                            ,"Symbol:Definition.Jump"]
SI["stype"]              := ["!0"                                                                  ,"Symbol:Type.Jump"]

SI["shighlight"]         := ["+{F8}",                                                              "Symbol:Highlight"]
SI["sbook"]              := ["^+m"                                                          ,"Symbol,Manage.Bookmarks"]
SI["sb"]                 := ["^m"                                                            ,"Symbol,Toggle.Bookmark"]



;;;;;;;; coding
SI["cc"]                 := ["^e"                                                       ,"coding:Symbol.Auto.Complete"]
SI["ct"]                 := ["^!s"                                                      ,"Coding:Generation.BySnippet"]
SI["cfo"]                := ["^+="                                                                    ,"Coding:UnFold"]
SI["cfc"]                := ["^+-"                                                                      ,"Coding:Fold"]
SI["cindent"]            := ["^!i"                                                              ,"Coding:Indent.Block"]



;;;;;;;; windows
SI["wfull"]              := ["{F11}"                                                       ,"Window:FullScreen.Toggle"]
SI["wlist"]              := ["sendinput, !v `n sleep, 300 `n sendinput, p"                              ,"Window:List"]
SI["wedit"]              := ["{ESC}"                                                           ,"Window:Backto.Editor"]
SI["wdir"]               := ["^p"                                                             ,"Window:Directory.View"]
SI["wlayout"]            := ["^]"                                                              ,"Window:Symbol.Layout"]
SI["whier"]              := ["!+h"                                                  ,"Window:Call.Hierarchy, NEED2MAP"]
SI["wcall"]              := ["^``"                                                                 ,"Window:Call.find"]
SI["wplug"]              := ["!k"                                                             ,"Window:Plugin.Manager"]

;;;;;;;; tool
SI["tpath"]              := [_OSRunTool.Bind("^+c", "copy")                           ,"Tool:FullPath.Copy, NEED2MAP"]
SI["tex"]                := [_OSRunTool.Bind("^+c", "explorer")                               ,"Tool:Explorer.Launch"]
SI["tt"]                 := SI["tex"]
SI["tcmd"]               := [_OSRunTool.Bind("^+c", "cmd")                              ,"Tool:CommandLine.Interface"]
SI["tedit"]              := [_OSRunTool.Bind("^+c", "editor")                         ,"Tool:OpenWith.ExternalEditor"]



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
HotIfWinActive("ahk_class si4_Frame")
;;;; move, edit functionality must be defined in shortcut not abbreviation for convenience
;;;;;;;; move
Hotkey("$!Right",         SI_MoveNextPostion)
Hotkey("$!Left",          SI_MovePrevPosition)
Hotkey("$!+Up",           SI_PreviewDefinition)
Hotkey("$!+Down",         SI_JumpToDefinition)
;;;Hotkey("$!+Right"     ,SI_JumpToOverrideMethod)
;;;Hotkey("$^tab"        ,SI_NextFileorTab)
;;;Hotkey("$^+tab"       ,SI_PrevFileorTab)
;;;Hotkey("$^w"          ,SI_CloseCurrentFile)
Hotkey("$^+t",             SI_ReopenRecentFileorTab)
;;;Hotkey("$^g"          ,SI_JumpToLine)
Hotkey("$^\",             SI_JumpToMatchingBrace)
Hotkey("$^F3",            SI_FindWordAtCurrentPosition)

;;;;;;;;;;; edit
Hotkey("$^y",             SI_Redo)
Hotkey("$^d",             SI_DuplicateCurrentLine)
Hotkey("$^+d",            SI_DeleteCurrentLine)
;;;Hotkey("$^/"          ,SI_CommentWithLineComment)
;;;Hotkey("$^+/"         ,SI_CommentWithBlockComment)
Hotkey("$^+u",            SI_ToggleUpperOrLowerCase)
;;;Hotkey("$^+i"         ,SI_IndentBlock)

;;;;;;;;
HotIfWinActive()
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;; move
SI_MoveNextPostion(*) {          ;;!Right::    ;;move next position
    SendInput("!.")
}

SI_MovePrevPosition(*) {         ;;!Left::     ;;move previous position
    SendInput("!,")
}

SI_PreviewDefinition(*) {        ;;!+Up::      ;;preview definition & type
    SendInput(SI["spre"][1])
}

SI_JumpToDefinition(*) {         ;;!+Down::    ;;jump to definition
    SendInput("^=")
}

SI_JumpToOverrideMethod(*) {     ;;!+Right::   ;;jump to Override Method
}

SI_NextFileorTab(*) {            ;;^tab::      ;;next file or tab
    SendInput("^{tab}")
}

SI_PrevFileorTab(*) {            ;;^+tab::     ;;previous file or tab
    SendInput("^+{tab}")
}

SI_CloseCurrentFile(*) {         ;;^w:         ;;close current file
    SendInput(SI["fc"][1])
}

SI_ReopenRecentFileorTab(*) {
    ;;^+t:        ;;reopen recent closed tab or file
    SendInput("!f")
    Sleep(300)
    SendInput("f")
}

SI_JumpToLine(*) {               ;;^g::        ;;goto line
    SendInput("^g")
}

SI_JumpToMatchingBrace(*) {      ;;^\::        ;;goto matching brace toggle
    global _t1
    SendInput((_t1 := !_t1) ? "^+[" : "^+]")
}

SI_FindWordAtCurrentPosition(*) { ;;^F3::       ;;find word at current cursor
    SendInput("!f")
}

;;;;;;;; edit
SI_Redo(*) {                     ;;^y::        ;;redo
    SendInput("^+z")
}

SI_DuplicateCurrentLine(*) {     ;;^d::        ;;duplicate line
    SendInput("{HOME}")
    SendInput("{SHIFT DOWN}{END}{SHIFT UP}")
    SendInput("^c")
    SendInput("{END}{Enter}")
    SendInput("^v")
}

SI_DeleteCurrentLine(*) {        ;;^+d::       ;;delete line
    SendInput("{HOME}")
    SendInput("{SHIFT DOWN}{END}{SHIFT UP}")
    SendInput("{Del}{Del}")
}

SI_CommentWithLineComment(*) {   ;;^/::        ;;comment with line-comment
    SendInput("^/")
}

SI_CommentWithBlockComment(*) {  ;;^+/::       ;;comment with block-comment
    SendInput("^+/")
}

SI_ToggleUpperOrLowerCase(*) {   ;;^+u::       ;;toggle upper or lower case
    global _t1
    SendInput((_t1 := !_t1) ? "^+u" : "^u")
}

SI_IndentBlock(*) {              ;;^!i::       ;;indent block
    SendInput(SI["cindent"][1])
}