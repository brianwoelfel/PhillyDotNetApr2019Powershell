cls; Write-Host "#### WHERE ####"
$Arr = (1..10) # Define a simple array 1 to 10

# Only show items greater than 8, remember $_ is the current loop variable
Write-Host "Test 1: "
$Arr | Where-Object { $_ -gt 8 }
# C# version: arr.Where(x => x > 8).ToList().ForEach(x => Console.WriteLine(x));

# "where" is synonymous with "Where-Object"
Write-Host "Test 2: "
$Arr | where { $_ -gt 8 }

# so is "?"
Write-Host "Test 3: "
$Arr | ? { $_ -gt 8 }