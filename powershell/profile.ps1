$DOT = "D:\Projects\Misc\dotfiles"
$VIM = "$DOT\neovim\nvim"
$UNI = "D:\Uni\2\2"
$PROJ = "D:\Projects"

function RunTerminalAsAdmin {
    Start-Process wt -Verb RunAs
}

Set-Alias -Name vim -Value nvim
Set-Alias -Name admin -Value RunTerminalAsAdmin

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
