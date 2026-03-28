$service = "MyAppService"
if (Get-Service $service -ErrorAction SilentlyContinue) {
    exit 0
}
exit 1