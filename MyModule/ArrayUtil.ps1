function Test-ArrayBlank([string[]]$Arr) {
<#
.SYNOPSIS
	Return false if there's at least one non-blank item in the supplied string array, else true.

.EXAMPLE
	Test-ArrayBlank @("A", "B", "C")
	Returns $false
	
.EXAMPLE
	Test-ArrayBlank @()
	Returns $true
	
.EXAMPLE
	Test-ArrayBlank $null
	Returns $true

.EXAMPLE
	Test-ArrayBlank @("", "", "")
	Returns $true

.NOTES
	Brian Woelfel 7/1/2018
#>
	$result = $true
	$Arr | % {
		$result = $result -and [string]::IsNullOrWhitespace($_)
	}
	return $result
}

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



function Test-ArrayEqual($A1, $A2) {
<#
.SYNOPSIS
	Return true if two arrays are equal, ignoring order.  Treats $null and empty array as same.

.EXAMPLE
	Test-ArrayEqual @("A", "B", "C") @("C", "B", "A")
	# returns $true

	Test-ArrayEqual @("A", "B", "C") @("D", "E", "F")
	# returns $false

	Test-ArrayEqual @() $null
	# returns $true

.NOTES
	Brian Woelfel 7/1/2018
	
	From https://rkeithhill.wordpress.com/2008/05/11/effective-powershell-item-13-comparing-arrays-in-windows-powershell/
#>
	if($A1 -eq $null) {
		$A1 = @()
	}

	if($A2 -eq $null) {
		$A2 = @()
	}

	# This is really confusing, but an array containing a single null, we'll change back to empty array
	# because powershell is always rearranging stuff on us.
	if(($A1.Length -eq 1) -and ($A1[0] -eq $null)) {
		$A1 = @()
	}
	if(($A2.Length -eq 1) -and ($A2[0] -eq $null)) {
		$A2 = @()
	}

	# both empty?  they match
	if(($A1.Length -eq 0) -and ($A2.Length -eq 0)) {
		return $true
	}

	# only one empty? no good
	if(($A1.Length -eq 0) -or ($A2.Length -eq 0)) {
		return $false
	}
	
	if ($A1 -isnot [array] -or $A2 -isnot [array]) { 
      throw "Both inputs must be an array a1=$($A1), a2=$($A2)"
    }
    if ($A1.Rank -ne $A2.Rank) { 
      return $false 
    }

	# Make copies and sort
	$a1Copy = @($A1 | sort)
	$a2Copy = @($A2 | sort)

    if ([System.Object]::ReferenceEquals($a1Copy, $a2Copy)) {
      return $true
    }
    for ($r = 0; $r -lt $a1Copy.Rank; $r++) {
      if ($a1Copy.GetLength($r) -ne $a2Copy.GetLength($r)) {
            return $false
      }
    }	

    $enum1 = $a1Copy.GetEnumerator()
    $enum2 = $a2Copy.GetEnumerator()   

    while ($enum1.MoveNext() -and $enum2.MoveNext()) {
		if ($enum1.Current -ne $enum2.Current) {
			return $false
		}
    }
    return $true
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
	if ($Array.length -lt 1 ) { 
		# Array is empty?  that's fine
		return $List
	}

	return	$Array | Where-Object { $_ -ne $Item }
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
	if(($SomeList -eq $null) -or ($SomeList.Length -eq 0)) {
		return $SomeList
	} elseif(($removeThisStuff -eq $null) -or ($removeThisStuff.Length -eq 0)) {
		return $SomeList
	} else {
		$result = @()
		$SomeList | % {
			if(-not ($removeThisStuff -contains $_)) {
				$result += $_
			}
		}
		return $result
	}
}




function Remove-UtfBom() {
<#
.SYNOPSIS
	Given a file, convert to UTF8 with no BOM.
	See https://stackoverflow.com/questions/5596982/using-powershell-to-write-a-file-in-utf-8-without-the-bom/5596984#5596984

.NOTES
	Brian Woelfel 11/1/2018
#>
	param(
		[string]$InputFile
	)

	$MyFile = Get-Content $InputFile
	$Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False
	[System.IO.File]::WriteAllLines($InputFile, $MyFile, $Utf8NoBomEncoding)	
}


function Invoke-ReplaceTextInFile() {
<#
.SYNOPSIS
	Given a $InputFile and a hashtable of find/replace pairs,
	perform line-by-line replacements of all items and
	save results back to $OutputFile.  If $OutputFile is blank
	will overwrite $InputFile

.EXAMPLE
	"apple banana cherry`navacado" > c:\temp\test.txt; Invoke-ReplaceTextInFile -InputFile c:\temp\test.txt @{ "a"="X"; "b"="Y"; "c"="Z" }
	
	Example will return "Xpple YXnXnX Zherry`nXvXZXdo"

.NOTES
	Brian Woelfel 12/1/2018
#>

	param(
		[Parameter(Mandatory=$true)]
		[string]$InputFile, 

		[Parameter(Mandatory=$true)]
		[hashtable]$Replacement,

		[string]$OutputFile
	)

	if([string]::IsNullOrWhitespace($OutputFile)) {
		$OutputFile = $InputFile 
	}

	$Lines = Get-Content -Path $InputFile
	$Lines | ForEach-Object {
		$Line = $_
		$Replacement.GetEnumerator() | % {
			if ($Line -match $_.Key) {
				$Line = $Line -replace $_.Key, $_.Value
			}
		}
		$Line
	} | Set-Content -Path $OutputFile
}


function Get-TextSummary() {
<#
.SYNOPSIS
	Given a string with a lot of text and embedded spaces, tabs, and newlines, 
	grab a summary of the first few words as a simple string.

.EXAMPLE
	"The quick brown fox jumped over the lazy dog" | Get-TextSummary -WordCount 5 
	
	Returns "The quick brown fox jumped..."

.NOTES
	Brian Woelfel 12/1/2018
#>
	[cmdletBinding()]
	param(
		[parameter(ValueFromPipeline)]
		[array]$Text,

		[int]$WordCount = 10
	)

	
	begin {
		[string[]]$AllLines = @()
	}

	# Take each line of input,
	# and if we find a single line with embedded newlines,
	# split them out
	process {
		foreach($Line in $Text) { 
			foreach($SubLine in ($Line -split "`n")) {
				$AllLines += $SubLine
			}
		}
	}

	end {
		# Loop through all lines
		$Result = @()
		foreach($Line in $AllLines) {
			# Collapse all whitespace
			$Line = $Line -replace "[ \t]+"," "
			$Line = $Line.Trim()
			
			foreach($Word in ($Line -split ' ' | where-object { ! [string]::IsNullOrWhitespace($_) } ) ) {
				$Result += $Word

				if($Result.Length -ge $WordCount) {
					return "$($Result -join ' ')..."
				}
			}
		}
		return $Result -join ' '

	}
}


