cls; Write-Host "#### JOIN AND SPLIT ####"

Write-Host "Test 1: "
@("a", "b", "c") -join ',' # Join an array with a delimiter

Write-Host "Test 2: "
"a,b,c" -split ',' # Split a string into an array by a delimiter 

Write-Host "Test 3: "
"a,b;c:d!e" -split '[,;:!]' # Split a string by regex

Write-Host "Test 4: "
("a,b;c:d!e" -split '[,;:!]') -join "#" # Nest split result with parens, then join result