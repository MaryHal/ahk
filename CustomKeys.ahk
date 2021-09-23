#NoEnv
#SingleInstance force

$ScrollLock::Suspend

Pause::Send ^w

#Persistent
SetCapsLockState, AlwaysOff

Capslock & Space::
  If GetKeyState("CapsLock", "T") = 1
      SetCapsLockState, AlwaysOff
  Else
      SetCapsLockState, AlwaysOn
Return

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
Capslock & p::SendInput #!^{p}

ToggleWindow(key) {
  WinGet, WindowState, MinMax, %key%
  If WindowState = -1
      WinActivate, %key%
  Else
      WinMinimize, %key%
  return
}
