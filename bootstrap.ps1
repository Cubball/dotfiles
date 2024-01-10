function TryCreateSymlink($source, $target) {
    if (-Not (Test-Path $source)) {
        Write-Host "Error while creating symlink: item $source does not exist" -ForegroundColor Red
        return
    }

    if (Test-Path $target) {
        # TODO: check if it is a symlink and points to the same target
        Write-Host "Item $target already exists. Do you want to overwrite it? (y/n) " -ForegroundColor Yellow -NoNewline
        $answer = Read-Host
        if ($answer -ne "y" -and $answer -ne "Y") {
            return
        }

        try {
            Remove-Item $target -Recurse -Force -ErrorAction Stop
        }
        catch {
            Write-Host "Error while removing $target" -ForegroundColor Red
            return
        }
    }

    try {
        $null = New-Item -ItemType SymbolicLink -Path $target -Value $source -Force -ErrorAction Stop
        Write-Host "Symlink created successfully at $target" -ForegroundColor Green
    }
    catch {
        Write-Host "Error while creating symlink at $target" -ForegroundColor Red
    }
}

$moduleFileName = "paths.psm1"
$getSourceFunctionName = "GetSource"
$getTargetFunctionName = "GetTarget"

$rootDirectory = Get-Location
$subdirectories = Get-ChildItem -Path $rootDirectory -Directory
foreach ($directory in $subdirectories) {
    $modulePath = Join-Path -Path $directory -ChildPath $moduleFileName
    if (-Not (Test-Path $modulePath)) {
        Write-Host "Module $moduleFileName not found in $directory" -ForegroundColor Yellow
        continue
    }

    Import-Module $modulePath -Prefix $directory.Name -Force
    try {
        $source = Invoke-Expression "$($directory.Name)$getSourceFunctionName $directory"
    }
    catch {
        Write-Host "Error: $($directory.Name)/$moduleFileName does not define function $getSourceFunctionName" -ForegroundColor Red
        continue
    }

    # TODO: DRY
    try {
        $target = Invoke-Expression "$($directory.Name)$getTargetFunctionName $directory"
    }
    catch {
        Write-Host "Error: $($directory.Name)/$moduleFileName does not define function $getTargetFunctionName" -ForegroundColor Red
        continue
    }

    TryCreateSymlink $source $target
}

Write-Host "Bootstrap finished."
