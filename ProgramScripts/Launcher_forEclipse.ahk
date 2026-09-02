EC := Map()
EC["name"] := "Eclipse Photon"
EC["prog"] := "eclipse.exe"
EC["clas"] := "SWT_Window0"
EC["file"] := "Eclipse"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; unique action list
_ECAction(Menu, Sub, DelayMs, Key) {
    ;;MsgBox(Menu, DelayMs, Key)
    SendInput(Menu)
    SendInput(Sub)
    Sleep(DelayMs)
    SendInput(Key)
    SendInput("{enter}")
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; basic rule of shortcuts
;;;; length of abbreviation should be under 2~5 char.
;;;; basic sequence of chars (object - action - target) or (object - sub object)
;;;; count functionality ends with ~c (means count)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Example
;; SI["fa"]             := ["^s"                                                                                 ,"hotkey"]
;; SI["fb"]             := ["sendinput, ^s"                                                              ,"single command"]
;; SI["fc"]             := ["sendinput, ^+a `n sleep, 500 `n sendinput, {text}Close All "                ,"multi commands"]
;; SI["fd"]             := [_SIAction.Bind( "^+a", 500, "{text}File Encoding" )                           ,"function call"]


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; abbreviation definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;; program
EC["pexit"]              := ["sendinput, !f `n sleep, 300 `n sendinput, x"                                 ,"Project:Close"]
EC["pset"]               := ["sendinput, !w `n sleep, 300 `n sendinput, p"                              ,"Program:Settings"]
EC["pkey"]               := [_ECAction.Bind( "{F12}", "^3", 100, "Keys - General" )       ,"Program:Key.Shortcut.Setting"]
EC["pconf"]              := [_ECAction.Bind( "!p", "p", 300, "Java build path" )                 ,"Project:Configuration"]

EC["psync"]              := ["F5"                                                                  ,"Project:Database.Sync"]
EC["pc"]                 := ["^3"                                                                 ,"Program:Search.Command"]


;;;;;;;; file
EC["fo"]                 := ["^+r"                                                                   ,"File:Open.inProject"]
EC["fr"]                 := ["F5"                                                                    ,"File:Reload.or.Sync"]
EC["frecent"]            := ["sendinput, !f `n sleep, 100 `n sendinput, {down}{down}{down}{Right}"      ,"File:Open.Recent"]
EC["fc"]                 := ["^w"                                                                             ,"File:Close"]
EC["fca"]                := ["^+w"                                                                        ,"File:All.Close"]
EC["fsa"]                := ["^+s"                                                                        ,"File:All.Save"]
EC["fchange"]            := ["sendinput, {F12} `n sendinput, +{F10} `n sendinput, e `n sendinput, h"   ,"File:Changes.Show"]


;;;;;;;; symbol search
EC["sfind"]              := ["^!g"                                                          ,"Symbol:String.Find.inProject"]
EC["sreplace"]           := ["sendinput, !a `n sleep, 100 `n sendinput, f"               ,"Symbol:String.Replace.inProject"]
EC["sref"]               := ["^+g"                                                                     ,"Symbol:Usage.Find"]
EC["slistg"]             := ["^+t"                                                                 ,"Symbol:List.inProject"]
EC["slistl"]             := ["^o"                                                                     ,"Symbol:List.inFile"]
EC["srename"]            := ["!+r"                                                                 ,"Symbol:Rename.Smartly"]
EC["simpl"]              := ["sendinput, !n `n sleep, 100 `n sendinput, p"                     ,"Symbol:List.implementation.Method"]


;;;;;;;; symbol function
EC["spre"]               := ["sendinput, !+q `n sleep, 100 `n sendinput, d"                    ,"Symbol:Definition.Preview"]
EC["sjump"]              := ["{F3}"                                                                 ,"Symbol:Definition.Jump"]
EC["stype"]              := ["^+b"                                                                      ,"Symbol:Type.Jump"]
EC["shelp"]              := ["{F2}"                                                                   ,"Symbol:Manual.Open"]
EC["shigh"]              := ["!+o"                                                                      ,"Symbol:Highlight"]
EC["sbook"]              := ["sendinput, !e `n sleep, 100 `n sendinput, k"                           ,"Symbol:Bookmark.add"]


;;;;;;;; coding
EC["cc"]                 := ["^{space}"                                                       ,"Coding:Symbol.AutoComplete"]
EC["ci"]                 := ["^+o"                                                            ,"Coding:Import.AutoComplete"]
EC["ct"]                 := ["sendinput, !s `n sleep, 100 `n sendinput, v"            ,"Coding:Override.Implement.Generate"]
EC["cfix"]               := ["^1"                                                                   ,"Coding:Error.AutoFix"]
EC["cerr"]               := ["{F2}"                                                                     ,"Coding:Error.Tip"]
EC["cfo"]                := ["^{NumpadDiv}"                                                                ,"Coding:UnFold"]
EC["cfc"]                := ["^{NumpadDiv}"                                                                  ,"Coding:Fold"]
EC["ceval"]              := ["^+d"                                                    ,"Coding:Expression.Evaluate.inDebug"]
EC["cindent"]            := ["^i"                                                                    ,"Coding:Indent.Block"]
EC["cformat"]            := ["^+f"                                                                    ,"Coding:Indent.File"]


;;;;;;;; build
EC["bl"]                 := ["!p"                                                                        ,"Build:List.Menu"]
EC["bb"]                 := ["^b"                                                                          ,"Build:Project"]
EC["bt"]                 := ["+{F9}"                                                                ,"Build:Current.Target"]
;;;; prerequite: autoscroll to source, autoscroll from source need to checked in prject view
EC["brun"]               := ["^{f11}"                                                                     ,"Build:Run.only"]
EC["bre"]                := ["{F9}"                                                                 ,"Build:Agagin.reBuild"]
EC["bc"]                 := ["sendinput, !p `n sleep, 300 `n sendinput, n"                                   ,"Build:Clean"]
EC["bd"]                 := ["{F11}"                                                               ,"Build:and.Start.Debug"]


;;;;;;;; vcs
EC["vhis"]               := ["sendinput, {F12} `n sendinput, +{F10} `n sleep, 300 `n sendinput, e"   ,"VCS:Menu.History.Blame.ETC"]
EC["vlog"]               := [_ECAction.Bind( "{F12}", "^3", 100, "git reflog" )                                 ,"VCS:Log"]
EC["vs"]                 := [_ECAction.Bind( "{F12}", "^3", 100, "git staging" )                             ,"VCS:Status"]
EC["vc"]                 := [_ECAction.Bind( "{F12}", "^3", 100, "Commit..." )                               ,"VCS:Commit"]
EC["va"]                 := [_ECAction.Bind( "{F12}", "^3", 100, "Commit..." )                                  ,"VCS:Add"]
EC["vpush"]              := [_ECAction.Bind( "{F12}", "^3", 100, "Push Branch" )                               ,"VCS:Push"]
EC["vpull"]              := [_ECAction.Bind( "{F12}", "^3", 100, "Pul..." )                                    ,"VCS:Pull"]


;;;;;;;; windows
EC["wlist"]              := ["sendinput, !+q `n sleep, 100 `n sendinput, q"                                  ,"Window:List"]
EC["wedit"]              := ["{F12}"                                                                ,"Window:Backto.Editor"]
EC["wdir"]               := ["sendinput, !+q `n sleep, 100 `n sendinput, p"                 ,"Window:Directory.PackageView"]
EC["wlayout"]            := ["^o"                                                            ,"Window:Symbol.Layout.InFile"]
EC["whier"]              := ["{F4}"                                                               ,"Window:Class.Hierarchy"]
EC["wcall"]              := ["^!h"                                                                     ,"Window:Call.Graph"]
EC["wmsg"]               := ["sendinput, !+q `n sleep, 100 `n sendinput, c"                         ,"Window:Build.Message"]
EC["wdebug"]             := [_ECAction.Bind( "{F12}", "^3", 100, "Debug (Debug)" )                    ,"Window:Debug.View"]
EC["wlog"]               := [_ECAction.Bind( "{F12}", "^3", 100, "Logcat (Android)" )           ,"Window:Runtime.Log.Message"]
EC["wplug"]              := ["sendinput, !h `n sleep, 300 `n sendinput, m"                  ,"Window:Plugin.Market.Manager"]
EC["wfull"]              := ["^m"                                                               ,"Window:FullScreen.Toggle"]


;;;;;;;; tool
EC["tpath"]              := [_OSRunTool.Bind("^!c", "copy")                                          ,"Tool:FullPath.Copy"]
EC["tex"]                := [_OSRunTool.Bind("^!c", "explorer")                                    ,"Tool:Explorer.Launch"]
EC["tt"]                 := EC["tex"]
EC["tcmd"]               := [_OSRunTool.Bind("^!c", "cmd")                                   ,"Tool:CommandLine.Interface"]
EC["tedit"]              := [_OSRunTool.Bind("^!c", "editor")                              ,"Tool:OpenWith.ExternalEditor"]


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
;HotIfWinActive("ahk_exe idea64.exe")
HotIfWinActive("ahk_class SWT_Window0")
;;;; move, edit functionality must be defined in shortcut not abbreviation for convenience
;;;;;;;; move
;;;Hotkey("$!Right"      ,EC_MoveNextPostion)            ;;^!Right
;;;Hotkey("$!Left"       ,EC_MovePrevPosition)           ;;^!Left
Hotkey("$!+Up",            EC_PreviewDefinition)          ;;^+i
Hotkey("$!+Down",          EC_JumpToDefinition)           ;;^b
Hotkey("$!+Right",         EC_JumpToOverrideMethod)       ;;^!b
Hotkey("$^tab",            EC_NextFileorTab)              ;;^tab
Hotkey("$^+tab",           EC_PrevFileorTab)              ;;^+tab
;;;Hotkey("$^w"          ,EC_CloseCurrentFile)           ;;^{F4}
;;;Hotkey("$^+t"         ,EC_ReopenRecentFileorTab)      ;;^e
Hotkey("$^g",              EC_JumpToLine)                 ;;^g
Hotkey("$^\",              EC_JumpToMatchingBrace)        ;;^+m
Hotkey("$^F3",             EC_FindWordAtCurrentPosition)  ;;^F3


;;;Hotkey("$^y"          ,EC_Redo)                       ;;^+z
Hotkey("$^d",              EC_DuplicateCurrentLine)       ;;^d
Hotkey("$^+d",             EC_DeleteCurrentLine)          ;;^y
;;;Hotkey("$^/"          ,EC_CommentWithLineComment)     ;;^/
;;;Hotkey("$^+/"         ,EC_CommentWithBlockComment)    ;;^+/
Hotkey("$^+u",             EC_ToggleUpperOrLowerCase)     ;;^+u
Hotkey("$^+i",             EC_IndentBlock)                ;;^!i

;;;;;;;;
HotIfWinActive()
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;; move
EC_MoveNextPostion(*) {          ;;!Right::    ;;move next position
    SendInput("^!{Right}")
}

EC_MovePrevPosition(*) {         ;;!Left::     ;;move previous position
    SendInput("^!{Left}")
}

EC_PreviewDefinition(*) {        ;;!+Up::      ;;preview definition & type
    SendInput("!+q")
    Sleep(300)
    SendInput("d")
}

EC_JumpToDefinition(*) {         ;;!+Down::    ;;jump to definition
    SendInput("{F3}")
}

EC_JumpToOverrideMethod(*) {     ;;!+Right::   ;;jump to Override Method
    ;;_ECAction.Bind( "{F12}", "^3", 100, "Open Implementation" )
    SendInput("^3")
    SendInput("{Text}Open Implementation")
    SendInput("{Enter}")
}

EC_NextFileorTab(*) {            ;;^tab::      ;;next file or tab
    SendInput("^{PgDn}")
}

EC_PrevFileorTab(*) {            ;;^+tab::     ;;previous file or tab
    SendInput("^{PgUp}")
}

EC_CloseCurrentFile(*) {         ;;^w:         ;;close current file
    SendInput(EC["fc"][1])
}

EC_ReopenRecentFileorTab(*) {    ;;^+t:        ;;reopen recent closed tab or file
    ;;MsgBox(A_Hotkey)
    SendInput(EC["frecent"][1])
}

EC_JumpToLine(*) {               ;;^g::        ;;goto line
    SendInput("^l")
}

EC_JumpToMatchingBrace(*) {      ;;^\::        ;;goto matching brace toggle
    SendInput("^+p")
}

EC_FindWordAtCurrentPosition(*) { ;;^F3::       ;;find word at current cursor
    global _t1
    SendInput((_t1 := !_t1) ? "^k" : "^+k")
}

;;;;;;;; edit
EC_Redo(*) {                     ;;^y::        ;;redo
    SendInput("^+z")
}

EC_DuplicateCurrentLine(*) {     ;;^d::        ;;duplicate line
    SendInput("^!{Up}")
}

EC_DeleteCurrentLine(*) {        ;;^+d::       ;;delete line
    SendInput("^d")
}

EC_CommentWithLineComment(*) {   ;;^/::        ;;comment with line-comment
    SendInput("^/")
}

EC_CommentWithBlockComment(*) {  ;;^+/::       ;;comment with block-comment
    SendInput("^+/")
}

EC_ToggleUpperOrLowerCase(*) {   ;;^+u::       ;;toggle upper or lower case
    global _t1
    SendInput((_t1 := !_t1) ? "^+y" : "^+x")
}

EC_IndentBlock(*) {              ;;^!i::       ;;indent block
    SendInput(EC["cindent"][1])
}