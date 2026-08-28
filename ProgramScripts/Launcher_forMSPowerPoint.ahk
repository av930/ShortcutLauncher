;;MS PowerPoint, Outlook
PP := Map()
PP["name"] := "MS PowerPoint"
PP["prog"] := "POWERPNT.exe"
PP["clas"] := "PPTFrameClass"
PP["file"] := "MSPowerPoint"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; unique action list
_PPAction(Menu, Sleep, Key) {
    ;;MsgBox(Menu, Sleep, Key)
    SendInput(Menu)

    WinWaitActive("ahk_class PPTFrameClass ahk_exe " . PP["prog"])
    Sleep(Sleep)
    SendInput("{delete}" Key)
    WinWaitClose("ahk_class PPTFrameClass ahk_exe " . PP["prog"])
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; basic rule of shortcuts
;;;; length of abbreviation should be under 2~5 char.
;;;; basic sequence of chars (object - action - target) or (object - sub object)
;;;; count functionality ends with ~c (means count)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Example
;; PP["fa"]             := ["^s"                                                                            ,"hotkey"]
;; PP["fb"]             := ["sendinput, ^s"                                                         ,"single command"]
;; PP["fc"]             := ["sendinput, ^+a `n sleep, 500 `n sendinput, {text}Close All "           ,"multi commands"]
;; PP["fd"]             := [_SIAction.Bind( "^+a", 500, "{text}File Encoding" )                     ,"function call"]


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; abbreviation definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;; program
PP["tt"]                 := ["sendinput, !f `n sleep, 300 `n sendinput, iu1"                      ,"File:Open.FileDir"]
PP["pset"]               := ["sendinput, !f `n sleep, 300 `n sendinput, t"                         ,"Program:Settings"]
;;;;;;;; file
PP["fo"]                 := ["sendinput, !f `n sleep, 300 `n sendinput, o"                                ,"File:Open"]
PP["frecent"]            := ["sendinput, !f `n sleep, 300 `n sendinput, or"                        ,"File:Open.Recent"]
PP["fc"]                 := ["sendinput, !f `n sleep, 300 `n sendinput, c"                               ,"File:Close"]
;;;;;;;; symbol search
PP["sfind"]              := ["^f"                                                     ,"Symbol:String.Find.inProject"]
PP["sreplace"]           := ["^h"                                                   ,"Symbol:String.Replace.inProject"]
;;;;;;;; windows & view
PP["wfull"]              := ["+{F5}"                                                      ,"Window:FullScreen.Current"]
PP["wmatrixline"]        := ["+{F9}"                                                        ,"Window:view.line.matrix"]
PP["wguidline"]          := ["!{F9}"                                                         ,"Window:view.line.guide"]
PP["wruler"]             := ["!+{F9}"                                                        ,"Window:view.line.ruler"]
;;;;;;;; MS office Common Key
PP["ribbon"]             := ["^{F1}"                                                  ,"Window:Menu.Toggle.RibbonMenu"]
PP["dupw"]               := ["sendinput, !w `n sleep, 300 `n sendinput, n"                  ,"Window:Window.Duplicate"]

;;;;;;;; edit
PP["newf"]               := ["^n"                                                                 ,"File:Add.NewFile"]
PP["newp"]               := ["^m"                                                                  ,"File:Add.NewPage"]
PP["dup"]                := ["^d"                                                        ,"File:Duplicate.Page&Object"]



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; shortcut keymap definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;PowerPoint
GroupAdd("OfficeGroup", "ahk_class PPTFrameClass")
;;Outlook
GroupAdd("OfficeGroup", "ahk_class rctrl_renwnd*")

HotIfWinActive("ahk_group OfficeGroup")
;;HotIfWinActive("ahk_class PPTFrameClass || ahk_class rctrl_renwnd*")
;;HotIfWinActive("ahk_class PPTFrameClass")
;;;; move, edit functionality must be defined in shortcut not abbreviation for convenience
;;;;;;;;;; opengrok utilities
;;;;;;;; move
;;;Hotkey("$^tab"        ,PP_NextFileorTab)
;;;Hotkey("$^+tab"       ,PP_PrevFileorTab)
;;;Hotkey("$^w"          ,PP_CloseCurrentFile)
Hotkey("$tab",             PP_IndentBlock)
Hotkey("$+tab",            PP_InOutdentBlock)


;;;;;;;;;;; edit
;;;Hotkey("$^y"          ,PP_Redo)
;;;conflict with duplicate objects
;;;Hotkey("$^d"          ,PP_DuplicateCurrentLine)
Hotkey("$^+d",             PP_DeleteCurrentLine)
Hotkey("$^+u",             PP_ToggleUpperOrLowerCase)
Hotkey("$^.",              PP_ListBullet)
Hotkey("$^/",              PP_ListNumber)


;;;;;;;;
HotIfWinActive()
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;; move
PP_NextFileorTab(*) {            ;;^tab::      ;;next file or tab
    SendInput("^{tab}")
}

PP_PrevFileorTab(*) {            ;;^+tab::     ;;previous file or tab
    SendInput("^+{tab}")
}

PP_CloseCurrentFile(*) {         ;;^w:         ;;close current file
    SendInput(PP["fc"][1])
}

PP_IndentBlock(*) {              ;;^!i::       ;;indent block
    SendInput("!+{Right}")
}

PP_InOutdentBlock(*) {           ;;!+{Right}/{Left}::       ;;in/outdent block
    SendInput("!+{Left}")
}


;;;;;;;; edit
PP_Redo(*) {                     ;;^y::        ;;redo
    SendInput("^+z")
}

PP_DuplicateCurrentLine(*) {     ;;^d::        ;;duplicate line
    SendInput("{HOME}")
    SendInput("{SHIFT DOWN}{END}{SHIFT UP}")
    SendInput("^c")
    SendInput("{END}{Enter}")
    SendInput("^v")
}

PP_DeleteCurrentLine(*) {        ;;^+d::       ;;delete line
    SendInput("{HOME}")
    SendInput("{SHIFT DOWN}{END}{SHIFT UP}")
    SendInput("{Del}{Del}")
}

PP_ToggleUpperOrLowerCase(*) {   ;;^+u::       ;;toggle upper or lower case
    SendInput("+{F3}")
}


PP_ListBullet(*) {                ;;^\::        ;;Confluence edit-mode, bullet-list
    SendInput("!h")
    SendInput("u")
}

PP_ListNumber(*) {                ;;^\::        ;;Confluence edit-mode, number-list
    SendInput("!h")
    SendInput("n")
}