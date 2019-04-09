cls; Write-Host "#### REPLACE TEXT FILE EXAMPLE ####"


<# make temp dir #> $TempDir = [System.IO.Path]::GetTempPath() + "\" + [System.GUID]::NewGuid().ToString(); mkdir $TempDir | Out-Null 

# Put a bunch of text files in a temp dir
[IO.File]::WriteAllLines("$($TempDir)\a.html", "<html>`n<body>`nHello <i>AAA</i>`n</body>`n</html>")
[IO.File]::WriteAllLines("$($TempDir)\b.html", "<html>`n<body>`nHello <b>BBB<b>`n</body>`n</html>")
[IO.File]::WriteAllLines("$($TempDir)\c.html", "<html>`n<body>`nHello CCC`n</body>`n</html>")

# Process all files in a dir
gci $TempDir -Filter *.html | % { 
	gc $_.FullName | 
	Invoke-ReplaceTextExample -Replacement @{ "<"="&lt;"; ">"="&gt;" } `
	| sc "$($_.FullName).2"
}

# Prove that it worked, show all files and dump a.html.2
dir $TempDir
gc "$($TempDir)\a.html.2"

<# cleanup #> rmdir -r -fo $TempDir 