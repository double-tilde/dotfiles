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
; ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~

; ~~ Resizing and Closing Applications ~~
; Maximize the current program with Win+f
#f::WinMaximize("A")
; Close the current program with Win+C
#c::WinClose("A")
; ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~

; ~~ Launching Applications ~~
#Enter::RunAndMaximize(Terminal, TerminalTitle)

#1::CheckOrRunAndMaximize(Terminal, TerminalTitle)
#2::CheckOrRunAndMaximize(Browser, BrowserTitle)
#3::CheckOrRunAndMaximize(BrowserAlt, BrowserAltTitle)

#8::CheckOrRunAndMaximize(Notes, NotesTitle)
#9::CheckOrRun(NotesAlt, NotesAltTitle)
; ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~ ~~

; Function to run a program and maximize
RunAndMaximize(program, name) {
        Run(program)
        WinWait(name)
        WinActivate
        WinMaximize
        return
}

; Function to check if a prgrom is running, or run it
CheckOrRun(program, name) {
    if WinExist("ahk_exe " program) {
        WinActivate
    }
    else if WinExist(name)
    {
        WinActivate(name)
    }
    else
    {
        Run(program)
        WinWait(name)
        WinActivate
    }
    return
}

; Function to check if program is running and maximize, or run it and maximize
CheckOrRunAndMaximize(program, name) {
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
    return
}

