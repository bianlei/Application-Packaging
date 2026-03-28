if (Test-Path "C:\App\app.exe") {
    Write-Host "App already installed"
} else {
    Write-Host "Need to install"
}