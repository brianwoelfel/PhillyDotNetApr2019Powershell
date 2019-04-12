cls; Write-Host "#### QUIZ 1 ####"
$A = "Airedale"; $B = "Beagle"; $C = "Corgi"; $Z = 10; # some sample data
$MyHash = @{ "Species"="Dog"; "Breed"="Great Dane"; "Weight"=200 }

# 1.  Why doesn't this work as expected?
#$D = '$A puppy'
#Console.WriteLine($D)

# 2.  Will this work correctly?
foreach($X in @($A, $B, $C)) { Write-Host "Test 2:" $X; }

# 3.  $MyHash is a valid hashtable.  Which of these add to it?
#$MyHash.Add("Height1", 31)
#$MyHash.Put("Height2", 32)
#$MyHash += @{ "Height3" = 33 }
#$MyHash["Height4"] = 34
#$MyHash[Height5] = 35
#$MyHash.Height6 = 36
$MyHash.Keys | sort | % { "$_=$($MyHash[$_])" } # Print the hashtable

