cls; Write-Host "#### PIPELINE ####"

function Invoke-Pipeline1() {
	[cmdletBinding()] # I don't know why, but you just need this
	param ( 
        [parameter(ValueFromPipeline)] # Input is coming from the pipeline like STDIN
        [string[]]$MyInput  # [string] or array syntax [string[]]?  Meh doesn't matter
        # NOTE: $Input is a reserved word, don't use that
    )	
    process { # We'll talk about "process" later
        # Write-Host debugs to console (kinda like STDERR), Write-Output writes to output stream STDOUT
        Write-Output "<<<$($MyInput.ToUpper())>>>"
    }
}

Write-Host "Test 1:"; Invoke-Pipeline1 -MyInput "abc"
Write-Host "Test 2:"; Invoke-Pipeline1 -MyInput @("abc","def") # WEIRD takes array as a single line
Write-Host "Test 3:"; "abc" | Invoke-Pipeline1 # Use the pipe character like DOS or UNIX
Write-Host "Test 4:"; @("abc","def") | Invoke-Pipeline1
"The quick brown fox`njumped over`nthe lazy dog" | sc "C:\temp\foo.txt" # "sc" is Save-Content - dump text to file
Write-Host "Test 5:"; gc "c:\temp\foo.txt" | Invoke-Pipeline1 # "gc" is Get-Content, load text file as new-line delimited array
Write-Host "Test 6:"; "The quick brown fox`njumped over`nthe lazy dog" | Invoke-Pipeline1 # Newlines not valid delimiter
