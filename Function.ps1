function Invoke-MyFunc($A, $B, $C) {
	Write-Host "A=$A, B=$B, C=$C"
}
Invoke-MyFunc "apple", "banana", "carrot" # NOT WHAT YOU THINK IT IS

Invoke-MyFunc "apple" "banana" "carrot"

Invoke-MyFunc -A apple -B banana -C carrot # This is easiest to read and unambiguous

$Splat = @{ "A"="apple"; "B"="banana"; "C"="carrot" }
Invoke-MyFunc @Splat