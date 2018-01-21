;;;;;;;; list of functions ;;;;;;;;;
;;;; execute program as administrator
;;;; execute Runlist
_OSRunMore( RunList* ) {
    For RunNum, RunItem in RunList
        Run %RunItem%
}


_OSAdmin( RunList* ) { 
    For RunNum, RunItem in RunList
        Run *RunAs %RunItem%
}


;;;; copy text to clipboard
_OSCopyText( CopyText ) { 
    Clipboard := CopyText
    TrayTip, Launcher, %CopyText% copied to clipboard
}


;;;; empty trash can
_OSEmptyRecycleBin() {
    NumPut( VarSetCapacity( SHQUERYRBINFO,20,0 ), SHQUERYRBINFO )
    DllCall( "Shell32\SHQueryRecycleBinA", Int,0, UInt,&SHQUERYRBINFO )
    If (NumGet( SHQUERYRBINFO, 0 ? 12 : 4,"Int64" )) {
        FileRecycleEmpty
        SoundPlay C:\Windows\media\recycle.wav
    }
}


;;;; go other AHK functions
_OSGoSub( Subroutine ) {
    GoSub %Subroutine%
}


;;;; show key input history
_OSKeyHist() {
    KeyHistory
}


;;;; show key input history
_OSHotkeys() {
    ListHotkeys
}

;;;; ?
_OSShowMenu( MenuName ) {
    Menu, %MenuName%, Show
}


;;;; explorer exit & restart
_OSRestartExplorer( WaitTime = 100 ) {
    PostMessage, 0x12, 0, 0, , ahk_exe explorer.exe ; WM_Quit
    Sleep %WaitTime%
    PostMessage, 0x12, 0, 0, , ahk_exe explorer.exe ; WM_Quit
    Sleep %WaitTime%
    Run %A_Windir%\explorer.exe
}
