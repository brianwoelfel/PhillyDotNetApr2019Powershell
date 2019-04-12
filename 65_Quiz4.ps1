cls; Write-Host "#### QUIZ 4 ####"

# Quiz- what does this do?
# If you read ahead, don't blurt out the answer please.
( @(1..100) | ? { 
	$N=$_; 
	$P=$true; 
	$D=[math]::Sqrt($N); 
	2..$D | % { 
		if($N % $_ -eq 0) { 
			$P = $false 
		}
	}
	if($P) { 
		$D 
	}
} ) -join ','

