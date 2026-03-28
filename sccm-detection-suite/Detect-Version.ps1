$path = "C:\Program Files\7-Zip\7z.exe"
if (Test-Path $path) {
    $ver = (Get-Item $path).VersionInfo.ProductVersion
    if ($ver -ge "24.00") { exit 0 }
}
exit 1