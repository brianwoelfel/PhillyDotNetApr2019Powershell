cls; Write-Host "#### FOREACH ####"
$Arr = @("apple", "banana", "cranberry") # Define a simple array

for($I = 0; $I -lt $Arr.Length; $I++) {	Write-Host "Sample 1:" $Arr[$I] } # old school

$Arr | ForEach-Object { Write-Host "Sample 2: $_" } # Pipe array into powershell, $_ loop var

$Arr | foreach { Write-Host "Sample 3: $_" } # "foreach" means same as "ForEach-Object"

$Arr | % { Write-Host "Sample 4: $_" } # this is powershell shorthand for "ForEach"

foreach($Item in $Arr) { Write-Host "Sample 5: $Item" } # foreach with explicit loop var

# C# Version: string[] myArr = { "a", "b", "c" }; myArr.ToList().ForEach(x => Console.WriteLine(x));
