function GetSource($dotfilesDirectory) {
    return Join-Path -Path $dotfilesDirectory -ChildPath "vscode\keybindings.json"
}

function GetTarget($dotfilesDirectory) {
    return Join-Path -Path $env:APPDATA -ChildPath "Code\User\keybindings.json"
}
