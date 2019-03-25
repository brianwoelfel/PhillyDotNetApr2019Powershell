#
# Standalone script that will install powershell modules
# from Powershell Gallery and C#-style nuget packages.
#
# Normally we would package this kind of code up and make it
# reusable, except this is bootstrapping code that installs
# other packages and modules for Powershell, so it's best
# to copy this file and paste in your module and package 
# names.  You only need to run this once on each machine,
# but you can't get your modules and packages until you do.
#


#
# Type in an array of nuget package names to install from nuget.org
#
[string[]]$NugetPackages = @("EPPlus")

#
# Type in array of powershell modules from powershellgallery.com 
#
[string[]]$PowershellModules = @("Invoke-SqlCmd2")


#
# Don't change the code below
#

if($NugetPackages.Length -gt 0) {
	# Ask powershell if it's allowed to use the tool nuget to download packages
	if( (Get-PackageProvider | ? { $_.Name -eq "NuGet" }).Count -eq 0) {
		# It's missing, so tell powershell it should install it
		Write-Host "Configure powershell to use nuget to install libraries"
		Get-PackageProvider -Name "nuget" -Force
	} else {
		Write-Host "Powershell already configured to use nuget"
	}

	# Ask powershell if it checks nuget.org when looking for third party libraries
	if( (Get-PackageSource | Select-Object Name | Where-Object { $_.Name -eq 'NuGet' }).Count -eq 0 ) {
		# Tell powershell it should look at nuget.org when downloading packages
		Write-Host "Configure powershell to pull nuget libraries from nuget.org"
		Register-PackageSource -Name Nuget -Location "http://www.nuget.org/api/v2" –ProviderName Nuget -Trusted
	} else {
		Write-Host "Powershell already configured to pull nuget libraries from nuget.org"
	}

  	#
	# Install nuget packages
	#
	$NugetPackages | % {
		# Ask powershell if package is installed
		if( (Get-Package | ? { $_.Name -eq $_ }).Count -eq 0) {
			# Tell powershell to install the package from nuget
			Write-Host "Installing package $_"
			Install-Package -Name $_ -Force
		} else {
			Write-Host "Package $_ already installed"
		}
	}
}

#
# Install powershell modules from PowershellGallery
#
$PowershellModules | % {
	# Ask powershell if module is installed
	if( (Get-Command $_).Count -eq 0) {
		# Tell powershell to install the module
		Write-Host "Installing module $_"
		Install-Module -Name $_ -Force
	} else {
		Write-Host "Module $_ already installed"
	}
}