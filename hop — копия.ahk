F11:: Hotkey, *~$Space, Toggle


End::
ExitApp


*~$Space::
Sleep 300
Loop
{
GetKeyState, SpaceState, Space, P
If SpaceState = U
break
Sleep 1
Send, {Blind}{L}
}
Return