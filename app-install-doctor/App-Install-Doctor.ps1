<#
    Application Install Doctor - Enterprise Troubleshooting Tool
    Purpose: Automatically analyze MSI installation logs, troubleshoot silent install failures,
             validate SCCM detection logic, and generate diagnostic reports.
    Pain Points Solved: Silent installation failures, unreadable logs, SCCM deployment issues, permission problems.
#>

# ---------------------------
# 1. Initialize paths and log file
# ---------------------------
$logFile = "test-log.msi.log"
$reportPath = "outputs\diagnosis-report_$(Get-Date -Format yyyyMMddHHmmss).txt"
New-Item -ItemType Directory -Path "outputs" -Force | Out-Null

# ---------------------------
# 2. Function to write diagnostic report
# ---------------------------
function Write-Report {
    param($msg)
    Add-Content -Path $reportPath -Value "$(Get-Date -Format 'HH:mm:ss') $msg"
    Write-Host $msg
}

Write-Report "=== Application Install Diagnosis Report ==="
Write-Report "Starting system scan and analysis..."

# ---------------------------
# 3. Common MSI Installer Error Codes (Enterprise Standard)
# ---------------------------
$errorCodes = @{
    "1603" = "Fatal error during installation. Possible causes: insufficient permissions, file in use, missing dependencies, corrupted installer."
    "1618" = "Another installation is already in progress. Concurrent installations are not allowed."
    "1605" = "Product is not installed. Uninstall operation failed."
    "1612" = "Installation source is missing or unavailable."
}

# ---------------------------
# 4. Analyze MSI Log File
# ---------------------------
$foundErrors = @()
if (Test-Path $logFile) {
    Write-Report "✅ Log file found. Starting log analysis..."
    $log = Get-Content $logFile -Raw

    foreach ($code in $errorCodes.Keys) {
        if ($log -match "value $code") {
            $foundErrors += @{
                Code   = $code
                Reason = $errorCodes[$code]
            }
        }
    }
}
else {
    Write-Report "❌ Log file not found. Installation may not have started."
}

# ---------------------------
# 5. SCCM Detection Method Validation
# ---------------------------
Write-Report "`n=== SCCM Detection Check ==="
$testPath = "C:\Program Files\7-Zip\7z.exe"
$testReg = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*"

if (Test-Path $testPath) {
    Write-Report "✅ File detection passed: SCCM can identify the application."
    $ver = (Get-Item $testPath).VersionInfo.ProductVersion
    Write-Report "✅ Application version detected: $ver"
}
else {
    Write-Report "❌ File missing: SCCM will report installation failure."
}

# ---------------------------
# 6. Administrator Privilege Check
# ---------------------------
Write-Report "`n=== Permission Check ==="
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if ($currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Report "✅ Running with Administrator privileges (required for enterprise deployments)."
}
else {
    Write-Report "❌ NOT running as Administrator: Silent install will likely fail."
}

# ---------------------------
# 7. Final Diagnosis Summary
# ---------------------------
Write-Report "`n=== Final Diagnosis ==="
if ($foundErrors.Count -gt 0) {
    foreach ($e in $foundErrors) {
        Write-Report "❗ Error $($e.Code): $($e.Reason)"
    }
    Write-Report "💡 Suggested fixes: Run as admin, close conflicting installers, verify dependencies, check installer integrity."
}
else {
    Write-Report "✅ No critical errors found. Installation should succeed."
}

Write-Report "`n=== Diagnosis Completed ==="
Write-Host "`n✅ Report generated: $reportPath"