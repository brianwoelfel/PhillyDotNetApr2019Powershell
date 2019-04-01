cls; Write-Host "### FIND ALL FILES IN A FOLDER ####"
# Get a list of fully qualified paths like *.txt greater than 10 bytes
# (also Get-ChildItem can get more than just folders)
$FileObjArray = Get-ChildItem -Path c:\temp -Filter *.txt -Recurse
foreach($FileObj in $FileObjArray) {
	if($FileObj.Length -gt 10) {
		Write-Host $FileObj.FullName
	}
}

# Same thing, in powershell shorthand
gci c:\temp -s -Filter *.txt | ? { $_.Length -gt 10 } | % { $_.FullName }