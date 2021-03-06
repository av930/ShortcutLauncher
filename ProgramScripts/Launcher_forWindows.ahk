OS := {}
OS["name"] := "Windows OS"
OS[prog] := all.exe
OS[clas] := all
OS[file] := "Windows"



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; abbreviation definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;refer: https://autohotkey.com/docs/Variables.htm#os

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;; userdefined definitions
global _OSEditor        := "D:\OneDrive\_MyProgram\_IDEditor\Notepad++\Notepad++.exe"
global _OSTerminal      := "D:\OneDrive\_MyProgram\_Shell\_ConEmu\ConEmu64.exe"
_OSExplorer             := "D:\OneDrive\_MyProgram\_FileBrowser\_Q-Dir_portable\Q-Dir.exe"
_OSFTP                  := "D:\OneDrive\_MyProgram\_WebComm\_winscp\winscp.exe"
_OSIMG                  := "D:\OneDrive\_MyProgram\_MultiMedia\IrfanView\i_view32.exe"

;;;;;;;; userdefined actions
OS.ex                   := ["Run," . _OSExplorer                                                         ,"Program:FileBrowser"]
OS.ftp                  := ["Run," . _OSFTP                                                                   ,"Program:WinSCP"]
OS.img                  := ["Run," . _OSIMG                                                              ,"Program:imageviewer"]
OS.term                 := ["!{delete}"                                                                     ,"Program:Terminal"]


;;;;;;;; Autohotkey        
OS.hotkey               := [Func( "_OSHotKeys" )                                             ,"Autohotkey:list.AssignedHotkeys"]

;;;;;;;; Favorite Directories
OS.c                    := ["Run, c:\"                                                                     ,"Directory:C-drive"]
OS.d                    := ["Run, d:\"                                                                     ,"Directory:D-drive"]
OS.pf                   := ["Run," . A_ProgramFiles                                                  ,"Directory:Program Files"]
OS.pfa                  := [Func( "_OSRunMore" ).Bind( "C:\Program Files\", A_ProgramFiles )         ,"Directory:Program Files"] 
OS.startup              := [Func( "_OSRunMore" ).Bind( "shell:startup" )                                   ,"Directory:StartUp"]
OS.doc                  := ["Run," . A_MyDocuments ,                                                     "Directory:MyDocument"]
OS.down                 := [Func( "_OSRunMore" ).Bind( "shell:::{374DE290-123F-4565-9164-39C4925E467B}")  ,"Directory:Download"]
OS.qlaunch              := [Func( "_OSRunMore" ).Bind( "shell:Quick Launch" )                          ,"Directory:QuickLaunch"]

;;;;;;;; goto Windows Tools
OS.control              := ["Run, Control Panel"                                                         ,"Window:ControlPanel"]
OS.install              := [Func( "_OSRunMore" ).Bind( "shell:ChangeRemoveProgramsFolder" )     ,"Window:ProgramInstall&Remove"]


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; shortcut keymap definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;; move, edit functionality must be defined in shortcut not abbreviation for convenience

;;;Hotkey, $^l          ,OS.AlignLeft                   ;;^l
;;;Hotkey, $^r          ,OS.AlignRight                  ;;^r
;;;Hotkey, $^e          ,OS.AligncEnter                 ;;^e
;;;Hotkey, $^j          ,OS.AlignJustify                ;;^j
   Hotkey, $#1          ,OS.EditScript



;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Goto, OS.EndOfFile


OS.IndentBlock:                  ;;^!i::       ;;indent block
    sendinput, % OS.cindent[1]
    return

OS.InOutdentBlock:               ;;!+{Right}/{Left}::       ;;in/outdent block
    sendinput, % (_t1 := !_t1) ? ("!+{Right}") : ("!+{Left}")
    return

OS.ScaleUpDownFontSize:          ;;^+>/<::     ;;scale up/down font size
    sendinput, % (_t1 := !_t1) ? ("^+>") : ("^+<")
    return

OS.ToggleGroup:                  ;;^g::       ;;toggle group
    sendinput, % (_t1 := !_t1) ? ("^g") : ("^+g")
    return

OS.EditScript:     
    Gosub ProgramSelect
    ;msgbox, % MAP[file]
    _OSEditScript( MAP[file] )
    return

OS.EndOfFile:
