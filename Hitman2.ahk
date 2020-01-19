; Little script to create toggle buttons for Hitman 2, by mikeInside 2019
; [1] Toggle move forward (Holds down W)
; [2] Toggle run (Holds down SHIFT)
; [3] Toggle vision (Holds down CTRL)
; [s] Stop all movement
; [Left Alt] Turn off all toggles


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
SendMode Input
#Persistent  ; Prevent the script from exiting automatically.

if not A_IsAdmin
{
   Run *RunAs "%A_ScriptFullPath%"  ; Requires v1.0.92.01+
   ExitApp
}

OnExit, ExitSub  
return

*$1::
;automove := !automove
if (GetKeyState("w"))
	Send {w up}
else
	Send {w down}
return

*$2::
;runtoggle := !runtoggle
if (GetKeyState("LShift"))
	Send {LShift up}
else
	Send {LShift down}
return

*$3::
;vision := !vision
if (GetKeyState("LCtrl"))
	Send {LCtrl up}
else
	Send {LCtrl down}
return

*~$s::
Keys(false, false, true)
return

$^Escape::
$+Escape::
$+^Escape::
Keys(false, false, false)
return

*~$Alt::
Keys(false, false, false)
return


ExitSub:
Keys(false, false, false)
ExitApp


Keys(a := false, b := false, c := false) {
	;global
	if (a = false) {
		;automove := false
		Send {w up}
	}
	if (b = false) {
		;runtoggle := false
		Send {LShift up}
	}
	if (c = false) {
		;vision := false
		Send {LCtrl up}
	}
	return
}

