#NoEnv ; turn off auto-loading of variable definitions from the environment
; #Warn ; enable warnings

; set the send mode to input. So keys are sent directly to the active window, rather than being interpreted by the operating system
SendMode Input
; set the working directory of the script to the directory where the script is located
SetWorkingDir %A_ScriptDir%

; tell AutoHotkey to keep the script running even after the initial code execution
#persistent

; run at 7:45am, which is 745. Sets the value of TargetTime to 745, which corresponds to 7:45 am in the 24-hour time format
TargetTime = 745

; Put just YYYYMMDD into the variable. Extracts the current date (A_Now) and stores only the first 8 characters (YYYYMMDD) in the TargetDateTime variable
StringLeft, TargetDateTime, A_Now, 8
; Appends the TargetTime (400) to the end of the TargetDateTime variable. So, the value of TargetDateTime becomes something like 20220303400 || 2022/03/03/745
TargetDateTime = %TargetDateTime%%TargetTime%
; calculate the time difference (in seconds) between the current time (A_Now) and the target time (TargetDateTime)
TimeUntilTarget = %TargetDateTime%
TimeUntilTarget -= %A_Now%, seconds

; convert the time difference from seconds to milliseconds
TimeUntilTarget *= 1000
; set a timer for the PressTheKey subroutine to be executed after TimeUntilTarget milliseconds
SetTimer, PressTheKey, %TimeUntilTarget%
; end of the script
return

; PressTheKey subroutine that is executed when the timer set in the previous line expires. This subroutine turns off the timer, and then sends the key "g" to the active window. The return statement marks the end of the subroutine
PressTheKey:
    SetTimer, PressTheKey, off
    Send, {g} ; i.e. press only once
return