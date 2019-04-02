cls; Write-Host "#### DEAL WITH NULL ####"
$A = $null          # Powershell reserved word
$B = ""             # empty string
$C = @()            # empty array
$D = "my string"    # non-blank string

# Don't bother with the obscure differences between empty string,
# null, and undefined.  Just do stuff with non-blank values
# [string]::IsNullOrWhitepace drops down to C# static method for String class.
@($A, $B, $C, $D) | % {
    if(-not [string]::IsNullOrWhitespace($_)) {
        Write-Host "Do stuff with non-blank '$_'"
    }
}