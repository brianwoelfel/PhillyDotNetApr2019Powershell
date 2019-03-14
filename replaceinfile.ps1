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
	$Lines | ForEach($Line in $Lines) {
		$Replacement.GetEnumerator() | % {
			if ($Line -match $_.Key) {
				$Line = $Line -replace $_.Key, $_.Value
			}
		}
		Write-Output $Line
	} | Set-Content -Path $OutputFile
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

	$Lines = gc $InputFile
	$Lines | % {
		$Replacement.Keys | % {
			if ($Line -match $_) {
				$Line = $Line -replace $_, $Replacements[$_]
			}
		}
		$Line
	} | sc $OutputFile
}
