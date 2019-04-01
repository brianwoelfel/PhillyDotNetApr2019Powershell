cls; 
$A = $null          # Powershell reserved word
$B = ""             # empty string
$C = @()            # empty array
Remove-Variable D   # not defined

# Repeat for all values in the array, $_ is the loop variable
@($A, $B, $C, $D) | % {
    Write-Host "Value=$_, " `
        "Length=$($_.Length), " `
        "-eq [String]::Empty=$($_ -eq [String]::Empty), " `
        " [string]::IsNullOrWhitespace=$([string]::IsNullOrWhitespace($_))"
}