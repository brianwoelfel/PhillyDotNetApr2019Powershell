$MyArray1 = @()
$MyArray1 += "a"
$MyArray1 += "b"
$MyArray1 += "c"
Write-Host "Array 1" $MyArray1

$MyArray2 = @("a", "b", "c")
Write-Host "Array 2" $MyArray2

$MyArray3 = ("a", "b", "c")
Write-Host "Array 3" $MyArray3

$MyArray4 = "a", "b", "c"
Write-Host "Array 4" $MyArray4
