PP := {}
PP["name"] := "MS PowerPoint"
PP[prog] := POWERPNT.exe
PP[clas] := PPTFrameClass

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; unique action list
_PPAction( Menu, Sleep, Key ) {
    ;;MsgBox, %Menu%, %Sleep%, %Key%
    SendInput, %Menu%

    WinWaitActive, % "ahk_class PPTFrameClass ahk_exe " . PP[prog]
    Sleep %Sleep%
    SendInput, {delete}%Key%
    WinWaitClose,  % "ahk_class PPTFrameClass ahk_exe " . PP[prog]
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; basic rule of shortcuts
;;;; length of abbreviation should be under 2~5 char.
;;;; basic sequence of chars (object - action - target) or (object - sub object)
;;;; count functionality ends with ~c (means count)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Example
;; PP.fa                := ["^s"                                                                            ,"hotkey"]
;; PP.fb                := ["sendinput, ^s"                                                         ,"single command"]
;; PP.fc                := ["sendinput, ^+a `n sleep, 500 `n sendinput, {text}Close All "           ,"multi commands"]
;; PP.fd                := [Func( "_SIAction" ).Bind( "^+a", 500, "{text}File Encoding" )            ,"function call"]


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; abbreviation definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;; program
PP.pset                 := ["sendinput, !f `n sleep, 300 `n sendinput, t"                         ,"Program:Settings"]
;;;;;;;; file
PP.fo                   := ["sendinput, !f `n sleep, 300 `n sendinput, o"                                ,"File:Open"]
PP.frecent              := ["sendinput, !f `n sleep, 300 `n sendinput, or"                        ,"File:Open.Recent"]
PP.fc                   := ["sendinput, !f `n sleep, 300 `n sendinput, c"                               ,"File:Close"]
;;;;;;;; symbol search
PP.sfind                := ["^f",                                                     ,"Symbol:String.Find.inProject"]
PP.sreplace             := ["^h"                                                   ,"Symbol:String.Replace.inProject"]
;;;;;;;; windows & view
PP.wfull                := ["+{F5}"                                                      ,"Window:FullScreen.Current"]
PP.wmatrixline          := ["+{F9}"                                                        ,"Window:view.line.matrix"]
PP.wguidline            := ["!{F9}"                                                         ,"Window:view.line.guide"]
PP.wruler               := ["!+{F9}"                                                        ,"Window:view.line.ruler"]
;;;;;;;; MS office Common Key
PP.ribbon               := ["^{F1}"                                                  ,"Window:Menu.Toggle.RibbonMenu"]
PP.dupw                 := ["sendinput, !w `n sleep, 300 `n sendinput, n"                  ,"Window:Window.Duplicate"]
 
;;;;;;;; edit
PP.newf                 := ["^n",                                                                 ,"File:Add.NewFile"]
PP.newp                 := ["^m"                                                                  ,"File:Add.NewPage"]
PP.dup                  := ["^d"                                                        ,"File:Duplicate.Page&Object"]
 



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; shortcut keymap definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GroupAdd, OfficeGroup, ahk_class PPTFrameClass
GroupAdd, OfficeGroup, ahk_class rctrl_renwnd*

Hotkey, IfWinActive, ahk_group Officegroup
;;Hotkey, IfWinActive, ahk_class PPTFrameClass || ahk_class rctrl_renwnd*
;;Hotkey, IfWinActive, ahk_class PPTFrameClass
;;;; move, edit functionality must be defined in shortcut not abbreviation for convenience
;;;;;;;;;; opengrok utilities
;;;;;;;; move
;;;Hotkey, $^tab        ,PP.NextFileorTab
;;;Hotkey, $^+tab       ,PP.PrevFileorTab
;;;Hotkey, $^w          ,PP.CloseCurrentFile            


;;;;;;;;;;; edit
;;;Hotkey, $^y          ,PP.Redo
;;;conflict with duplicate objects
;;;Hotkey, $^d          ,PP.DuplicateCurrentLine
   Hotkey, $^+d         ,PP.DeleteCurrentLine
   Hotkey, $^+u         ,PP.ToggleUpperOrLowerCase
   Hotkey, $^.          ,PP.ListBullet
   Hotkey, $^/          ,PP.ListNumber


;;;;;;;;
Hotkey, IfWinActive
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Goto, PP.EndOfFile


;;;;;;;; move
PP.NextFileorTab:                ;;^tab::      ;;next file or tab
    sendinput, ^{tab}
    return

PP.PrevFileorTab:                ;;^+tab::     ;;previous file or tab
    sendinput, ^+{tab}
    return

PP.CloseCurrentFile:             ;;^w:         ;;close current file
    sendinput, % PP.fc[1]
    return
    

;;;;;;;; edit
PP.Redo:                         ;;^y::        ;;redo
    sendinput, ^+z
    return

PP.DuplicateCurrentLine:         ;;^d::        ;;duplicate line
    sendinput, {HOME}
    sendinput, {SHIFT DOWN}{END}{SHIFT UP}
    sendinput, ^c
    sendinput, {END}{Enter}
    sendinput, ^v
    return

PP.DeleteCurrentLine:            ;;^+d::       ;;delete line
    sendinput, {HOME}
    sendinput, {SHIFT DOWN}{END}{SHIFT UP}
    sendinput, {Del}{Del}
    return

PP.ToggleUpperOrLowerCase:       ;;^+u::       ;;toggle upper or lower case
    sendinput, +{F3}
    return


PP.ListBullet:                   ;;^\::        ;;Confluence edit-mode, bullet-list
    sendinput, !h
    sendinput, u
    return

PP.ListNumber:                   ;;^\::        ;;Confluence edit-mode, number-list
    sendinput, !h
    sendinput, n
    return


PP.EndOfFile: