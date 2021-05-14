*~$h:: 
Sleep 1
Loop 
{ 
GetKeyState, SpaceState, h, P 
If SpaceState = U
break 
Sleep 1
Send, {Blind}{WheelDown} 
}