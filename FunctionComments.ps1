function Invoke-MyFunc1 {
<#
.SYNOPSIS
	A quick one sentence summary of Invoke-MyFunc1

.DESCRIPTION
	A longer description of Invoke-MyFunc1.

	Can include several paragraphs.

.PARAMETER A
	Input file containing markdown syntax

.PARAMETER B
	Output file name

.PARAMETER C
	String for top of HTML file with all the content headers (generated content goes after this).

.EXAMPLE
	"ABC" | Invoke-MyFunc1

	Example returns "A=ABC, B=banana, C=5".  Every example must be a single line of code, followed by
	a paragraph explanation of return value and what happened.

.EXAMPLE
	Invoke-MyFunc1 -A apricot -B blueberry -C 100

	Returns "A=apricot, B=blueberry, C=100".  It's fine to have multiple examples

.NOTES
	Brian Woelfel 3/1/2019
#>
	[cmdletBinding()]
	param (
		[parameter(Mandatory=$true, ValueFromPipeline)]
		[String]
		$A,

		[String]
		$B = "banana",

		[int]
		$C = 5
	)

	Write-Output "A=$A, B=$B, C=$C"
}

Invoke-MyFunc1 "apple" "bear"