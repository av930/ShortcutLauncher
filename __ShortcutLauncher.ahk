#Requires AutoHotkey v2.0
SetTitleMatchMode("RegEx")

;; ShortcutLauncher ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

TraySetIcon(A_WorkingDir "\AT.ico", , true)

#SingleInstance Force           ; No dialog when restarting
SendMode("Input")               ; Faster keystrokes
SetWorkingDir(A_ScriptDir)      ; Ensures a consistent starting directory

#Include obj2str.ahk
#Include Exec.ahk
#Include Launcher_DefAction.ahk



;;default for OS
;;add_script
#Include %A_ScriptDir%\ProgramScripts\Launcher_forWindows.ahk
;;Program Editor or IDE 
#Include %A_ScriptDir%\ProgramScripts\Launcher_forBrowser.ahk
#Include %A_ScriptDir%\ProgramScripts\Launcher_forSlimjet.ahk
#Include %A_ScriptDir%\ProgramScripts\Launcher_forIntelliJ.ahk
#Include %A_ScriptDir%\ProgramScripts\Launcher_forAndroidStudio.ahk
#Include %A_ScriptDir%\ProgramScripts\Launcher_forEclipse.ahk
#Include %A_ScriptDir%\ProgramScripts\Launcher_forSourceInsight.ahk
#Include %A_ScriptDir%\ProgramScripts\Launcher_forNotepadPlus.ahk
#Include %A_ScriptDir%\ProgramScripts\Launcher_forSublimeText.ahk
#Include %A_ScriptDir%\ProgramScripts\Launcher_forVSCode.ahk
;;MSOffice & Document Common 
#Include %A_ScriptDir%\ProgramScripts\Launcher_forMSPowerPoint.ahk

;; ===== global launcher state =====
LastQSQuery := "h"
CurMap := OS
list := ""
LauncherGui := ""
QueryEdit := ""
CmdListBox := ""


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Common logic ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CurMap is {abbrev: [command, tag]} - build a "key      : tag|..." pick-list
getKeyfromObj(obj) {
    r := ""
    for e, v in obj {
        if !(v is Array) ;;skip meta entries (name/prog/clas/file), values are plain strings not [command, tag]
            continue
        r .= Format("{:-10}: {:-10}|", e, v[2])
    }
    return Trim(r, "|")
}


ProgramKeyMapper(ProgramKey, Command) {
    ;; debug
    ;Str_MAP := Obj2Str(ProgramKey)
    ;MsgBox(Str_MAP, WinGetTitle("A"))

    ;;must carefully modify here
    if ProgramKey.Has(Command) {

        if IsObject(ProgramKey[Command][1]) { ;;expression bracket attachable
            ProgramKey[Command][1].Call()
        } else {

            CMD := LTrim(SubStr(ProgramKey[Command][1], 1, 3), " ")

            if RegExMatch(CMD, "^[A-Za-z0-9]+$")
            { ;;traditional bracket not must be next line
                Exec(ProgramKey[Command][1])
            }
            else ;;;; is hotkey
            {
                Send(ProgramKey[Command][1])
            }
        }
        return true ;; no-more run next step
    }
    return false
}


;;add_script
ProgramSelect() {
    global CurMap
    CurMap := OS
    if WinActive("ahk_class SunAwtFrame") and WinActive("ahk_exe idea64.exe") {
        CurMap := IJ
    } else if WinActive("ahk_class SunAwtFrame") and WinActive("ahk_exe studio64.exe") {
        CurMap := ADS
    } else if WinActive("ahk_class SWT_Window0") {
        CurMap := EC
    } else if WinActive("ahk_class Notepad\+\+") {
        CurMap := NP
    } else if WinActive("ahk_class si4_Frame") {
        CurMap := SI
    } else if WinActive("ahk_class PX_WINDOW_CLASS") {
        CurMap := ST
    } else if WinActive("ahk_class Chrome_WidgetWin_1") and WinActive("ahk_exe Code.exe") {
        CurMap := VS
    } else if (WinActive("ahk_class Chrome_WidgetWin_1") 
        && (WinActive("ahk_exe Chrome.exe") || WinActive("ahk_exe vivaldi.exe")
            || WinActive("ahk_exe vivalid.exe") || WinActive("ahk_exe vvaldi.exe"))) {
        CurMap := CH
    } else if WinActive("ahk_class Slimjet_WidgetWin_1") {
        CurMap := SCH
    } else if WinActive("ahk_class PPTFrameClass") {
        CurMap := PP
    } else
        CurMap := OS
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Handler ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PopupGoPost(*) {
    global CurMap, OS, LastQSQuery

    Query := QueryEdit.Value
    selected := CmdListBox.Text
    LauncherGui.Destroy()

    ;; sync-up command from editor & list control (within 10 characters)
    if (selected != "")
        Query := Trim(SubStr(selected, 1, 10), " ")

    LastQSQuery := Query
    ;; Mouse double-click is not working, need some delay
    Sleep(200)

    if (ProgramKeyMapper(CurMap, Query) = false)
        if (ProgramKeyMapper(OS, Query) = false) ;;;; nothing matched
            SoundPlay("*-1")
}


AutoComplete(*) {
    global list

    Query := QueryEdit.Value
    list_alias := "", list_content := ""

    for field in StrSplit(list, "|") { ;; parse the list to see if the name is in it
        if (SubStr(field, 1, StrLen(Query)) = Query) {
            list_alias .= field "|" ;match starting string
            continue
        }
        if InStr(field, Query)
            list_content .= field "|" ; populate the new list
    }

    list_multi := Trim(list_alias . list_content, "|")

    CmdListBox.Delete()
    if (list_multi != "") {
        CmdListBox.Add(StrSplit(list_multi, "|"))
        CmdListBox.Choose(1) ;; focus the best (starts-with) match
    }
}


GuiClose(*) {
    global LauncherGui
    if LauncherGui
        LauncherGui.Destroy()
}


;; Abbreviation Trigger
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#q:: {
    global CurMap, LastQSQuery, list, LauncherGui, QueryEdit, CmdListBox

    ProgramSelect()
    list := getKeyfromObj(CurMap)

    LauncherGui := Gui("+AlwaysOnTop", "Launcher - " CurMap["name"])
    LauncherGui.SetFont("s12", "Consolas")
    QueryEdit := LauncherGui.Add("Edit", "x5 y5 w600 h25 vQuery", LastQSQuery)
    QueryEdit.OnEvent("Change", AutoComplete)
    CmdListBox := LauncherGui.Add("ListBox", "x5 y40 w628 r20", StrSplit(list, "|"))
    CmdListBox.OnEvent("DoubleClick", PopupGoPost)
    GoBtn := LauncherGui.Add("Button", "x610 y5 w25 h25 +Default", "G")
    GoBtn.OnEvent("Click", PopupGoPost)
    LauncherGui.OnEvent("Close", GuiClose)
    LauncherGui.OnEvent("Escape", GuiClose)

    ;;Move GUI to Current Monitor
    WinGetPos(&X, &Y, &Width, &Height, "A")
    WPosX := X + Width / 3
    WPosY := Y + Height / 3

    ;; when windows, force to locate (600, 400)
    if (CurMap == OS) {
        WPosX := 600
        WPosY := 400
    }
    LauncherGui.Show("x" WPosX " y" WPosY)
}


;;;;static hotkey define
#HotIf WinActive("^Launcher - .*$")
$Up::ControlSend("{Up}", "ListBox1", "Launcher - ")
$Down::ControlSend("{Down}", "ListBox1", "Launcher - ")
$Esc::GuiClose()
#HotIf