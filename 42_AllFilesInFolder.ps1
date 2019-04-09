cls; Write-Host "### FIND ALL FILES IN A FOLDER ####"
# Make some small test files in a temp dir 
$TempDir = [System.IO.Path]::GetTempPath() + "\" + [System.GUID]::NewGuid().ToString();
mkdir $TempDir | Out-Null # "Out-Null" ignores the output which is some directory object thing
echo "AAAAAAAAAAAAAAAAAAAA" > "$($TempDir)\a.txt" 
echo "BBBBBBBBBB" > "$($TempDir)\b.txt" 
echo "CCCCC" > "$($TempDir)\c.txt" 

# Get a list of fully qualified paths like *.txt greater than 20 bytes 
Write-Host "Test 1:"
$FileObjArray = Get-ChildItem -Path $TempDir -Filter *.txt 
foreach($FileObj in $FileObjArray) {
	if($FileObj.Length -gt 20) {
		Write-Host "Name=" $FileObj.Name ", Len=" $FileObj.Length
	}
}

# Same thing, in powershell shorthand
Write-Host "Test 2:"
gci $TempDir -Filter *.txt | ? { $_.Length -gt 20 } | % { "Name=$($_.Name), Len=$($_.Length)" }

<# cleanup #> rmdir -r -fo $TempDir # Note that rmdir is shorthand for Powershell Remove-Item