#NoEnv
#SingleInstance force

;; #Win !Alt ^Ctrl +Shift

$ScrollLock::Suspend

Pause::Send ^w
!Pause::
  TrayTip, CustomKeys - Reloading,..., 1.5,
  Sleep, 1500
  reload
return

#Persistent
SetCapsLockState, AlwaysOff

Capslock & Space::
  if GetKeyState("CapsLock", "T") = 1
      SetCapsLockState, AlwaysOff
  else
      SetCapsLockState, AlwaysOn
return

CapsLock::Send, {ESC}

Capslock & a::Winset, AlwaysOnTop, , A

Capslock & h::Send #{Left}
Capslock & l::Send #{Right}
Capslock & k::Send #{Up}
Capslock & j::Send #{Down}

Capslock & w::Send #+{Left}
Capslock & e::Send #+{Right}

Capslock & m::
  key = ahk_exe Emacs.exe
  ToggleWindow(key)
return

Capslock & i::
  key = ahk_exe KeePassXC.exe
  ToggleWindow(key)
return

;; Backslash
Capslock & SC02B::
  key = ahk_exe WindowsTerminal.exe
  ToggleWindow(key)
return

Capslock & o::SendInput #!^{o}
Capslock & u::SendInput #!^{Space}
Capslock & p::SendInput #!^{p}

pid1 := 0
#!^f::
  WinGet, pid1, PID, A
  WinGetTitle, windowTitle, ahk_pid %pid1%
  WinGetClass, windowClass, ahk_pid %pid1%
  TrayTip, CustomKeys - Marked f Window, `n%windowClass%`n%windowTitle%, 2,
return

Capslock & f::
  key = ahk_pid %pid1%
  ToggleWindow(key)
return

ToggleWindow(key) {
  WinGet, WindowState, MinMax, %key%
  if WindowState = -1
      WinActivate, %key%
  else
      WinMinimize, %key%
  return
}
