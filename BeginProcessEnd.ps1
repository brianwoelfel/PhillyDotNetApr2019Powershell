function Blah {
	# This function supports pipeline input
	[CmdletBinding()]
	param(
		# Pipeline input goes to this variable
		[Parameter(ValueFromPipeline=$true)]
		# UNEXPECTED this is [string] not [string[]]
		[string]
		$Item,

		# This is another parameter that is not part of the pipeline
		[string]
		$AnotherParam="test"
	)

	# Run this once only at the beginning, $Item isn't defined
	begin {
		Write-Host "begin AnotherParam=$AnotherParam, Item=$Item"
	}

	# UNEXPECTED: an implicit foreach loop
	# Powershell automatically calls this for each $Item in pipeline
	# input.  Note that $_ is implicitly also assigned that value
	process {
		Write-Host "process AnotherParam=$AnotherParam, Item=$Item, `$_=$_"
	}

	# Run this once only at the end
	# NOT SURE WHAT TO EXPECT: $Item retains last value
	end {
		Write-Host "end AnotherParam=$AnotherParam, Item=$Item"
	}

}

function Blah2 {
	# UNEXPECTED with begin/process/end,
	# I don't have to explicitly state it's a cmdlet
	# or uses pipeline, and $Item is implicitly not an array
	param(
		$Item
	)

	begin {
		Write-Host "begin `$_=$_"
	}

	process {
		Write-Host "process `$_=$_"
	}

	end {
		Write-Host "end `$_=$_"
	}
}

#
# MAYBE there's some efficiency for really large sets 
# where it's a true pipeline, but that's really
# hard to do right
#

#
# $input is a keyword
#