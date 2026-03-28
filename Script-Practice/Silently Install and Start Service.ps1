# 执行静默安装
Write-Host "Starting installation..."
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i $msiPath /qn /l*v $logPath" -Wait

# 检查安装是否基本成功（简单示例：检查文件）
$exePath = "C:\Program Files\MyApp\MyApp.exe"
if (Test-Path $exePath) {
    Write-Host "Installation files seem to be present."
} else {
    Write-Host "Installation may have failed, check log: $logPath"
    exit 1
}

# 启动服务
Write-Host "Starting service $serviceName..."
Start-Service -Name $serviceName

Write-Host "Installation and service start completed."