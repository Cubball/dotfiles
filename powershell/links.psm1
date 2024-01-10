function GetSource($dotfilesDirectory) {
    return Join-Path -Path $dotfilesDirectory -ChildPath "powershell\profile.ps1"
}

function GetTarget($dotfilesDirectory) {
    return Join-Path -Path $env:USERPROFILE -ChildPath "Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
}
