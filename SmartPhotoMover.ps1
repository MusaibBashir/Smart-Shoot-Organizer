<#
.SYNOPSIS
    Smart Photo Organizer - Interprets shorthand number sequences and moves/copies files.
    
.DESCRIPTION
    This script takes a shorthand comma-separated list of numbers (e.g., 1210, 11, 12),
    expands them based on the previous number's digits, and processes the corresponding files.

.EXAMPLE
    Run from terminal: .\SmartPhotoMover.ps1
#>

Clear-Host
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "      SMART PHOTO ORGANIZER (CLI)         " -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan

$rawNumbers = Read-Host "Paste sequence (e.g. 1210,211,15)"
if ([string]::IsNullOrWhiteSpace($rawNumbers)) {
    Write-Error "No numbers provided. Exiting."
    exit
}


$prefix = Read-Host "Enter Filename Prefix (e.g. IMG_)"
$extInput = Read-Host "Enter Extensions separated by comma (e.g. JPG,CR2)"
$extensions = $extInput -split "," | ForEach-Object { $_.Trim().Trim('.') }

$folderName = Read-Host "Enter name for the new folder"
if ([string]::IsNullOrWhiteSpace($folderName)) {
    $folderName = "Selected_Files"
}

Write-Host "`nChoose Action:"
Write-Host "[C] Copy files (Safer)" -ForegroundColor Green
Write-Host "[M] Move files" -ForegroundColor Yellow
$actionInput = Read-Host "Type C or M"

$isMove = $false
if ($actionInput -match "M|m") {
    $isMove = $true
    Write-Host "Mode: MOVE selected." -ForegroundColor Yellow
} else {
    Write-Host "Mode: COPY selected." -ForegroundColor Green
}


$currentLocation = Get-Location
$targetPath = Join-Path -Path $currentLocation -ChildPath $folderName

if (-not (Test-Path -Path $targetPath)) {
    New-Item -ItemType Directory -Path $targetPath | Out-Null
    Write-Host "Created folder: $folderName" -ForegroundColor Gray
} else {
    Write-Host "Using existing folder: $folderName" -ForegroundColor Gray
}


$numberList = $rawNumbers -split ","
$lastFullNumber = ""
$processedCount = 0
$successCount = 0
$failCount = 0
$failedFiles = @()

Write-Host "`nProcessing..." -ForegroundColor Cyan

foreach ($numRaw in $numberList) {
    $numStr = $numRaw.Trim()
    if ([string]::IsNullOrWhiteSpace($numStr)) { continue }

    $currentFullNumber = ""

    if ($lastFullNumber -eq "") {
        $currentFullNumber = $numStr
    }
    elseif ($numStr.Length -lt $lastFullNumber.Length) {
        $prefixLen = $lastFullNumber.Length - $numStr.Length
        $prefixStr = $lastFullNumber.Substring(0, $prefixLen)
        $currentFullNumber = $prefixStr + $numStr
    }
    else {

        $currentFullNumber = $numStr
    }
    $lastFullNumber = $currentFullNumber

    foreach ($ext in $extensions) {
        $fileName = "${prefix}${currentFullNumber}.${ext}"
        $sourcePath = Join-Path -Path $currentLocation -ChildPath $fileName
        $destPath = Join-Path -Path $targetPath -ChildPath $fileName

        if (Test-Path -Path $sourcePath) {
            try {
                if ($isMove) {
                    Move-Item -Path $sourcePath -Destination $destPath -Force -ErrorAction Stop
                    Write-Host "  [MOVED] $fileName" -ForegroundColor Green
                } else {
                    Copy-Item -Path $sourcePath -Destination $destPath -Force -ErrorAction Stop
                    Write-Host "  [COPIED] $fileName" -ForegroundColor Green
                }
                $successCount++
            }
            catch {
                Write-Host "  [ERROR] Could not process $fileName : $($_.Exception.Message)" -ForegroundColor Red
                $failCount++
                $failedFiles += "$fileName (Permission/IO Error)"
            }
        } else {
            Write-Host "  [MISSING] $fileName not found in current folder." -ForegroundColor DarkGray
            $failCount++
            $failedFiles += "$fileName (Not Found)"
        }
    }
    $processedCount++
}


Write-Host "`n==========================================" -ForegroundColor Cyan
Write-Host "               SUMMARY                    " -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "Total IDs Processed : $processedCount"
Write-Host "Successful Files    : $successCount" -ForegroundColor Green
Write-Host "Failed/Missing      : $failCount" -ForegroundColor Red

if ($failedFiles.Count -gt 0) {
    Write-Host "`nFailed List:" -ForegroundColor Red
    foreach ($f in $failedFiles) {
        Write-Host " - $f"
    }
}

Write-Host "`nDone. Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")