cls; Write-Host "#### STRING EVALUATION ####"
$A = "Hello" # Define some variables
$B = "World"; $C = 10 # Separate multiple lines with semi-colon

Write-Host 'Test 1: $A $B $C' # Single quotes don't expand variables

Write-Host "Test 2: $A $B $C" # Double quotes support variable expansion
# C# version: Console.WriteLine($"Test 2: {a} {b} {c}");

Write-Host "Test 3: $A $B $($C + 5)" # Within double quotes use $() to evaluate code
# C# version: Console.WriteLine($"Test 3: {a} {b} {(c + 5)}");

# Start multiline string with @" and end "@ ***left-justified on it's own line***
Write-Host @"
Test 4: multiline string with evaluation,
    and use backtick to escape dollar sign
    `$A=$A `$B=$B
"@
# C# version: Console.WriteLine($@"
#    Test 4: multiline string with evaluation,
#    a={a} b={b}
# ");
  