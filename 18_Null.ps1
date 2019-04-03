cls; Write-Host "#### NULL ####"
$A = $null          # Powershell reserved word
$B = ""             # empty string
$C = @()            # empty array
$D = "ignore"
Remove-Variable D   # not defined

# Repeat for all values in the array, $_ is the loop variable, "%" is "foreach"
@($A, $B, $C, $D) | % {
    Write-Host "Value=$_, " `  # remember backtick is line continuation
        "Length=$($_.Length), " `   # remember $() evaluates inside double quotes
        "equals [String]::Empty=$($_ -eq [String]::Empty), " `  # remember [Type]::Method drops to C#
        " [string]::IsNullOrWhitespace=$([string]::IsNullOrWhitespace($_))"
}