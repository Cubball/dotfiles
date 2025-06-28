function GetSource($dotfilesDirectory) {
    return Join-Path -Path $dotfilesDirectory -ChildPath "cursor\keybindings.json"
}

function GetTarget($dotfilesDirectory) {
    return Join-Path -Path $env:APPDATA -ChildPath "Cursor\User\keybindings.json"
}
