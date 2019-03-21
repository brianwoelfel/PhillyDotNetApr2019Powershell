$MyHash1 = @{}
$MyHash1["a"] = 1
$MyHash1["b"] = 2
$MyHash1["c"] = 3

$MyHash2 = @{}
$MyHash2.a = 1
$MyHash2.b = 2
$MyHash2.c = 3

$MyHash3 = @{ "a"=1; "b"=2; "c"=3; }

($MyHash1.Keys | sort | % { "$($_)=$($MyHash1[$_])" }) -join ', '

($MyHash2.Keys | sort | % { "$($_)=$($MyHash2[$_])" }) -join ', '

($MyHash3.Keys | sort | % { "$($_)=$($MyHash3[$_])" }) -join ', '

# something about enumerator



