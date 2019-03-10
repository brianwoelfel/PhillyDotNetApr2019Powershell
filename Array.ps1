$MyArray1 = @()
$MyArray1 += "a"
$MyArray1 += "b"
$MyArray1 += "c"

$MyArray2 = @("a", "b", "c")

$MyArray3 = ("a", "b", "c")

$MyArray4 = "a", "b", "c"

Write-Host $MyArray1
Write-Host $MyArray2
Write-Host $MyArray3
Write-Host $MyArray4
