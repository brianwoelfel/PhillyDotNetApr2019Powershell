cls; Write-Host "#### BEGIN PROCESS END 1 ####"
function Invoke-BeginProcessEnd1 {
	[CmdletBinding()] # This function supports pipeline input
	param(
		[Parameter(ValueFromPipeline=$true)] # Pipeline input goes to this variable
		[string[]] 
		$Item,
		
		[string] $AnotherParam="test" # This is another parameter that is not part of the pipeline
	)

	begin { # Run this once only at the beginning, $Item isn't defined.  "begin" is a reserved word in Powershell
		Write-Host "begin AnotherParam=$AnotherParam, Item=$Item"
	}

	# Implicitly repeat this block for each line of pipeline input via $_
	process { # "process" is a reserved word in Powershell
		Write-Host "process AnotherParam=$AnotherParam, Item=$Item, `$_=$_"
	}

	end { # Run this code block once at end.  "end" is a reserved word in Powershell
		Write-Host "end AnotherParam=$AnotherParam, Item=$Item"
	}
}
@("A","B","C") | Invoke-BeginProcessEnd1 -AnotherParam "xxx"