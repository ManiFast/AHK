SetTimer, t, 10
Return

t:
    MouseGetPos, x, y, ID, control
    WinGetTitle, Title, ahk_id %ID%
    WinGetClass, Class, %Title%
    ToolTip % "X = " x "`nY= " y "`nTitle = " Title "`nAhk_class = " class "`nControl = " control 
Return

F1::
Clipboard:="X = " x "`nY= " y "`nTitle = " Title "`nAhk_class = " class "`nControl = " control 
Return