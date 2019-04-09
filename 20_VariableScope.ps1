cls; Write-Host "#### VARIABLE SCOPE ####"

$A = 10
if($true -eq $true) {
	$B = 20 # Note that $B is introduced inside curly braces
}
$A++
$B++
Write-Host "A=$A, B=$B"  # Doesn't behave like C#
