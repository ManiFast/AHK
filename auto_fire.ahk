\::Suspend
*LButton::
Loop
{
SetMouseDelay 1
Click
If (GetKeyState("LButton","P")=0)
Break
}