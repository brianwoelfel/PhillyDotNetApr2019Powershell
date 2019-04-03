cls; Write-Host "### FIND ALL FILES IN A FOLDER ####"
# Dump 
$TempDir = [System.IO.Path]::GetTempPath() + "\" + [System.GUID]::NewGuid().ToString();
Write-Host $TempDir
mkdir $TempDir
echo "AAAAAAAAAAAAAAAAAAAA" >"$($TempDir)\a.txt"
echo "BBBBBBBBBBBBBBB" >"$($TempDir)\b.txt"
echo "CCCCC" >"$($TempDir)\c.txt"

# Get a list of fully qualified paths like *.txt greater than 10 bytes
# (also Get-ChildItem can get more than just folders)
$FileObjArray = Get-ChildItem -Path $TempDir -Filter *.txt 
foreach($FileObj in $FileObjArray) {
	if($FileObj.Length -gt 10) {
		Write-Host $FileObj.FullName
	}
}

# Same thing, in powershell shorthand
gci $TempDir -s -Filter *.txt | ? { $_.Length -gt 10 } | % { $_.FullName }

rmdir -r -fo $TempDir
Write-Host "done"