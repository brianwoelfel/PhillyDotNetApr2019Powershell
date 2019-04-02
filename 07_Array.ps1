cls; Write-Host "#### ARRAYS ####"
$MyArray1 = @() # Define a blank array
$MyArray1 += "a" # Append items to array, technically makes copies of array
$MyArray1 += "b"
$MyArray1 += "c"
Write-Host "Test 1: " $MyArray1

$MyArray2 = @("a", "b", "c") # Explicitly define an array, easy to read and unambiguous
Write-Host "Test 2: " $MyArray2
$MyArray3 = ("a", "b", "c") # I guess you don't really need @
Write-Host "Test 3: " $MyArray3
$MyArray4 = "a", "b", "c" # I guess you don't really need parenthesis either
Write-Host "Test 4: " $MyArray4
$MyArray5 = (1..10); # Short cut for arrays of integers 1 to 10
Write-Host "Test 5: " $MyArray5
