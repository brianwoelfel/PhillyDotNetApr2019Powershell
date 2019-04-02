cls; Write-Host "#### STRING EVALUATION ####"
$A = "Hello" # Define some variables
$B = "World"
$C = 10

Write-Host 'Test 1: $A $B $C' # Single quotes don't expand variables
Write-Host "Test 2: $A $B $C" # Double quotes support variable expansion
Write-Host "Test 3: $A $B $($C + 5)" # Within double quotes use $() to evaluate code
# Start multiline string with @" and end "@ on it's own line
Write-Host @"
Test 4: multiline string with evaluation,
   and use backtick to escape dollar sign
`$A=$A `$B=$B
"@
