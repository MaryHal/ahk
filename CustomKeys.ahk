#NoEnv
#SingleInstance force
SetTitleMatchMode, RegEx
Menu, Tray, Icon, %A_ScriptDir%\icons\CustomKeys.ico

;; #Win !Alt ^Ctrl +Shift

$ScrollLock::Suspend

Pause::Send ^w
!Pause::
  TrayTip, CustomKeys - Reloading,..., 1.5,
  Sleep, 1500
  reload
return

SetCapsLockState, AlwaysOff

Capslock & Space::
  if GetKeyState("CapsLock", "T") = 1
      SetCapsLockState, AlwaysOff
  else
      SetCapsLockState, AlwaysOn
return

CapsLock::Send, {ESC}

;; Use PowerToys' Always On Top functionalityR
; Capslock & a::Winset, AlwaysOnTop, , A
Capslock & a::Send #!^{a}

;; PowerToys Run
Capslock & r::Send #!^{r}

Capslock & h::Send #{Left}
Capslock & l::Send #{Right}
Capslock & k::Send #{Up}
Capslock & j::Send #{Down}

Capslock & w::Send #+{Left}
Capslock & e::Send #+{Right}

Capslock & m::
  key = (^emacs -nw|Doom Emacs$)
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

Capslock & c::
  WinGet, id, ID, ahk_exe alacritty.exe
  key = ahk_id %id%
  ToggleWindow(key)
return

Capslock & o::
  key = ahk_class {97E27FAA-C0B3-4b8e-A693-ED7881E99FC1}
  ToggleWindow(key)
return

Capslock & u::SendInput #!^{Space}
Capslock & p::SendInput #!^{p}
Capslock & s::SendInput #!^{'}
Capslock & t::SendInput #!^{q}

id1 := 0
Capslock & f::
  if GetKeyState("LAlt") {
    WinGet, id1, ID, A
    WinGetTitle, windowTitle, ahk_id %id1%
    WinGetClass, windowClass, ahk_id %id1%
    TrayTip, CustomKeys - Marked f Window, `n%windowClass%`n%windowTitle%, 2,
  }
  else {
    key = ahk_id %id1%
    ToggleWindow(key)
  }
return

id2 := 0
Capslock & d::
  if GetKeyState("LAlt") {
    WinGet, id2, ID, A
    WinGetTitle, windowTitle, ahk_id %id2%
    WinGetClass, windowClass, ahk_id %id2%
    TrayTip, CustomKeys - Marked d Window, `n%windowClass%`n%windowTitle%, 2,
  }
  else {
    key = ahk_id %id2%
    ToggleWindow(key)
  }
return

ToggleWindow(key) {
  WinGet, WindowState, MinMax, %key%
  if (WindowState >= 0 and WinActive(key)) {
      WinMinimize, %key%
  }
  else {
      WinActivate, %key%
  }
  return
}
