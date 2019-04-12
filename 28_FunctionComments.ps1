cls; Write-Host "#### FUNCTION COMMENTS ####"
function Invoke-FunctionComments {
<#
.SYNOPSIS
	A quick one sentence summary of Invoke-MyFunc1

.DESCRIPTION
	A longer description of Invoke-MyFunc1.

	Can include several paragraphs.

.PARAMETER A
	Input file containing markdown syntax

.PARAMETER B
	Defaults to banana

.PARAMETER C
	Must be integer between 1 and 10

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
		[ValidateRange(1,10)] # validate that parameters are good
		$C = 5
	)
	Write-Output "A=$A, B=$B, C=$C"
}

Invoke-FunctionComments "apple" "bear"
Get-Command Invoke*Comments # List all matching commands
Get-Help Invoke-FunctionComments # Get  help
Get-Help Invoke-FunctionComments -Detailed # Get detailed help
Get-Help Invoke-FunctionComments -Full # Get full help
Invoke-FunctionComments -? # alternate syntax
