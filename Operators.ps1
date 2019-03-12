$A = "apple"
$B = "banana"
$C = 10
$D = 20
$E = $true

if($A -eq "apple") { 
	Write-Host "$A is apple" 
} 
if($B -ne "apple") { 
	Write-Host "$B is not apple" 
} 
if($C -lt 100) { 
	Write-Host "$C is less than 100" 
}
if( ($D -lt 100) -and ($D -gt 5) ) { 
	Write-Host "$D is between 5 and 100" 
}
if( -not ( ($D -lt 100) -and ($D -gt 5) ) ) { 
	Write-Host "$D is not between 5 and 100" 
}
if($E -eq $true) { 
	Write-Host "$E is true" 
}


