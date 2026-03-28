$path = "C:\Program Files\7-Zip\7z.exe"
if (Test-Path $path) {
    exit 0
} else {
    exit 1
}