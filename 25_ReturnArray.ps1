cls; Write-Host "#### RETURN ARRAY ####"
function Invoke-ReturnArray1 { return @("a", "b", "c") }
Write-Host "Invoke-ReturnArray1" (Invoke-ReturnArray1).GetType().Name

function Invoke-ReturnArray2 { return @("a") } # UNEXPECTED returns a string, not array
Write-Host "Invoke-ReturnArray2" (Invoke-ReturnArray2).GetType().Name

function Invoke-ReturnArray3 { return "a" }
Write-Host "Invoke-ReturnArray3" (Invoke-ReturnArray3).GetType().Name

function Invoke-ReturnArray4 { return ,@("a") } # Prefix with comma to force array return
Write-Host "Invoke-ReturnArray4" (Invoke-ReturnArray4).GetType().Name

function Invoke-ReturnArray5 { return ,@("a", "b", "c") }
Write-Host "Invoke-ReturnArray5" (Invoke-ReturnArray5).GetType().Name

<#
More info: https://blog.tyang.org/2011/02/24/powershell-functions-do-not-return-single-element-arrays/
#>