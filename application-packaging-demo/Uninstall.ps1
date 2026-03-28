<#
    Silent Uninstall Script
#>

$productCode = "{23170F69-40C1-2701-2407-000001000000}"

Write-Host "Starting silent uninstall..." -ForegroundColor Yellow

Start-Process -FilePath "msiexec.exe" `
    -ArgumentList "/x $productCode /qn /norestart" `
    -Wait

Write-Host "Uninstall completed." -ForegroundColor Green