cls; Write-Host "#### REPLACE TEXT EXAMPLE ####"
function Invoke-ReplaceTextExample() {
<#
.SYNOPSIS
	Accept text lines from the pipeline and convert all keys found
	in Replacement to their corresponding value

.EXAMPLE
	"<b>bold</b>`n<i>italic</i>" | InvokeReplaceTextExample -Replacement @{"<"="&lt;"; ">"="&gt;"}
	
	Example will return "&lt;b&gt;bold&lt;/b&gt;`n&lt;i&gt;italic&lt;/i&gt;"

.NOTES
	Brian Woelfel 4/1/2019
#>
	param(
		[Parameter(ValueFromPipeline=$true, Mandatory=$true)] # Pipeline input goes to this variable
		[string[]] 
		$Data,

		[Parameter(Mandatory=$true)]
		[hashtable]$Replacement
	)

	process {
		$Replacement.Keys | % { 
			$Data = $Data -replace $_,$Replacement[$_]
		}
		$Data # this pushes it out the output pipeline
	}
}

# Simple example
"<html>`n<body>`nHello`n</body>`n</html>" | Invoke-ReplaceTextExample -Replacement @{ "<"="&lt;"; ">"="&gt;" }
