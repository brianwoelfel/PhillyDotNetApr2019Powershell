cls; Write-Host "#### FILE ENCODING ####"

$File =  "$($ENV:TEMP)\test.txt"
echo "A" > $File  # "echo" is abbreviation for Write-Host
$Len = (Get-ChildItem -Path $File)[0].Length
Write-Host "Test 1: File with 'A' length is $Len"
# Why is "echo A" produce 8 bytes?  Powershell outputs UTF 16 by default
# BOM marker          xFFFE (2 bytes)
# Character "A"       x4100 (2 bytes)
# Carriage return `r  x0D00 (2 bytes)
# Line feed       `n  x0A00 (2 bytes)

# In new PowerShell version 6: "A" | Out-File -Encoding UTF8NoBom 

[IO.File]::WriteAllLines($File,"A") # Low level C# WriteAllLines does UTF8 no BOM
Write-Host "Test 2: File with 'A' length is" (Get-ChildItem -Path $File)[0].Length

# See also https://stackoverflow.com/questions/5596982/using-powershell-to-write-a-file-in-utf-8-without-the-bom