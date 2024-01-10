$VIM = $env:LOCALAPPDATA + "\nvim"
$UNI = "D:\Uni\2\2"
$PROJ = "D:\Projects"

Set-Alias -Name vim -Value nvim

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
