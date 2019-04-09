cls; Write-Host "#### RETURN CONTINUED ####"
function Invoke-Return2_1 { 	# UNEXPECTED returns array of "abc","xyz" 
	"abc"
	return "xyz"
}
Write-Host "Invoke-Return2_1" (Invoke-Return2_1)

function Invoke-Return2_2 { 	# makes the directory and returns Dir object and "abc"
	if(Test-Path c:\temp\foo) { rmdir c:\temp\foo } # Remove dir if exists
	mkdir c:\temp\foo # make the directory - this returns a directory object
	return "abc"
}
Write-Host "Invoke-Return2_2" (Invoke-Return2_2)

# returns "abc" because Write-Output is for pipeline output
function Invoke-Return2_3 { Write-Output "abc"; Write-Host "def" }      
Write-Host "Invoke-Return2_3" (Invoke-Return2_3)