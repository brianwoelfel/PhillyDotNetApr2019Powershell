cls # Clear the screen
Write-Host "#### HELLO WORLD ####" # Like Console.WriteLine but more STDERR than STDOUT

# This is an end of line comment like "//"
<#  This is a comment like "/* */"    #>

$A = "Hello World" # Variables start with $

# Backtick "`" to continue lines
Write-Host $A `
    " more text"

# `n for newline and `t for tab
Write-Host "AAA`tBBB`nCCC" 
# That just looks really weird it's been \t and \n 
# since C was invented in 1973, but it makes 
# sense in a Windows context because of \ directory separator 