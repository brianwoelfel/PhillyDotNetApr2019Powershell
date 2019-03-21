$MyHash1 = @{ "a"=1; "b"=2; "c"=3; }


PS> $MyHash1.Keys     # Get the hashtable keys
c
a
b
PS> $MyHash1.Keys | sort    # Sort the hashtable keys
a
b
c
PS> $MyHash1.Keys | sort | % { Write-Host $_ }   # Print the hashtable keys
a
b
c
PS> $MyHash1.Keys | sort | % { Write-Host $_ $MyHash1[$_] }  # Print the hashtable keys and values
a 1
b 2
c 3
PS> $MyHash1.Keys | sort | % { Write-Host "$($_)=$($MyHash1[$_])" } # Format the hashtable keys and values
a=1																								 
b=2
c=3
PS> $MyHash1.Keys | sort | % { "$($_)=$($MyHash1[$_])" } # Change from Write-Host to pipeline output
a=1
b=2
c=3
PS> ($MyHash1.Keys | sort | % { "$($_)=$($MyHash1[$_])" }) -join ',' # Join array with commas
a=1,b=2,c=3
PS>