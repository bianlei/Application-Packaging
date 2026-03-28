<#
    Silent Uninstall Script
#>

$msiPath = "C:\Users\$env:USERNAME\Desktop\7z2600-x64.msi"

# 读取 MSI 文件的 ProductCode
$windowsInstaller = New-Object -ComObject WindowsInstaller.Installer
$database = $windowsInstaller.OpenDatabase($msiPath, 0)
$query = "SELECT Value FROM Property WHERE Property='ProductCode'"
$view = $database.OpenView($query)
$view.Execute()
$record = $view.Fetch()
$productCode = $record.StringData(1)

Write-Host "Starting silent uninstall..." -ForegroundColor Yellow

Start-Process -FilePath "msiexec.exe" `
    -ArgumentList "/x $productCode /qn /norestart" `
    -Wait

Write-Host "Uninstall completed." -ForegroundColor Green