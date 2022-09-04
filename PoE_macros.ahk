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

#IfWinActive, ahk_class POEWindowClass

;SHORTCUTS START
F1::DelvingWalls() ; Drop flare and bomb
F2::Remaining() ; Check remaing monsters
F3::OosCommand() ; Send, OOS Comand
F4::CheckItemLevel() ; Point to item to check it's level
F5::Hideout() ; Go to Hideout
F6::Delve() ; Go to Delve
F7::Menagerie() ; Go to Menagerie
F8::Harvest() ; Go to Harvest
F9::WaitTrade() ; Send Msg to wait while I get into hideout
F10::BeginTrade() ; Invite player from whisper
F11::GoodManers() ; Thank the player and wish Good Luck
F12::EndTrade() ; Kick me out from party
!$'::FastLogOut() ; Menu logout
~#!z::ExitApp ; Exit
;SHORTCUTS START

;{--------------- FUNCTION CALLS START

; F1
DelvingWalls(){
        BlockInput, On
        Random, sleepTime, 30, 90
        Sleep %sleepTime%
        Send, 67
        Random, sleepTime, 30, 90
        Sleep %sleepTime%
        BlockInput, Off
        Return
}

; F2
Remaining(){
        BlockInput, On
        Send, {Enter}
        Random, sleepTime, 30, 90
        Sleep %sleepTime%
        Send, /remaining
        Send, {Enter}
        Random, sleepTime, 30, 90
        Sleep %sleepTime%
        BlockInput, Off
        Return
}

; F3
OosCommand(){
        BlockInput, On
        Send, {Enter}
        Random, sleepTime, 30, 90
        Sleep %sleepTime%
        Send, /oos
        Random, sleepTime, 30, 90
        Sleep %sleepTime%
        Send, {Enter}
        BlockInput, Off
        Return
}

; F4
CheckItemLevel(){
        BlockInput, On
        Send, {LButton}
        Send, {Enter}
        Random, sleepTime, 30, 90
        Sleep %sleepTime%
        Send, /itemlevel
        Send, {Enter}
        Random, sleepTime, 30, 90
        Sleep %sleepTime%
        Send, {LButton}
        BlockInput, Off
        Return
}

; F5
Hideout(){
        BlockInput, On
        Send, {Enter}
        Random, sleepTime, 30, 90
        Sleep %sleepTime%
        Send, /hideout
        Random, sleepTime, 30, 90
        Sleep %sleepTime%
        Send, {Enter}
        BlockInput, Off
        Return
}

; F6
Delve(){
        BlockInput, On
        Send, {Enter}
        Random, sleepTime, 30, 90
        Sleep %sleepTime%
        Send, /delve
        Random, sleepTime, 30, 90
        Sleep %sleepTime%
        Send, {Enter}
        BlockInput, Off
        Return
}

; F7
Menagerie(){
        BlockInput, On
        Send, {Enter}
        Random, sleepTime, 30, 90
        Sleep %sleepTime%
        Send, /menagerie
        Random, sleepTime, 30, 90
        Sleep %sleepTime%
        Send, {Enter}
        BlockInput, Off
        Return
}

; F8
Harvest(){
        BlockInput, On
        Send, {Enter}
        Random, sleepTime, 30, 90
        Sleep %sleepTime%
        Send, /harvest
        Random, sleepTime, 30, 90
        Sleep %sleepTime%
        Send, {Enter}
        BlockInput, Off
        Return
}
; F9
WaitTrade(){
        BlockInput, On
        Send, ^{Enter}
        Random, sleepTime, 30, 90
        Sleep %sleepTime%
        Send, 1 sec.
        Random, sleepTime, 30, 90
        Sleep %sleepTime%
        Send, {Enter}
        BlockInput, Off
        Return
}

; F10
BeginTrade(){
        BlockInput, On
        Send, ^{Enter}
        Random, sleepTime, 30, 90
        Sleep %sleepTime%
        Send, {Home}/invite {Delete}{End}
        Random, sleepTime, 30, 90
        Sleep %sleepTime%
        Send, {Enter}
        BlockInput, Off
        Return
}

; F11
GoodManers(){
        BlockInput, On
        Send, {Enter}
        Random, sleepTime, 30, 90
        Sleep %sleepTime%
        Send, ty, gl{!}
        Random, sleepTime, 30, 90
        Sleep %sleepTime%
        Send, {Enter}
        Random, sleepTime, 30, 90
        Sleep %sleepTime%
        BlockInput, Off
        Return
}

; F12
EndTrade(){
        BlockInput, On
        Send, {Enter}
        Random, sleepTime, 30, 90
        Sleep %sleepTime%
        Send, /kick Kuruvar
        Random, sleepTime, 30, 90
        Sleep %sleepTime%
        Send, {Enter}
        BlockInput, Off
        Return
}

; Alt+'
FastLogOut(){
        BlockInput, On
        SetDefaultMouseSpeed 0
        Send, {Space}
        Random, sleepTime, 30, 90
        Sleep %sleepTime%
        Send, {Esc}
        MouseClick, Left, 678, 307, 1, 1
        BlockInput, Off
        Return
}

;FUNCTION CALLS END ---------------}

;END