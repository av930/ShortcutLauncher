OS := {}
OS["name"] := "Windows OS"
OS[prog] := all.exe
OS[clas] := all



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
OS.ex                   := ["Run," . _OSExplorer                                                         ,"program.FileBrowser"]
OS.ftp                  := ["Run," . _OSFTP                                                                   ,"program.WinSCP"]
OS.img                  := ["Run," . _OSIMG                                                              ,"program.imageviewer"]
OS.term                 := ["!{delete}"                                                                     ,"program.Terminal"]


;;;;;;;; Autohotkey        
OS.hotkey               := [Func( "_OSHotKeys" )                                             ,"autohotkey.list.AssignedHotkeys"]

;;;;;;;; Favorite Directories
OS.c                    := ["Run, c:\"                                                                     ,"directory.C-drive"]
OS.d                    := ["Run, d:\"                                                                     ,"directory.D-drive"]
OS.pf                   := ["Run," . A_ProgramFiles                                                  ,"directory.Program Files"]
OS.pfa                  := [Func( "_OSRunMore" ).Bind( "C:\Program Files\", A_ProgramFiles )         ,"directory.Program Files"] 
OS.startup              := [Func( "_OSRunMore" ).Bind( "shell:startup" )                                   ,"directory.StartUp"]
OS.doc                  := ["Run," . A_MyDocuments ,"directory: MyDocument"]
OS.down                 := [Func( "_OSRunMore" ).Bind( "shell:::{374DE290-123F-4565-9164-39C4925E467B}")  ,"directory.Download"]
OS.qlaunch              := [Func( "_OSRunMore" ).Bind( "shell:Quick Launch" )                          ,"directory.QuickLaunch"]

;;;;;;;; goto Windows Tools
OS.control              := ["Run, Control Panel"                                                         ,"window.ControlPanel"]
OS.install              := [Func( "_OSRunMore" ).Bind( "shell:ChangeRemoveProgramsFolder" )     ,"window.ProgramInstall&Remove"]

;;;;;;;; do Small function
OS.ip                   := [Func( "_OSCopyText" ).Bind( A_IPAddress1 )                               ,"copy current IP address"]

;;;;;;;; MS office Common Key
OS.ribbon               := ["^{F1}"                                                                   ,"Menu.Toggle.RibbonMenu"]
OS.newins               := ["sendinput, !w `n sleep, 300 `n sendinput, n"                                 ,"Window.NewInstance"]



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; shortcut keymap definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;; move, edit functionality must be defined in shortcut not abbreviation for convenience
;;;;;;;; move
;;;Hotkey, $^tab        ,OS.NextFileorTab               ;;^tab
;;;Hotkey, $^+tab       ,OS.PrevFileorTab               ;;^+tab
;;;Hotkey, $^w          ,OS.CloseCurrentFile            ;;^{F4}
;;;Hotkey, $^g          ,OS.JumpToLine                  ;;^g

;;;;;;;; edit
;;;Hotkey, $^y          ,OS.Redo                        ;;^+z
;;;Hotkey, $^d          ,OS.DuplicateCurrentLine        ;;^d
;;;Hotkey, $^+d         ,OS.DeleteCurrentLine           ;;^y
;;;Hotkey, $!+i         ,OS.InOutdentBlock              ;;!+-><-

;;;Hotkey, $^+c         ,OS.CopyFormatOfObject          ;;^+c
;;;Hotkey, $^+v         ,OS.PasteFormatOfObject         ;;^+v
;;;Hotkey, $^+>         ,OS.ScaleUpDownFontSize         ;;^+><
;;;Hotkey, $^+u         ,OS.ToggleUpperOrLowerCase      ;;^+u
;;;Hotkey, $^g          ,OS.ToggleGroup                 ;;^g
;;;Hotkey, $^b          ,OS.ToggleBold                  ;;^b
;;;Hotkey, $^u          ,OS.ToggleUnderline             ;;^u
;;;Hotkey, $^i          ,OS.ToggleItalic                ;;^i
;;;Hotkey, $^=          ,OS.ToggleUnderUpperCharacter   ;;^=
;;;Hotkey, $^l          ,OS.AlignLeft                   ;;^l
;;;Hotkey, $^r          ,OS.AlignRight                  ;;^r
;;;Hotkey, $^e          ,OS.AligncEnter                 ;;^e
;;;Hotkey, $^j          ,OS.AlignJustify                ;;^j




;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Goto, OS.EndOfFile

    

OS.DuplicateCurrentLine:         ;;^d::        ;;duplicate line
    sendinput, ^d
    return

OS.DeleteCurrentLine:            ;;^+d::       ;;delete line
    sendinput, ^y
    return

OS.ToggleUpperOrLowerCase:       ;;^+u::       ;;toggle upper or lower case
    sendinput, +{F3}
    return

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

OS.EndOfFile: