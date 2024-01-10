function GetSource($dotfilesDirectory) {
    return Join-Path -Path $dotfilesDirectory -ChildPath "terminal\settings.json"
}

function GetTarget($dotfilesDirectory) {
    return Join-Path -Path $env:LOCALAPPDATA -ChildPath "Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
}
