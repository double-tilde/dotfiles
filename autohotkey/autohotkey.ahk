;
; ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~
; ~~ AUTOHOTKEY CONFIG ~~
; ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~
;

; ~~ Variables ~~
Terminal := "wezterm-gui.exe"
TerminalTitle := "~"
Browser := "firefox.exe"
BrowserTitle := "Mozilla Firefox"
FTP := "C:\Program Files (x86)\WinSCP\WinSCP.exe"
FTPTitle := "WinSCP"
Chat := "C:\Program Files\Slack\Slack.exe"
ChatTitle := "Slack"
Notes := "ApplicationFrameHost.exe"
NotesTitle := "Sticky Notes"
NotesAlt := "notepad.exe"
NotesAltTitle := "Notepad"
Explorer := "explorer"
ExplorerTitle := "Explorer"
; ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~

; ~~ Key Remaps and shortcuts ~~
Capslock::Esc
Esc::Capslock
#j::Send("{Enter}")
#h::Send("{Backspace}")
#k::Send("{{}{}}{Left}")
#l::Send("(){Left}")
; ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~

; ~~ Resizing and Closing Applications ~~
; Maximize the current program with Win+f
#f::Maximize()
; Minimize the current program with Win+m
#m::Minimize()
; Close the current program with Win+C
#c::WinClose("A")

; Move the window to the left and right
#+h::WinMove(0, 0, A_ScreenWidth/2, A_ScreenHeight, "A")
#+l::WinMove(A_ScreenWidth/2, 0, A_ScreenWidth/2, A_ScreenHeight, "A")
; ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~

; ~~ Launching Applications ~~
#Enter::RunMax(Terminal, TerminalTitle)

#1::CheckOrRunMax(Terminal, TerminalTitle)
#2::CheckOrRunMax(Browser, BrowserTitle)
#3::CheckOrRun(FTP, FTPTitle)
#4::CheckOrRun(Chat, ChatTitle)

#8::CheckOrRunMax(Notes, NotesTitle)
#9::CheckOrRun(NotesAlt, NotesAltTitle)

#e::CheckOrRun(Explorer, ExplorerTitle)
; ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~

; Function to maximize the focused program
Maximize() {
    try {
        WinMaximize("A")
    } catch {
        MsgBox("Error: No program in focus to maximize.")
    }
}

; Function to minimize the focused program
Minimize() {
    try {
        WinMinimize("A")
    } catch {
        MsgBox("Error: No program in foucs to minimize.")
    }
}

; Function to run a program and maximize
RunMax(program, name) {
    try {
        Run(program)
        WinWait(name)
        WinActivate
        WinMaximize
    } catch {
        MsgBox("Error: The program '" program "' could not be found or started.")
    }
    return
}

; Function to check if a prgrom is running, or run it
CheckOrRun(program, name) {
    try {
        if WinExist("ahk_exe " program) {
            WinActivate
            CenterWindow(name)
        }
        else if WinExist(name) {
            WinActivate(name)
            CenterWindow(name)
        }
        else {
            Run(program)
            WinWait(name)
            WinActivate
            CenterWindow(name)
        }
    } catch {
        MsgBox("Error: The program '" program "' could not be found or started.")
    }
    return
}

; Function to check if program is running and maximize, or run it and maximize
CheckOrRunMax(program, name) {
    try {
        if WinExist("ahk_exe " program) {
            WinActivate
            WinWait
            WinMaximize
        }
        else if WinExist(name)
        {
            WinActivate(name)
            WinWait(name)
            WinMaximize
        }
        else
        {
            Run(program)
            WinWait(name)
            WinActivate
            WinMaximize
        }
    } catch {
        MsgBox("Error: The program '" program "' could not be found or started.")
    }
    return
}

; Function to center the current program
CenterWindow(WinTitle)
{
    WinGetPos ,, &Width, &Height, WinTitle
    WinMove (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2),,, WinTitle
}
