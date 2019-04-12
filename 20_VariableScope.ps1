cls; Write-Host "#### VARIABLE SCOPE ####"

$A = 10
if($true -eq $true) {
	$B = 20 # Note that $B is introduced inside curly braces
}
$A++
$B++ # And powershell is totally cool with it

function Invoke-VariableScope() { return $B } 
$C = Invoke-VariableScope 

Write-Host "A=$A, B=$B, C=$C"  # Doesn't behave like C#

# TIP: It's really confusing how functions are okay with variables
# defined above them.  It's not true class members, it's just confusing,
# it's best to avoid that altogether.

# OPINION: There's weird stuff about global variables with this syntax
# $global:MyGlobalVar, but I find it confusing and makes code difficult
# to understand.
