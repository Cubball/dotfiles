function GetSource($currentDirectory) {
    return Join-Path -Path $currentDirectory -ChildPath "nvim"
}

function GetTarget($currentDirectory) {
    return Join-Path -Path $env:LOCALAPPDATA -ChildPath "nvim"
}
