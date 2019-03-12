function Invoke-MyFunc3($A) {
	# This does what you expect
	return $A
}

function Invoke-MyFunc4 {
	# Unexpected, just a value with no action is also a return value
	"R"
}

function Invoke-MyFunc5 {
	# Very unexpected-- multiple isolated values and a return value 
	# returns an array
	"R"
	"X"
	return "T"
}

function Invoked-MyFunc6 {
	# Sometimes you get an array returned instead of a string
	Invoke-SomeFuncThatReturnsAStringButYouDidntRealizeIt
	return "ABC"
}

