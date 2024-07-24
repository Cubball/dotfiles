function GetSource($dotfilesDirectory) {
    return Join-Path -Path $dotfilesDirectory -ChildPath "vscode\settings.json"
}

function GetTarget($dotfilesDirectory) {
    return Join-Path -Path $env:APPDATA -ChildPath "Code\User\settings.json"
}
