cls; Write-Host "#### HASHTABLES ####"
# Powershell likes Hashtables over C# Dictionaries
$MyHash1 = @{}; # Empty hashtable
$MyHash1["a"] = 1; # Add elements
$MyHash1["b"] = 2; $MyHash1["c"] = 3 # Add some more
# This next line prints out the hashtable pretty
($MyHash1.Keys | sort | % { "$($_)=$($MyHash1[$_])" }) -join ', '

# Note $MyHash1["a"] syntax and $MyHash1.a syntax are good like Javascript
$MyHash2 = @{}; $MyHash2.a = 1; $MyHash2.b = 2; $MyHash2.c = 3
($MyHash2.Keys | sort | % { "$($_)=$($MyHash2[$_])" }) -join ', '

# Powershell style hashtable initializer, note those are ";" not "," 
$MyHash3 = @{ "a"=1; "b"=2; "c"=3; }
($MyHash3.Keys | sort | % { "$($_)=$($MyHash3[$_])" }) -join ', '

# Avoid stressing about Dictionary<String, String> or Dictionary<String, Object>
# just let Powershell do it's thing.