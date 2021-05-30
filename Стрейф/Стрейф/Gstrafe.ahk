ALT::Suspend, Toggle
*Mbutton::
Loop
{
GetKeyState,state,Mbutton,P
if state = U
break
Send,{WheelUp}
Sleep 300
}
return