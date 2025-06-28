function GetSource($dotfilesDirectory) {
    return Join-Path -Path $dotfilesDirectory -ChildPath "cursor\settings.json"
}

function GetTarget($dotfilesDirectory) {
    return Join-Path -Path $env:APPDATA -ChildPath "Cursor\User\settings.json"
}
