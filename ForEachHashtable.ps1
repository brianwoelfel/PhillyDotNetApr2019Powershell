$Hash = @{ "Fruit"="Apple"; "Vegetable"="Asparagus"; "Bird"="Albatross" }

foreach ($KeyValuePair in $Hash.GetEnumerator()) {
	Write-Host "test 3: Key=$($KeyValuePair.Key), Value=$($KeyValuePair.Value)"
}

foreach($Key in $Hash.Keys) {
	Write-Host "test 2: Key=$Key, Value=$($Hash[$Key])"
}

$Hash.Keys | % {
	Write-Host "test 1: Key=$_, Value=$($Hash[$_])"
}


