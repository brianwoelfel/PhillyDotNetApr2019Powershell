cls; Write-Host "#### NULL ####"
$A = $null          # Powershell reserved word
$B = ""             # empty string
$C = @()            # empty array
$D = "ignore"
Remove-Variable D   # force it to be undefined

# Repeat for all values in the array, $_ is the loop variable, "%" is "foreach"
@($A, $B, $C, $D) | % {
    Write-Host "Value=$_, " `  # backtick is line continuation
        "Length=$($_.Length), " `   # $() evaluates inside double quotes
        "equals [String]::Empty=$($_ -eq [String]::Empty), " `  # [Type]::Method calls C#
        "[string]::IsNullOrWhitespace=$([string]::IsNullOrWhitespace($_))"
}