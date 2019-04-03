# 1.  What's wrong?

# $a = "hello"
# $b = '$a world'
# Console.WriteLine($b)


# 2. What does this do?
( @(1..100) | ? { 
	$N=$_; $P=$true; $D=[math]::Sqrt($N); 
	2..$D | % { 
		if($N % $_ -eq 0) { $P = $false }
	}
	if($P) { $D }
} ) -join ','