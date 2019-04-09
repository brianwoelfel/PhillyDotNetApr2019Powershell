cls; Write-Host "#### BEGIN PROCESS END 2 ####"
function Invoke-BeginProcessEnd2 {	
	# UNEXPECTED with begin/process/end,
	# I don't have to explicitly state it's a cmdlet
	# or uses pipeline, and don't even have to define parameters

	begin {
		Write-Host "begin `$_=$_" # $_ is blank at this point
	}

	process {
		Write-Host "process `$_=$_" # back-tick escapes the first dollar sign so it prints
	}

	end {
		Write-Host "end `$_=$_" # Retains final input value
	}
}
@("A","B","C") | Invoke-BeginProcessEnd2

# Ridiculously abbreviated
function Invoke-BeginProcessEnd3 { process { "process `$_=$_" } }
@("A","B","C") | Invoke-BeginProcessEnd3
