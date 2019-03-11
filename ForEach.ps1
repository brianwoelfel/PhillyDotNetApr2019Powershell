$Arr = @("apple", "banana", "cranberry")

for($I = 0; $I -lt $Arr.Length; $I++) {	Write-Host "sample 1:" $Arr[$I] }

$Arr | ForEach-Object { Write-Host "sample 2: $_" }

$Arr | foreach { Write-Host "sample 3: $_" }

$Arr | % { Write-Host "sample 4: $_" }

foreach($Item in $Arr) { Write-Host "sample 5: $Item" }