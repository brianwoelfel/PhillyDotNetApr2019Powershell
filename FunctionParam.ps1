function Invoke-MyFunc1 {
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