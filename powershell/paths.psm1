function GetSource($currentDirectory) {
    return Join-Path -Path $currentDirectory -ChildPath "profile.ps1"
}

function GetTarget($currentDirectory) {
    return Join-Path -Path $env:USERPROFILE -ChildPath "Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
}
