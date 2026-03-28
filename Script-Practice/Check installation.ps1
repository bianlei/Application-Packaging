$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\AppName"
$version = Get-ItemProperty -Path $registryPath -Name "DisplayVersion" -ErrorAction SilentlyContinue

if ($version -and $version.DisplayVersion -eq "2.0") {
    Write-Host "App is installed. Version: $version"
    exit 0
} else {
    Write-Host "App is not installed."
    exit 1
}