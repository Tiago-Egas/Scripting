#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#Include, Gdip_All.ahk
SetWorkingDir, %A_ScriptDir%

radius:=768*0.05
oX:=1360*0.5
oY:=768*0.44

; Start gdi+
If !pToken := Gdip_Startup()
{
	MsgBox, 48, gdiplus error!, Gdiplus failed to start. Please ensure you have gdiplus on your system
	ExitApp
}
OnExit("ExitFunc")

^F1::
	CoordMode, Mouse, Screen
	MouseMove, oX, oY, 0
	Random, rnd, 768*0.05,768*0.05
	CircleClip(radius+rnd,oX,oY)
	circleDispGdi("On",radius+rnd,oX,oY)
Return

^F2::
	CircleClip()
	circleDispGdi(0)
return
CircleClip(radius=0, x:="", y:=""){
	global CircleClipRadius, CircleClipX, CircleClipY
	static hHookMouse, _:={base:{__Delete: "CircleClip"}}, CC:=RegisterCallback("CircleClip_WH_MOUSE_LL", "Fast")
	If (hHookMouse){
		DllCall("UnhookWindowsHookEx", "Uint", hHookMouse)
		hHookMouse:=""
		CircleClipX:=CircleClipY:=""
	}
	If (radius>0)
		
		CircleClipRadius:=radius
		, CircleClipX:=x
		, CircleClipY:=y
		, hHookMouse := DllCall("SetWindowsHookEx", "int", 14, "Uint", CC, "Uint", 0, "Uint", 0)
	return
}

CircleClip_WH_MOUSE_LL(nCode, wParam, lParam){
	global CircleClipRadius, CircleClipX, CircleClipY
	Critical

	if !nCode && (wParam = 0x200){ ; WM_MOUSEMOVE 
		nx := NumGet(lParam+0, 0, "Int") ; x-coord
		ny := NumGet(lParam+0, 4, "Int") ; y-coord

		If (CircleClipX="" || CircleClipY="")
			CircleClipX:=nx, CircleClipY:=ny
		  
		dx := nx - CircleClipX
		dy := ny - CircleClipY
		dist := sqrt( (dx ** 2) + (dy ** 2) )

		if ( dist > CircleClipRadius ) {
			dist := CircleClipRadius / dist
			dx *= dist
			dy *= dist
			
			nx := CircleClipX + dx
			ny := CircleClipY + dy
		}

		DllCall("SetCursorPos", "Int", nx, "Int", ny)
		Return 1
		
	}else Return DllCall("CallNextHookEx", "Uint", 0, "int", nCode, "Uint", wParam, "Uint", lParam) 
} 

circleDispGdi(on,r:="",x:="",y:=""){
	; Settings
	static rimThickness:=6		; Thickness of the ring.
	static rimColor:="FF0000" 	; 0-ffffff
	static rimTrans:="a0"			; 0-ff, transparency of the ring. 0 invisible, ff opaque.
	
	static hdc,obm,hbm,G
	static hWnd
	
	if hWnd {
		Gui, % hWnd ": Destroy"
		hWnd:=""
	}
	if !on
		return
	if (on="On") {
		Gui, 1: -Caption +E0x80000 +AlwaysOnTop +ToolWindow +OwnDialogs +hwndhWnd +E0x20
		Gui, 1: Show, NA
		hbm := CreateDIBSection(r*2, r*2)
		hdc := CreateCompatibleDC()
		obm := SelectObject(hdc, hbm)
		G := Gdip_GraphicsFromHDC(hdc)
		Gdip_SetSmoothingMode(G, 4)
		pPen := Gdip_CreatePen("0x" . rimTrans . rimColor, rimThickness)
		Gdip_DrawEllipse(G, pPen, rimThickness/2, rimThickness/2, r*2-rimThickness, r*2-rimThickness)
		UpdateLayeredWindow(hWnd, hdc, x-r, y-r, r*2, r*2)
		Gdip_DeleteBrush(pPen)
	} else if (on="Clear") {
		SelectObject(hdc, obm)
		DeleteObject(hbm)
		DeleteDC(hdc)
		Gdip_DeleteGraphics(G)
	}
	return
}

ExitFunc(){
	global pToken
	circleDispGdi("clear")
	Gdip_Shutdown(pToken)
	ExitApp
}
