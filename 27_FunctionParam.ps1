cls; Write-Host "#### FUNCTION PARAM ####"
function Invoke-MyFunc1 {
	[cmdletBinding()] 	# This function can act as a cmdlet on the powershell pipeline
	param ( # function parameter definition
		[parameter(Mandatory=$true, ValueFromPipeline)] #  Mandatory string parameter that can be passed in from pipeline
		[String]  # Type is optional
		$Animal,

		[parameter(Mandatory=$true)] # Mandatory string param
		[Alias("F")] # You can supply an optional alternate spelling/name for this param
		$Fruit, 

		# Optional int parameter with explicit default
		[int]
		$Num = 5
	)
	Write-Output "Animal=$Animal, Fruit=$Fruit, Num=$Num"
}
Write-Host "Test 1:" ; Invoke-MyFunc1 "bear" "blueberry"
Write-Host "Test 2:" ; echo "otter" | Invoke-MyFunc1 -F "apple" -Num 20 