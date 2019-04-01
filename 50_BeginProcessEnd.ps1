function BeginProcessEnd1 {
	[CmdletBinding()] # This function supports pipeline input
	param(
		[Parameter(ValueFromPipeline=$true)] # Pipeline input goes to this variable
		[string] # UNEXPECTED this is [string] not [string[]]
		$Item,
		
		[string] $AnotherParam="test" # This is another parameter that is not part of the pipeline
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
	# NOT SURE IF EXPECTED: $Item retains last value
	end {
		Write-Host "end AnotherParam=$AnotherParam, Item=$Item"
	}

}

function BeginProcessEnd2 {
	# UNEXPECTED with begin/process/end,
	# I don't have to explicitly state it's a cmdlet
	# or uses pipeline, and don't even have to define
	# parameters

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