cls; Write-Host "#### OPERATORS ####"; 
$A = "apple"; $B = "banana"; $C = 10; $D = 20; $E = $true # sample dataS
# -eq EQUALS
if($A -eq "apple") { Write-Host "$A is apple" } 
# -ne NOT EQUALS
if($B -ne "apple") { Write-Host "$B is not apple" } 
# -lt LESS THAN
if($C -lt 100) { Write-Host "$C is less than 100" }
# -and AND
# -gt GREATER THAN
if( ($D -lt 100) -and ($D -gt 5) ) { Write-Host "$D is between 5 and 100" }
# -not NOT
if( -not ( ($D -lt 100) -and ($D -gt 5) ) ) { Write-Host "$D is not between 5 and 100" }
# $true TRUE
if($E -eq $true) { 	Write-Host "$E is true" }