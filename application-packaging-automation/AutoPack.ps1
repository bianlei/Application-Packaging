# 企业级自动化应用打包与部署脚本
$config = Get-Content -Raw -Path "config.json" | ConvertFrom-Json
$logFile = "logs\pack_log_$(Get-Date -Format 'yyyyMMddHHmmss').log"
New-Item -ItemType Directory -Path "logs" -Force | Out-Null

function Write-Log {
    param($msg)
    "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') $msg" | Out-File -Path $logFile -Append
    Write-Host $msg
}

try {
    Write-Log "Start packaging $($config.AppName)"

    if ($config.InstallType -eq "MSI") {
        Start-Process msiexec.exe -ArgumentList "/i $($config.Installer) /qn /norestart /l*v $logFile" -Wait
    }

    if (Test-Path $config.ExePath) {
        Write-Log "Installation SUCCESS"
        # 模拟写入注册表（企业配置）
        New-Item -Path $config.RegistryPath -Force | Out-Null
        Set-ItemProperty -Path $config.RegistryPath -Name "DisplayVersion" -Value $config.Version
        Write-Log "Registry config applied"
    }
    else {
        Write-Log "Installation FAILED"
        exit 1
    }
}
catch {
    Write-Log "ERROR: $_"
    exit 1
}