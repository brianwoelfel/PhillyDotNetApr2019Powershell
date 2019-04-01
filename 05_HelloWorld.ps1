# This is an end of line comment like //
<# This is a comment like /* */ #>
cls # Clear the screen

$A = "Hello World" # Variables start with $

Write-Host $A # Write-Host debugs to console

# Backtick to continue lines
Write-Host $A `
    " more text"