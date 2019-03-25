function string Blah1(string firstName, string lastName) {

	if(firstName == "Tom") {
	 	firstName = "Thomas"
	}
	name = firstName + " " + lastName
	return name
}


function Blah2([string] $firstName, [string] $lastName) {

	if($firstName -eq "Tom") {
	 	$firstName = "Thomas"
	}
	$name = $firstName + " " + $lastName
	return $name
}


ss64.com

