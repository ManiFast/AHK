LOOP_TIMES := 1
SPEED := 3512 ; Set It To -53320 To Go To The Left

v::
Loop, %LOOP_TIMES%
   DllCall("mouse_event", uint, 1, int, SPEED, int, 0, uint, 0, int, 0)
   Sleep, 1
return