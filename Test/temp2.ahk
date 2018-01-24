#SingleInstance Force     
GroupAdd, BrowserGroup, ahk_class Chrome_WidgetWin_1
GroupAdd, BrowserGroup, ahk_class MozillaWindowClass
GroupAdd, BrowserGroup, ahk_class ApplicationFrameWindow
GroupAdd, BrowserGroup, ahk_class Notepad

Hotkey, IfWinActive, ahk_group BrowserGroup
  Hotkey, ^W, Oops 
  Hotkey, !F4, Oops 
  Hotkey, ^F4, Oops 
Hotkey, IfWinActive

Oops:
   MsgBox, Oops! You pressed %A_ThisHotkey%
Return