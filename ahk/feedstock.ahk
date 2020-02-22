;;; 2019-03-23 https://gist.github.com/dguo/29ec31329bc3ab1d01c845d34fa72e8f
; note the use of * to include any prefix/combination
*CapsLock::
    Send {Blind}{Ctrl Down}
    cDown := A_TickCount
Return

*CapsLock up::
    ; Modify the threshold time (in milliseconds) as necessary
    If ((A_TickCount-cDown) < 150)
        Send {Blind}{Ctrl Up}{Esc}
    Else
        Send {Blind}{Ctrl Up}
Return

;;; 2016-11-23 https://github.com/Vonng/Capslock/blob/master/win/CapsLock.ahk
; very comprehensive but out of date

;;; 2017-09-27 https://gist.github.com/volks73/1e889e01ad0a736159a5d56268a300a8
; Change Caps Lock to Control when held down; otherwise, Escape
;
; Originally based on the answer provided in 
; [this](https://superuser.com/questions/581692/remap-caps-lock-in-windows-escape-and-control)
; StackExchange SuperUser question.
;
; A shortcut should be created for this script and placed in the Windows 10
; user's startup folder to automatically enable the feature on boot/startup.
; The user's startup folder can be found using the following steps:
;
; 1. Windows Key+R. The _Run_ dialog will appear.
; 2. Enter the following: `%appdata%\Microsoft\Windows\Start Menu\Programs\Startup`
; 3. Press Enter key. A file explorer dialog will appear.
; 
; Obviously, [AutoHotkey](https://autohotkey.com/) must be installed for this to work.
*CapsLock::
    Send {Blind}{Ctrl Down}
    cDown := A_TickCount
Return

*CapsLock up::
    If ((A_TickCount-cDown)<400)  ; Modify press time as needed (milliseconds)
        Send {Blind}{Ctrl Up}{Esc}
    Else
        Send {Blind}{Ctrl Up}
Return

;;; 2018-05-28 https://github.com/fenwar/ahk-caps-ctrl-esc/blob/master/AutoHotkey.ahk
; Map Capslock to Control
; Map press & release of Capslock with no other key to Esc
; Press both shift keys together to toggle Capslock

*Capslock::
    Send {Blind}{LControl down}
    return

*Capslock up::
    Send {Blind}{LControl up}
    ; Tooltip, %A_PRIORKEY%
    ; SetTimer, RemoveTooltip, 1000
    if A_PRIORKEY = CapsLock
    {
        	Send {Esc}
    }
    return

RemoveTooltip(){
    SetTimer, RemoveTooltip, Off
    Tooltip
    return
}

ToggleCaps(){
    ; this is needed because by default, AHK turns CapsLock off before doing Send
    SetStoreCapsLockMode, Off
    Send {CapsLock}
    SetStoreCapsLockMode, On
    return
}
LShift & RShift::ToggleCaps()
RShift & LShift::ToggleCaps()

; ^!r::Reload

;;; 2019-12-28 https://gist.github.com/jarileskinen/ff5065621fe0fd1896dcb1fdd3ea7174
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Make Caps lock have the following behavior:
; - Short press (less than 0.4 seconds): send Escape key.
; - Press and hold: Holds down Control key.
CapsLock::
Send, {Ctrl down}
KeyWait, CapsLock, T0.4
if ErrorLevel { ; Timed-out.
  KeyWait, CapsLock
  Send, {Ctrl up}
}
else { ; Caps lock was released within 0.4 s.
  if (A_PriorKey = "CapsLock") {
    Send, {Ctrl up}
    Send, {Esc}
  }
  else {
    Send, {Ctrl up}
  }
}
return

+CapsLock::
Send, {Shift down}{Ctrl down}
KeyWait, CapsLock
Send, {Shift up}{Ctrl up}

!CapsLock::
Send, {Alt down}{Ctrl down}
KeyWait, CapsLock
Send, {Alt up}{Ctrl up}

#CapsLock::
Send, {Win down}{Ctrl down}
KeyWait, CapsLock
Send, {Win up}{Ctrl up}