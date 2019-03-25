if ('pineapple' -like '*apple*') { Write-Host "match" } else { Write-Host "not match" }

if ('pineapple' -like '*x*') { Write-Host "match" } else { Write-Host "not match" }

if ('pineapple' -match '^pine.*pp.*$') { Write-Host "match" } else { Write-Host "not match" }

