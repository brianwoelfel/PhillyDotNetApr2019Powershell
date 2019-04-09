# This is an end of line comment like "//"
<#  This is a comment like "/* */"    #>
cls # Clear the screen
Write-Host "#### HELLO WORLD ####" # Like Console.WriteLine but more STDERR than STDOUT

$A = "Hello World" # Variables start with $

# Backtick to continue lines
Write-Host $A `
    " more text"

# `n for newline and `t for tab
Write-Host "AAA`tBBB`nCCC"