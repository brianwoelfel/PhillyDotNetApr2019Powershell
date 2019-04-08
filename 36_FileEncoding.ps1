cls; Write-Host "#### FILE ENCODING ####"

$File =  "$($ENV:TEMP)\test.txt"
echo "A" > $File
$Len = (Get-ChildItem -Path $File)[0].Length
Write-Host "File with 'A' length is $Len"

# Why is "echo A" produce 8 bytes?
# Powershell outputs UTF 16 with
# BOM marker          xFFFE (2 bytes)
# Character "A"       x4100 (2 bytes)
# Carriage return `r  x0D00 (2 bytes)
# Line feed       `n  x0A00 (2 bytes)

echo "A" > $File
$Len = (Get-ChildItem -Path $File)[0].Length
Write-Host "File with 'A' length is $Len"
