#Persistent
#NoEnv
Menu,Tray,NoStandard
OnExit handle_exit

State=0

; the specific (absolute) x, y to be magnified,
start_x:= 680, start_y:= 384
; the display of the magnified image x, y, w, h
xx:=000, yy:= 00, ww:=400, hh:=400

Alt:: ;hotkey here

key_to_scope:
State:=!State
send {Ctrl up}
send {Ctrl down}
send {Ctrl up}
If state
{
Gui,  +AlwaysOnTop  +E0x20 -Caption +Owner +Resize -ToolWindow
Gui, Show, NoActivate w300 h220 x0 y0 , PrintScreen
zoom:=1
antialize:=1
delay:=1
WinGet PrintScreenID, id  ,PrintScreen
WinSet Transparent, 254, PrintScreen
WinGet, PrintSourceID, id
hdd_frame := DllCall( "GetDC", UInt, PrintSourceID )
hdc_frame := DllCall( "GetDC", UInt, PrintScreenID )
hdc_buffer := DllCall("gdi32.dll\CreateCompatibleDC", UInt,  hdc_frame)
hbm_buffer := DllCall("gdi32.dll\CreateCompatibleBitmap", UInt,hdc_frame, Int,A_ScreenWidth, Int,A_ScreenHeight)
Gosub, Repaint
return
Repaint:
CoordMode, Mouse, Screen
MouseGetPos, start_x, start_y
Gui, Submit, NoHide
GuiControl,, delay2 , delay %delay% ms
WinGetPos, wx, wy, ww, wh , PrintScreen
wh2 := wh
DllCall( "gdi32.dll\SetStretchBltMode", "uint", hdc_frame, "int", 4 * antialize )
DllCall("gdi32.dll\StretchBlt", UInt,hdc_frame, Int,0, Int,0, Int,ww, Int,wh
, UInt,hdd_frame, Int
, start_x-(ww / 2 / zoom)
, Int,start_y -( wh2 / 2/zoom), Int,ww / zoom, Int,wh2 / zoom ,UInt,0xCC0020)
if follow = 1
WinMove, PrintScreen, ,start_x -ww/2 , start_y-wh/2
SetTimer, Repaint , %delay%
Return
GuiClose:
handle_exit:
DllCall("gdi32.dll\DeleteObject", UInt,hbm_buffer)
DllCall("gdi32.dll\DeleteDC", UInt,hdc_frame )
DllCall("gdi32.dll\DeleteDC", UInt,hdd_frame )
DllCall("gdi32.dll\DeleteDC", UInt,hdc_buffer)
ExitApp xxxxx
}
Else
Gui Destroy
Return