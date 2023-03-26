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

; SetCapsLockState, AlwaysOff

; #!^+Space::
;   if GetKeyState("CapsLock", "T") = 1
;       SetCapsLockState, AlwaysOff
;   else
;       SetCapsLockState, AlwaysOn
; return

; CapsLock::Send, {ESC}

;; Use PowerToys' Always On Top functionalityR
; #!^+a::Winset, AlwaysOnTop, , A
#!^+a::Send #!^{a}

#!^+Enter::Run, %A_StartMenu%\Programs\Scoop Apps\Wezterm.lnk

;; PowerToys Run
#!^+r::Send #!^{r}

#!^+h::Send #{Left}
#!^+l::Send #{Right}
#!^+k::Send #{Up}
#!^+j::Send #{Down}

#!^+w::Send #+{Left}
#!^+e::Send #+{Right}

#!^+m::
  key = (^emacs -nw|Doom Emacs$)
  ToggleWindow(key)
return

#!^+i::
  key = ahk_exe KeePassXC.exe
  ToggleWindow(key)
return

;; Backslash
#!^+SC02B::
  key = ahk_exe WindowsTerminal.exe
  ToggleWindow(key)
return

#!^+c::
  WinGet, id, ID, ahk_exe alacritty.exe
  key = ahk_id %id%
  ToggleWindow(key)
return

#!^+o::
  key = ahk_class {97E27FAA-C0B3-4b8e-A693-ED7881E99FC1}
  ToggleWindow(key)
return

#!^+u::SendInput #!^{Space}
#!^+p::SendInput #!^{p}
#!^+s::SendInput #!^{'}
#!^+t::SendInput +!^{q}

id1 := 0
#!^+f::
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
#!^+d::
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

id3 := 0
#!^+g::
  if GetKeyState("LAlt") {
    WinGet, id3, ID, A
    WinGetTitle, windowTitle, ahk_id %id3%
    WinGetClass, windowClass, ahk_id %id3%
    TrayTip, CustomKeys - Marked d Window, `n%windowClass%`n%windowTitle%, 2,
  }
  else {
    key = ahk_id %id3%
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
