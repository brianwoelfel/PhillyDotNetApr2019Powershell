cls; Write-Host "#### FUNCTIONS ####"
function Invoke-MyFunc($A, $B, $C) { Write-Host "A=$A, B=$B, C=$C" } # Simple func

# This is the WRONG way to call it -- the commas imply the args are a single array
Invoke-MyFunc "apple", "banana", "carrot" 

Invoke-MyFunc "apple" "banana" "carrot" # This is the right way to call it

Invoke-MyFunc -A "apple" -B "banana" -C "carrot" # Easier to read

Invoke-MyFunc @("apple", "banana", "carrot") "ABC" "XYZ" # Note first arg is array

# Pass in all your parameters at once called "splatting"
$Splat = @{ "A"="apple"; "B"="banana"; "C"="carrot" }
Invoke-MyFunc @Splat # Note the at-sign prefix