$reg = "HKLM:\SOFTWARE\7-Zip"
if (Get-ItemProperty $reg -ErrorAction SilentlyContinue) {
    exit 0
} else {
    exit 1
}