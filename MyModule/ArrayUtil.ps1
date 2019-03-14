function Invoke-HelloWorld {
	Write-Host "Hello world"
}

function Convert-HashtableToString {
<#
.SYNOPSIS
	Convert hashtable to string like key1=value2, key2=value2, ...

.EXAMPLE
	Convert-HashtableToString ${ "A"="1"; "B"="2"; "C"="3"; } 
	Returns "A=1;B=2;C=3"

.NOTES
	Brian Woelfel 7/1/2018
#>
	[cmdletBinding()]
	param (
		[Parameter(ValueFromPipeline=$True)]
		$Hash
	)

	return ( $Hash.Keys | sort | % { "$($_)=$($Hash[$_])" } ) -join ', '
}

function Remove-ItemFromArray($Item,[array]$Array)
{
<#
.SYNOPSIS
	Return an array with all occurrences of specified item removed

.EXAMPLE
	Remove-ItemFromArray -Item "A" -Array @("A", "B", "C", "A", "D")
	Returns @("B", "C", "D")
	
.NOTES
	Brian Woelfel 7/1/2018
#>
	return $Array | ? { $_ -ne $Item }
}

function Get-ArraySubtraction([array]$SomeList, [array]$removeThisStuff) {
<#
.SYNOPSIS
	Return array $SomeList with all matching entries from array $removeThisStuff removed.

.EXAMPLE
	Get-ArraySubtraction @("A", "B", "C") @("C")
	Returns @("A", "B") 
	
.NOTES
	Brian Woelfel 7/1/2018
#>
	$removeThisStuff | % { 
		$SomeList = Remove-ItemFromArray -Item $_ -Array $SomeList
	}
	return $SomeList
}
