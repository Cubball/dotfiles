function GetSource($dotfilesDirectory) {
    return Join-Path -Path $dotfilesDirectory -ChildPath "neovim\nvim"
}

function GetTarget($dotfilesDirectory) {
    return Join-Path -Path $env:LOCALAPPDATA -ChildPath "nvim"
}
