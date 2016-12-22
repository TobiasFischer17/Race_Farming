DetectHiddenWindows, On
SetTitleMatchMode, 2
IfWinNotExist, RaceRigRunner2.ahk
	Run, RaceRigRunner2.ahk
return

^1:: execute(0)
^2:: execute(1)

^9::
Exitapp

^0::
Exitapp

settings()
{
	SLEEP_TIME := 400
	sleep 500
	press("Up", SLEEP_TIME)
	press("Up", SLEEP_TIME)
	press("Up", SLEEP_TIME)
	press("Right", SLEEP_TIME)
	press("Right", SLEEP_TIME)
	press("Down", SLEEP_TIME)
	press("Down", SLEEP_TIME)
	press("Enter", SLEEP_TIME*4)
	press("Up", SLEEP_TIME)
	press("Enter", 100)
}

play(win)
{
	SLEEP_TIME := 400

	driveKey := "s"
	betKey := "Right"
	if(win) {
		driveKey := "w"
		betKey := "Left"
	}
	
	sleep 15000
	press("Up", SLEEP_TIME)
	press("Enter", SLEEP_TIME)
	press("Enter", SLEEP_TIME*5)
	press("Down", SLEEP_TIME)
	press(betKey, SLEEP_TIME)
	press("Enter", SLEEP_TIME)
	press("Down", SLEEP_TIME*2)
	press("Down", SLEEP_TIME*2)
	press("Enter", SLEEP_TIME)
	press("Down", SLEEP_TIME)
	press("Enter", 14000)
	SEND {%driveKey% down}
	sleep 8000
	SEND {%driveKey% up}
	sleep 7000
	sleep 30000
	press("Enter", 5000)
	press("Up", SLEEP_TIME)
	press("Enter", 25000)
}

execute(player)
{
	SLEEP_TIME := 400
	iteration := player

	loop
	{
		if(player == 0) {
			settings()
		} else {
			sleep SLEEP_TIME*12 + 715
		}
		play(iteration == 0)

		iteration := mod(iteration + 1, 2)
	}
}

press(key, time) 
{
	Sleep 50
	Send {%key% down}
	Sleep 50
	Send {%key% up}
	sleepTime := time - 100
	Sleep %sleepTime%
}