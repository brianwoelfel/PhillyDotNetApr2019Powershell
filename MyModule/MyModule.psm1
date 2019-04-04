# Explicitly list all the powershell files we're including in this module
. $PSScriptRoot\ArrayUtil.ps1

# Explicitly list all functions we're exporting
Export-ModuleMember -Function 'Convert-CsvStringToExcel'

$NugetPackagesToLoad = @("NPoi", "EPPlus")

#
# Load Nuget packages to support reading Excel files
#
# Explanation of this technique to load nuget packages into powershell:
# https://stackoverflow.com/questions/39257572/loading-assemblies-from-nuget-packages
# and 
# https://social.technet.microsoft.com/Forums/en-US/8248d617-816b-4435-924d-5dab7de2774d/try-catch-what-is-the-exception-type?forum=winserverpowershell
#
$NugetPackagesToLoad | % {
	[string]$PackageName = $_
	# Make sure package is installed
	try {
		Get-Package $PackageName -ErrorAction Stop | Out-Null
	} catch {
		throw "Nuget Package $PackageName not installed"
	}

	# Load package into the current session
	try {
		(Get-ChildItem -Filter *.dll -Recurse (Split-Path (get-package $PackageName).Source)).FullName | % { 
			[Reflection.Assembly]::LoadFrom($_) | Out-Null 
		}
	} catch {
		throw "Failed attempting to load $PackageName toolkit $_"
	}
}