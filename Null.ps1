# Null.ps1

$A = $null
$B = ""
$C = @() # empty array
$D # not defined

Write-Host "A=$A, length=$($A.Length)"
Write-Host "B=$B, length=$($B.Length)"
Write-Host "C=$C, length=$($C.Length)"
Write-Host "D=$D, length=$($D.Length)"

# OUTPUTS
# A=, length=0
# B=, length=0
# C=, length=0
# D=, length=0