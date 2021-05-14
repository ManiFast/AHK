*~$Space:: 
Sleep 1
Loop 
{ 
GetKeyState, SpaceState, Space, P 
If SpaceState = U 
break 
Sleep 1
Send, {Blind}{Space} 
}