function GetSource($currentDirectory) {
    return Join-Path -Path $currentDirectory -ChildPath "settings.json"
}

function GetTarget($currentDirectory) {
    return Join-Path -Path $env:LOCALAPPDATA -ChildPath "Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
}
