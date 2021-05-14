С::Suspend
LButton::
Loop
{
SetMouseDelay 100
Click
If(GetKeyState("LButton","P")=0)
Break
}