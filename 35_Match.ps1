#
# -like compares two strings with simple regex like DOS "*.txt"
#
# -match compares two strings with full C# regex like "*\.txt"
#


if ('pineapple' -like '*apple*') { Write-Host "1: match" } else { Write-Host "1: not match" }

if ('pineapple' -like '*x*') { Write-Host "2: match" } else { Write-Host "2: not match" }

if ('pineapple' -match '^pine.*pp.*$') { Write-Host "3: match" } else { Write-Host "3: not match" }

