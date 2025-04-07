Capslock::Esc
Esc::Capslock
#j::Send("{Enter}")
#h::Send("{Backspace}")
#k::Send("{Left}{Left}")

; Win+1 - Wezterm
#1::LaunchAndMaximize("wezterm-gui.exe", "~")
; Win+2 - Firefox
#2::LaunchAndMaximize("firefox.exe", "Mozilla Firefox")
; Win+3 - Google Chrome
#3::LaunchAndMaximize("chrome.exe", "Google Chrome")
; Win+8 - Obsidian (Full path added to environment variables)
#8::LaunchAndMaximize("Obsidian.exe", "Obsidian")
; Win+9 - Notepad
#9::Launch("notepad.exe", "Notepad")

; Function to launch a program
Launch(program, name) {
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

; Function to launch and maximize a program
LaunchAndMaximize(program, name) {
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
        WinMaximize
    }
    return
}

; Maximize the current program with Win+m
#m::WinMaximize("A")

; Close the current program with Win+C
#c::WinClose("A")
