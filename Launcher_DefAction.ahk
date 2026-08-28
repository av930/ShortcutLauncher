;;;;;;;; list of functions ;;;;;;;;;
;;;; execute program as administrator
;;;; execute Runlist
_OSRunMore(RunList*) {
    for RunNum, RunItem in RunList
        Run(RunItem)
}


_OSAdmin(RunList*) {
    for RunNum, RunItem in RunList
        try
            Run("*RunAs " RunItem)
        catch as e
            return
}

_OSWARN(Msg) {
    MsgBox(Msg, "Warning", 0x13)
}


;;;; copy text to clipboard
_OSCopyText(CopyText) {
    A_Clipboard := CopyText
    TrayTip(CopyText . " copied to clipboard", "Launcher")
}


_OSRunTool(PathCmd, Tool) {
    Send(PathCmd)

    Sleep(300)
    fullName := A_Clipboard
    SplitPath(fullName, &name, &dir, &ext, &name_noext, &drive)
    ;;MsgBox(name "][" dir "][" Tool)

    if (Tool == "explorer") {
        Run(dir)
    } else if (Tool == "cmd") {
        if (_OSTerminal == "")
            Run("cmd.exe /K cd /d " dir)
        else
            Run(_OSTerminal . " -reuse /dir " . dir)

    } else if (Tool == "shell") {
        Run("_SHELL.cmd " dir)
    } else if (Tool == "editor") {
        if (_OSEditor == "")
            Run("notepad.exe " fullName)
        else
            Run(_OSEditor " " fullName)
    }
}


_OSEditScript(FileName) {
    FullPathName := A_ScriptDir . "\ProgramScripts\Launcher_for" . FileName . ".ahk"
    if (_OSEditor == "")
        Run("notepad.exe " FullPathName)
    else
        Run(_OSEditor " " FullPathName)
}


;;;; empty trash can
_OSEmptyRecycleBin() {
    buf := Buffer(20, 0)
    DllCall("Shell32\SHQueryRecycleBinA", "Ptr", 0, "Ptr", buf)
    if (NumGet(buf, A_PtrSize = 8 ? 12 : 4, "Int64")) {
        FileRecycleEmpty()
        SoundPlay("C:\Windows\media\recycle.wav")
    }
}


;;;; show key input history
_OSKeyHist() {
    KeyHistory()
}


;;;; show key input history
_OSHotkeys() {
    ListHotkeys()
}

;;;; explorer exit & restart
_OSRestartExplorer(WaitTime := 100) {
    PostMessage(0x12, 0, 0, , "ahk_exe explorer.exe") ; WM_Quit
    Sleep(WaitTime)
    PostMessage(0x12, 0, 0, , "ahk_exe explorer.exe") ; WM_Quit
    Sleep(WaitTime)
    Run(A_WinDir . "\explorer.exe")
}
