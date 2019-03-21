# VariableScope.ps1


function MyFunc() {
	# $A is not a parameter
	$A = 10
}


if($true -eq $true) {
	# Note that $B is introduced inside curly braces
	$B = 1
}

$B++
MyFunc

Write-Host "A=$A, B=$B"
