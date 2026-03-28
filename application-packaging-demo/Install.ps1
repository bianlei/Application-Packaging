<#
    Silent MSI Install Script
    Enterprise Application Packaging Demo
#>

$msiFile = "7z2407.msi"
$logFile = "installation_log.log"

Write-Host "Starting silent installation..." -ForegroundColor Cyan

Start-Process -FilePath "msiexec.exe" `
    -ArgumentList "/i ""$msiFile"" /qn /norestart /l*v ""$logFile""" `
    -Wait

Write-Host "Installation completed. Log: $logFile" -ForegroundColor Green