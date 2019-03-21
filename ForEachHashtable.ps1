$Hash = @{ "Fruit"="Apple"; "Vegetable"="Asparagus"; "Bird"="Albatross" }

$Hash.Keys | % {
	Write-Host "test 1: Key=$_, Value=$($Hash[$_])"
}

foreach($Key in $Hash.Keys) {
	Write-Host "test 2: Key=$Key, Value=$($Hash[$Key])"
}

do an enumerator example