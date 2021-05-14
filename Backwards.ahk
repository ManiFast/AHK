#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#NoEnv
SendMode, Input
SetBatchLines -1
CoordMode, Mouse, Screen

mouseXY(x, y){
DllCall("mouse_event",uint,1,int,x,int,y­,uint,0,int,0)
}

strafe(left){
moveCount := 35
sleepInterval := 1
relativeMove := 15
if(left){
key := "d"
move := -relativeMove
} else {
key := "a"
move := relativeMove
}
Send, {Blind}{%key% down}
DllCall("Sleep", "UInt", 5)
Loop, %moveCount% {
mouseXY(move, 0)
DllCall("Sleep", "UInt", sleepInterval)
}
Send, {Blind}{%key% up}
}

*T::
while getkeystate("T","P") {
strafe(false)
strafe(true)
}
return