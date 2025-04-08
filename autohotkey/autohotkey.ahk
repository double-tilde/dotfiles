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
BrowserAlt := "chrome.exe"
BrowserAltTitle := "Google Chrome"
Notes := "Obsidian.exe" ; Full path added to Environment Variables
NotesTitle := "Obsdian"
NotesAlt := "notepad.exe"
NotesAltTitle := "Notepad"
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
#f::WinMaximize("A")
; Minimize the current program with Win+m
#m::WinMinimize("A")
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
#3::CheckOrRunMax(BrowserAlt, BrowserAltTitle)

#8::CheckOrRunMax(Notes, NotesTitle)
#9::CheckOrRun(NotesAlt, NotesAltTitle)
; ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~

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
        }
        else if WinExist(name) {
            WinActivate(name)
        }
        else {
            Run(program)
            WinWait(name)
            WinActivate
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
            WinMaximize
        }
        else if WinExist(name)
        {
            WinActivate(name)
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
