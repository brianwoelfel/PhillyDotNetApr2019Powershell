function Invoke-MyFunc1 {
	# This function can act as a cmdlet on the powershell pipeline
	[cmdletBinding()]

	# Put all the parameters down here instead of after the
	# function name above.  I have no idea why powershell thought
	# this was a good idea.
	param (
		# Mandatory string parameter that can be passed in from pipeline
		[parameter(Mandatory=$true, ValueFromPipeline)]
		[String]  # Type is optional
		$A,

		# This is a mandatory string parameter
		[parameter(Mandatory=$true)]
		[String]
		$B = "banana",

		# Optional int parameter with explicit default
		[int]
		$C = 5
	)

	Write-Output "A=$A, B=$B, C=$C"	
}

Invoke-MyFunc1 "apple" "bear"

Something about [Array] and [Hashtable]