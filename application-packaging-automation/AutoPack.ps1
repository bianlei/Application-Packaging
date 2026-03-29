# Read all and convert to Json object
$config = Get-Content -Raw -Path "config.json" | ConvertFrom-Json

# Define log file path with timestamp
$logFile = "logs\pack_log_$(Get-Date -Format 'yyyyMMddHHmmss').log"

# Create logs directory if not exists
New-Item -ItemType Directory -Path "logs" -Force | Out-Null

function Write-Log {
    param($msg)
    "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') $msg" | Out-File -FilePath $logFile -Append
    Write-Host $msg
}

try {
    Write-Log "Start packaging $($config.AppName)"

    if ($config.InstallType -eq "MSI") {
        Start-Process msiexec.exe -ArgumentList "/i ""$($config.Installer)"" /qn /norestart /l*v ""$logFile""" -Wait
    }

    if (Test-Path $config.ExePath) {
        Write-Log "Installation SUCCESS"
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