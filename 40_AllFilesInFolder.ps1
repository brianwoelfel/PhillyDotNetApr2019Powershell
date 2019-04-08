cls; Write-Host "### FIND ALL FILES IN A FOLDER ####"
# Make some small test files in a temp dir 
$TempDir = [System.IO.Path]::GetTempPath() + "\" + [System.GUID]::NewGuid().ToString();
mkdir $TempDir 
echo "AAAAAAAAAAAAAAAAAAAA" > "$($TempDir)\a.txt" # 20 chars is 40 unicode bytes
echo "BBBBBBBBBB" > "$($TempDir)\b.txt" # 10 chars is 20 unicode bytes
echo "CCCCC" > "$($TempDir)\c.txt" # 5 chars is 10 unicode bytes

# Get a list of fully qualified paths like *.txt greater than 10 bytes
# (also Get-ChildItem can get more than just folders)
Write-Host "Test 1:"
$FileObjArray = Get-ChildItem -Path $TempDir -Filter *.txt 
foreach($FileObj in $FileObjArray) {
	if($FileObj.Length -gt 20) {
		Write-Host "Name=$($FileObj.Name), len=$($FileObj.Length)"
	}
}

# Same thing, in powershell shorthand
Write-Host "Test 2:"
gci $TempDir -Filter *.txt | ? { $_.Length -gt 20 } | % { $_.Name }

rmdir -r -fo $TempDir # Note that rmdir is shorthand for Powershell Remove-Item
