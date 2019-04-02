cls; Write-Host "#### RETURN ####"
function Invoke-Return1() { return "xyz" } # Behaves like you expect
Write-Host "Invoke-Return1: " (Invoke-Return1)

function Invoke-Return2() { $MyStr = "" } # Returns nothing, like you expect
Write-Host "Invoke-Return2: " (Invoke-Return2)

function Invoke-Return3 { "xyz" } # Unexpected returns "xyz" without "return" keyword
Write-Host "Invoke-Return3: " (Invoke-Return3)

# UNEXPECTED returns array of "abc","def","ghi"
function Invoke-Return4 {
	"abc"
	"def"
	"ghi"
}
Write-Host "Invoke-Return4: " (Invoke-Return4)

