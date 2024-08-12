$DOT = "D:\Projects\Personal\dotfiles"
$VIM = "$DOT\neovim\nvim"
$UNI = "D:\Uni\3\1"
$PROJ = "D:\Projects"

function RunTerminalAsAdmin {
    Start-Process wt -Verb RunAs
}

function NewTab {
    Start-Process wt -ArgumentList "-w 0 new-tab -d ."
}

Set-Alias -Name vim -Value nvim
Set-Alias -Name admin -Value RunTerminalAsAdmin
Set-Alias -Name bsh -Value "C:\Program Files\Git\bin\bash.exe"
Set-Alias -Name nt -Value NewTab

Set-PSReadlineOption -BellStyle None
Set-PSReadlineOption -EditMode Vi
Set-PSReadLineKeyHandler -Chord "Ctrl+y" -Function AcceptSuggestion

function prompt {
    try {
        $gitBranch = git branch --show-current
    } catch {
        $gitBranch = $null
    }

    $currentDirectory = Split-Path -Path $pwd -Leaf
    Write-Host "`u{279c}" -ForegroundColor Green -NoNewline
    Write-Host " $currentDirectory" -ForegroundColor Cyan -NoNewline
    if ($gitBranch) {
        Write-Host " git:(" -ForegroundColor Blue -NoNewline
        Write-Host "$gitBranch" -ForegroundColor Red -NoNewline
        Write-Host ")" -ForegroundColor Blue -NoNewline
    }

    return " "
}
