<#
    SCCM Detection Method Script
#>

$targetPath = "C:\Program Files\7-Zip\7z.exe"

if (Test-Path $targetPath) {
    Write-Host "INSTALLED" -ForegroundColor Green
    exit 0
}
else {
    Write-Host "NOT_INSTALLED" -ForegroundColor Red
    exit 1
}