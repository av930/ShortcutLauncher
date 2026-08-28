OS := Map()
OS["name"] := "Windows OS"
OS["prog"] := "all.exe"
OS["clas"] := "all"
OS["file"] := "Windows"



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; abbreviation definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;refer: https://autohotkey.com/docs/Variables.htm#os

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;; userdefined definitions
global _OSEditor        := "D:\.gradle\OneDrive\_MyProgram\_IDEditor\Notepad++\Notepad++.exe"
global _OSTerminal      := "D:\.gradle\OneDrive\_MyProgram\_Shell\_ConEmu\ConEmu64.exe"
_OSExplorer             := "D:\.gradle\OneDrive\_MyProgram\_FileBrowser\_Q-Dir_portable\Q-Dir.exe"
_OSFTP                  := "D:\.gradle\OneDrive\_MyProgram\_WebComm\_winscp\winscp.exe"
_OSIMG                  := "D:\.gradle\OneDrive\_MyProgram\_MultiMedia\IrfanView\i_view32.exe"

;;;;;;;; userdefined actions
OS["ex"]                := ["Run," . _OSExplorer                                                         ,"Program:FileBrowser"]
OS["ftp"]               := ["Run," . _OSFTP                                                                   ,"Program:WinSCP"]
OS["img"]               := ["Run," . _OSIMG                                                              ,"Program:imageviewer"]
OS["term"]              := ["!{delete}"                                                                     ,"Program:Terminal"]


;;;;;;;; Autohotkey        
OS["hotkey"]            := [_OSHotKeys                                                       ,"Autohotkey:list.AssignedHotkeys"]


;;;;;;;; goto Windows Tools
OS["control"]           := ["Run, Control Panel"                                                         ,"Window:ControlPanel"]
OS["install"]           := ["Run, Appwiz.cpl"                                                   ,"Window:ProgramInstall&Remove"]

;;;;;;;; Favorite Directories
OS["c"]                 := ["Run, c:\"                                                                     ,"Directory:C-drive"]
OS["d"]                 := ["Run, d:\"                                                                     ,"Directory:D-drive"]
OS["pf"]                := ["Run," . A_ProgramFiles                                                  ,"Directory:Program Files"]
OS["pfa"]               := [_OSRunMore.Bind( "C:\Program Files\", A_ProgramFiles )                   ,"Directory:Program Files"]
OS["startup"]           := [_OSRunMore.Bind( "shell:startup" )                                             ,"Directory:StartUp"]
OS["doc"]               := ["Run," . A_MyDocuments ,                                                     "Directory:MyDocument"]
OS["down"]              := [_OSRunMore.Bind( "shell:::{374DE290-123F-4565-9164-39C4925E467B}")            ,"Directory:Download"]
OS["qlaunch"]           := [_OSRunMore.Bind( "shell:Quick Launch" )                                      ,"Directory:QuickLaunch"]




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; shortcut keymap definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;; move, edit functionality must be defined in shortcut not abbreviation for convenience

;;;Hotkey("$^l"          ,OS_AlignLeft)                   ;;^l
;;;Hotkey("$^r"          ,OS_AlignRight)                  ;;^r
;;;Hotkey("$^e"          ,OS_AligncEnter)                 ;;^e
Hotkey("$^+m",             OS_DoNothing)                   ;;^j
;;;Hotkey("$^j"          ,OS_AlignJustify)                ;;^j
Hotkey("$#1",              OS_EditScript)



;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

OS_IndentBlock(*) {              ;;^!i::       ;;indent block
    SendInput(OS["cindent"][1])
}

OS_InOutdentBlock(*) {           ;;!+{Right}/{Left}::       ;;in/outdent block
    global _t1
    SendInput((_t1 := !_t1) ? "!+{Right}" : "!+{Left}")
}

OS_ScaleUpDownFontSize(*) {      ;;^+>/<::     ;;scale up/down font size
    global _t1
    SendInput((_t1 := !_t1) ? "^+>" : "^+<")
}

OS_ToggleGroup(*) {              ;;^g::       ;;toggle group
    global _t1
    SendInput((_t1 := !_t1) ? "^g" : "^+g")
}

OS_EditScript(*) {
    ProgramSelect()
    ;MsgBox(CurMap["file"])
    _OSEditScript(CurMap["file"])
}

OS_DoNothing(*) {
    ;MsgBox(CurMap["file"])
}
