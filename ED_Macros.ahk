;OPTIMIZATIONS START
#NoEnv
#MaxHotkeysPerInterval, 99000000
#HotkeyInterval, 99000000
#KeyHistory, 0
#SingleInstance, force
ListLines, Off
Process, Priority, , H
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode, Input
;OPTIMIZATIONS END

DllCall("Sleep",UInt,17) ;I just used the precise sleep function to wait exactly 17 milliseconds

SetWorkingDir, %A_ScriptDir%

#Include, joyfocus.ahk

; Start Call of Functions

;Joy1::Send {Ctrl} ; Set Trigger as Ctrl key
!Up::EngSys() ; Engines/Systems
!Down::WeapSys() ; Weapons/Systems
!Left::SysEng() ; Systems/Engine
!Right::WeapEng() ; Weapons/Engine
!XButton2::AutoDock() ; Request Dock Permission

; End Call of Functions

; {Alt}Up -> 4Engines/2Systems
EngSys() {
		BlockInput On
		send {DOWN} 
		Random, sleepTime, 30, 90
        Sleep %sleepTime%
		send {UP} 
		Random, sleepTime, 30, 90
        Sleep %sleepTime%
		send {UP} 
		Random, sleepTime, 30, 90
        Sleep %sleepTime%
		send {LEFT} 
		Random, sleepTime, 30, 90
        Sleep %sleepTime%
		send {UP} 
		BlockInput Off
        exit
}

; {Alt}Down -> 4Weapons/2Systems
WeapSys() {
		BlockInput On
		send {DOWN} 
		Random, sleepTime, 30, 90
        Sleep %sleepTime%
		send {RIGHT} 
		Random, sleepTime, 30, 90
        Sleep %sleepTime%
		send {RIGHT} 
		Random, sleepTime, 30, 90
        Sleep %sleepTime%
		send {LEFT} 
		Random, sleepTime, 30, 90
        Sleep %sleepTime%
		send {RIGHT} 
		BlockInput Off
        exit
}

; {Alt}Left -> 4Systems/2Engine
SysEng() { 
		BlockInput On
		send {DOWN} 
		Random, sleepTime, 30, 90
        Sleep %sleepTime%
		send {LEFT} 
		Random, sleepTime, 30, 90
        Sleep %sleepTime%
		send {LEFT} 
		Random, sleepTime, 30, 90
        Sleep %sleepTime%
		send {UP} 
		Random, sleepTime, 30, 90
        Sleep %sleepTime%
		send {LEFT} 
		BlockInput Off
        exit
} 

; {Alt}Right -> 4Weapons/2Engine
WeapEng() { 
		BlockInput On
		send {DOWN} 
		Random, sleepTime, 30, 90
        Sleep %sleepTime%
		send {RIGHT} 
		Random, sleepTime, 30, 90
        Sleep %sleepTime%
		send {RIGHT} 
		Random, sleepTime, 30, 90
        Sleep %sleepTime%
		send {UP} 
		Random, sleepTime, 30, 90
        Sleep %sleepTime%
		send {RIGHT} 
		BlockInput Off
        exit
}

; {Alt}XButton2 -> Request Dock Permission
AutoDock() { 
		BlockInput On
		setkeydelay, 5, 50
		send 1ee s qq1
		BlockInput Off
        exit
} 
