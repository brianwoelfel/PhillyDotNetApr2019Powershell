cls; Write-Host "#### DEAL WITH NULL ####"
$A = $null                   # Powershell reserved word
$B = ""                      # empty string
$C = @()                     # empty array
$D = ""; Remove-Variable D   # non-blank string
$E = "hello"

# TIP: Don't bother with the obscure differences between empty string,
# null, and undefined.  Just do stuff with non-blank values
# [string]::IsNullOrWhitepace drops down to C# static method for String class.
@($A, $B, $C, $D, $E) | % {
    if(-not [string]::IsNullOrWhitespace($_)) { # Ignore null, undefined, blank, and empty array
        Write-Host "Do stuff with non-blank '$_'"
    }
}
# C# version:
# if(!String.IsNullOrWhiteSpace(x)) { /* do stuff */ } 