$MyHash1 = @{}
$MyHash1["a"] = 1
$MyHash1["b"] = 2
$MyHash1["c"] = 3

$MyHash2 = @{}
$MyHash2.a = 1
$MyHash2.b = 2
$MyHash2.c = 3

$MyHash3 = @{ "a"=1; "b"=2; "c"=3; }

function Convert-HashtableToString {
<#
.SYNOPSIS
	Convert hashtable to string like key1=value2,key2=value2,...

.EXAMPLE
	Convert-HashtableToString ${ "A"="1"; "B"="2"; "C"="3"; } 
	Returns "A=1;B=2;C=3"

.NOTES
	Brian Woelfel 7/1/2018
#>
	[cmdletBinding()]
	param (
		[Parameter(ValueFromPipeline=$True)]
		$hash
	)

	if($hash -eq $null) {
		return ""
	} else {
		$A = $hash.GetEnumerator() | % { "$($_.Name)=$($_.Value)" } 

		# Don't order keys if already ordered
		if("System.Collections.Specialized.OrderedDictionary" -eq $hash.GetType().ToString()) {
			$B = $A
		} else {
			$B = $A | sort
		}

		$result = $B -join ','
		return $result
	}
}

Write-Host Convert-HashtableToString $MyHash1
Write-Host Convert-HashtableToString $MyHash2
Write-Host Convert-HashtableToString $MyHash3
