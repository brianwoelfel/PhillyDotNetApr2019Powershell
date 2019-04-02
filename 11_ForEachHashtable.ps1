cls; Write-Host "#### FOREACH HASHTABLE ####"

# @{} is syntax for initializing a hashtable
$Hash = @{ "Fruit"="Apple"; "Vegetable"="Asparagus"; "Bird"="Albatross" } # Sample hash

# Get an enumerator for the hashtable
foreach ($KeyValuePair in $Hash.GetEnumerator()) {
	Write-Host "Test 1: Key=$($KeyValuePair.Key), Value=$($KeyValuePair.Value)"
}

# Loop through the keys
foreach($Key in $Hash.Keys) { Write-Host "Test 2: Key=$Key, Value=$($Hash[$Key])" }

# Loop through the keys in shorthand.  We'll come back to this.
$Hash.Keys | % { "Test 3: Key=$_, Value=$($Hash[$_])" }