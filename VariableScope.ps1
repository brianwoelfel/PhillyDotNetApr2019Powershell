# VariableScope.ps1
$A = 1
if($true -eq $true) {
	# Note that $B is introduced inside curly braces
	$B = 1
}
$A++
# Here Powershell acts like old fashioned JavaScript and doesn't care
$B++
Write-Host "A=$A, B=$B"

# OUTPUT:
# PS C:\> . c:\code\pdnp\VariableScope.ps1
# A=2, B=2