function GetSource($dotfilesDirectory) {
    return Join-Path -Path $dotfilesDirectory -ChildPath "git\.gitconfig"
}

function GetTarget($dotfilesDirectory) {
    return Join-Path -Path $env:USERPROFILE -ChildPath ".gitconfig"
}
