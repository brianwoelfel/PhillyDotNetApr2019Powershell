function Invoke-MyFunc3a() {
	# This does what you expect, returns "xyz"
	return "xyz"
}

function Invoke-MyFunc3b() {
	# This does what you expect, returns nothing
	$MyStr = ""
}

function Invoke-MyFunc4 {
	# UNEXPECTED returns "xyz" even without return keyword
	"xyz"
}

function Invoke-MyFunc4 {
	# UNEXPECTED returns array of "abc","def","ghi"
	"abc"
	"def"
	"ghi"
}

function Invoke-MyFunc4 {
	# UNEXPECTED returns array of "abc","xyz" 
	"abc"
	return "xyz"
}


function Invoked-MyFunc6 {
	# Sometimes you get an array returned instead of a string
	Invoke-SomeFuncThatReturnsAStringButYouDidntRealizeIt
	return "ABC"
}

function Invoke-MyFunc7 {
	# makes the directory
	# UNEXPECTED returns an array of mkdir output with is a file directory object
	# and the return value "abc"
	mkdir c:\temp\foo
	return "abc"
}

function Invoke-MyFunc7 {
	# UNEXPECTED returns "abc"
	Write-Output "abc"
}

