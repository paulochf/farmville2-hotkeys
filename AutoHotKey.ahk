; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; This script has a special filename and path because it is automatically
; launched when you run the program directly.  Also, any text file whose
; name ends in .ahk is associated with the program, which means that it
; can be launched simply by double-clicking it.  You can have as many .ahk
; files as you want, located in any folder.  You can also run more than
; one .ahk file simultaneously and each will get its own tray icon.

; SAMPLE HOTKEYS: Below are two sample hotkeys.  The first is Win+Z and it
; launches a web site in the default browser.  The second is Control+Alt+N
; and it launches a new Notepad window (or activates an existing one).  To
; try out these hotkeys, run AutoHotkey again, which will load this file.

;#z::Run www.autohotkey.com

F6::
If WinExist FarmVille 2 {
	Gui, 1:Destroy
	CoordMode, Mouse, Window
	WinActivate, FarmVille 2
	MouseGetPos, xpos, ypos
	Gui, 1:Add, Text,, Quantos cliques?
	Gui, 1:Add, Edit
	Gui, 1:Add, UpDown, vCliques Range0-100000000, 10, 0x80
	Gui, 1:Add, Button, x9 y50 w122 Default, Clica!
	;Gui, 1:Add, Button, x71 y50 w60, Fechar
	Gui, 1:Add, Progress, x9 y77 w122 h20 cBlue backgroundWhite -Smooth vCliquesProgresso, 0
	;Gui, 1:Add, StatusBar,,
	Gui, 1:Show, AutoSize
	WinSet, AlwaysOnTop, On, AutoHotKey
	Return

	ButtonClica!:
		Gui, 1:Submit, NoHide
		WinActivate, FarmVille 2

		iCliques := 0
		Loop %Cliques% {
			Click %xpos%, %ypos%
			iCliques+=1
			ProgressVal := (100*iCliques)/Cliques
			GuiControl, 1:, CliquesProgresso, %ProgressVal%
			SB_SetText("Clicando " . iCliques . "/" . Cliques)
			Sleep 100
		}

		WinActivate
		Return

	;ButtonFechar:
	GuiEscape:
	GuiClose:
		Gui, 1:Destroy
		Return
}
Return

; Note: From now on whenever you run AutoHotkey directly, this script
; will be loaded.  So feel free to customize it to suit your needs.

; Please read the QUICK-START TUTORIAL near the top of the help file.
; It explains how to perform common automation tasks such as sending
; keystrokes and mouse clicks.  It also explains more about hotkeys.