# Get a list of all *.txt greater than 10 bytes
$FileObjArray = Get-ChildItem -Path c:\temp -Filter *.txt -Recurse 
foreach($FileObj in $FileObjArray) {
	if($FileObj.Length -gt 10) {
		Write-Host $FileObj.FullName
	}
}	

# Get a list of all *.txt greater than 10 bytes
gci c:\temp -s -Filter *.txt | ? { $_.Length -gt 10 } | % { $_.FullName }