cls; Write-Host "#### LIKE MATCH ####"
# -like compares two strings with simple regex like DOS "A*.txt"
if ('pineapple' -like '*apple*') { Write-Host "1: match" } else { Write-Host "1: not match" }

if ('pineapple' -like '*x*') { Write-Host "2: match" } else { Write-Host "2: not match" }

# -match compares two strings with full C# regex like "^A.*\.txt$"
if ('pineapple' -match '^pine.*pp.*$') { Write-Host "3: match" } else { Write-Host "3: not match" }

