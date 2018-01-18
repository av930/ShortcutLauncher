;;;;;;;; list of functions ;;;;;;;;;
;;;; execute program as administrator
;;;; execute Runlist
F_RunMore( RunList* ) {
    For RunNum, RunItem in RunList
        Run %RunItem%
}


F_Admin( RunList* ) { 
    For RunNum, RunItem in RunList
        Run *RunAs %RunItem%
}


;;;; copy text to clipboard
F_CopyText( CopyText ) { 
    Clipboard := CopyText
    TrayTip, Launcher, %CopyText% copied to clipboard
}


;;;; empty trash can
F_EmptyRecycleBin() {
    NumPut( VarSetCapacity( SHQUERYRBINFO,20,0 ), SHQUERYRBINFO )
    DllCall( "Shell32\SHQueryRecycleBinA", Int,0, UInt,&SHQUERYRBINFO )
    If (NumGet( SHQUERYRBINFO, 0 ? 12 : 4,"Int64" )) {
        FileRecycleEmpty
        SoundPlay C:\Windows\media\recycle.wav
    }
}


;;;; go other AHK functions
F_GoSub( Subroutine ) {
    GoSub %Subroutine%
}


;;;; show key input history
F_KeyHist() {
    KeyHistory
}


;;;; show key input history
F_Hotkeys() {
    ListHotkeys
}

;;;; ?
F_ShowMenu( MenuName ) {
    Menu, %MenuName%, Show
}


;;;; explorer exit & restart
F_RestartExplorer( WaitTime = 100 ) {
    PostMessage, 0x12, 0, 0, , ahk_exe explorer.exe ; WM_Quit
    Sleep %WaitTime%
    PostMessage, 0x12, 0, 0, , ahk_exe explorer.exe ; WM_Quit
    Sleep %WaitTime%
    Run %A_Windir%\explorer.exe
}
