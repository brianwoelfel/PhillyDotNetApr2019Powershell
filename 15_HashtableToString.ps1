cls; Write-Host "#### HASHTABLE TO STRING ####"
$Hsh1 = @{ "a"=1; "b"=2; "c"=3; }

Write-Host "1:"; $Hsh1.Keys # Get the hashtable keys
Write-Host "2:"; $Hsh1.Keys | sort    # Sort the hashtable keys
Write-Host "3:"; $Hsh1.Keys | sort | % { Write-Host $_ }   # Print the hashtable keys
Write-Host "4:"; $Hsh1.Keys | sort | % { Write-Host $_ $Hsh1[$_] }  # Print keys and values
Write-Host "5:"; $Hsh1.Keys | sort | % { Write-Host $_ "=" $Hsh1[$_] } # Format keys and values
Write-Host "6:"; $Hsh1.Keys | sort | % { Write-Host "$($_)=$($Hsh1[$_])" } # Remove extra spaces
Write-Host "7:"; $Hsh1.Keys | sort | % { "$($_)=$($Hsh1[$_])" } # Output to pipeline
Write-Host "8:"; ($Hsh1.Keys | sort | % { "$($_)=$($Hsh1[$_])" }) -join ',' # Join  with commas
