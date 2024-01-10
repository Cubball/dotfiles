function GetSource($dotfilesDirectory) {
    return Join-Path -Path $dotfilesDirectory -ChildPath "nvim\nvim"
}

function GetTarget($dotfilesDirectory) {
    return Join-Path -Path $env:LOCALAPPDATA -ChildPath "nvim"
}
