cls; Write-Host "#### PIPELINE ####"

function Invoke-Pipeline1() {
	[cmdletBinding()] # I don't know why, but you just need this

	param (
        [parameter(ValueFromPipeline)] # Input is coming from the pipeline like STDIN
        # NOTE: I purposely didn't specify a type 
        # so it will take String or String Array
        [string]$MyInput  
        # NOTE: $Input is a reserved word, don't use that
    )	

    process { # We'll talk about "process" later
        # Write-Host debugs to console (kinda like STDERR), Write-Output writes to output stream STDOUT
        Write-Output "<<<$($MyInput.ToUpper())>>>"
    }
}

Write-Host "Test 1:"; Invoke-Pipeline1 -MyInput "abc"
# THIS FAILS Write-Host "Test 2:"; Invoke-Pipeline1 -MyInput @("abc","def")
Write-Host "Test 3:"; "abc" | Invoke-Pipeline1
Write-Host "Test 4:"; @("abc","def") | Invoke-Pipeline1
# Remember "sc" is Save-Content - dump text to file, and "gc" is Get-Content, load text file as new-line delimited array
"The quick brown fox`njumped over`nthe lazy dog" | sc "C:\temp\foo.txt"
Write-Host "Test 5:"; gc "c:\temp\foo.txt" | Invoke-Pipeline1
# Newlines aren't a valid delimiter
Write-Host "Test 6:"; "The quick brown fox`njumped over`nthe lazy dog" | Invoke-Pipeline1
