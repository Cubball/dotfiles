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

$getSourceFunctionName = "GetSource"
$getTargetFunctionName = "GetTarget"
$moduleSuffix = "links.psm1"

$rootDirectory = Get-Location
$modules = Get-ChildItem -Path $rootDirectory -File -Filter "*$moduleSuffix" -Recurse
$moduleNumber = 1
foreach ($module in $modules) {
    Import-Module $module.FullName -Prefix $moduleNumber -Force
    try {
        $source = Invoke-Expression "$moduleNumber$getSourceFunctionName $rootDirectory"
    }
    catch {
        Write-Host "Error: $module.FullName does not define function $getSourceFunctionName" -ForegroundColor Red
        continue
    }

    # TODO: DRY
    try {
        $target = Invoke-Expression "$moduleNumber$getTargetFunctionName $rootDirectory"
    }
    catch {
        Write-Host "Error: $module.FullName does not define function $getTargetFunctionName" -ForegroundColor Red
        continue
    }

    TryCreateSymlink $source $target
    $moduleNumber++
}

Write-Host "Bootstrap finished." -ForegroundColor Blue
