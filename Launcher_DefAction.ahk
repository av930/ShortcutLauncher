;;;;;;;; list of functions ;;;;;;;;;
;;;; execute program as administrator
;;;; execute Runlist
_OSRunMore( RunList* ) {
    For RunNum, RunItem in RunList
        Run %RunItem%
}


_OSAdmin( RunList* ) { 
    For RunNum, RunItem in RunList
        try  
            Run *RunAs %RunItem%
        catch e  
            Exit
}

_OSWARN( Msg ) { 
    Msgbox,0x13,Warning,%Msg%,1
}


;;;; copy text to clipboard
_OSCopyText( CopyText ) { 
    Clipboard := CopyText
    TrayTip, Launcher, %CopyText% copied to clipboard
}


_OSRunTool( PathCmd, Tool ) { 
    send %PathCmd%
    
    Sleep, 300
    fullName := Clipboard
    SplitPath, fullName, name, dir, ext, name_noext, drive
    ;;MsgBox, % name  "]["  dir  "]["  Tool
    
    if (Tool == "explorer")         {
        run, % dir
    }else if (Tool == "cmd")        {
        if ( _OSTerminal == "" )
            run, cmd.exe  /K cd /d %dir%
        else
            run, % _OSTerminal .  " -reuse /dir " . dir
        
    }else if (Tool == "editor")     {
        if ( _OSEditor == "" )
            run, notepad.exe %fullname%
        else
            run, %_OSEditor% %fullname%
    }
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
