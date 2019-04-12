cls; Write-Host "#### EXECUTION POLICY ####"
<#
By default, Microsoft doesn't let users run powershell scripts on their local machine unless 
you explicitly allow it.

* Start a DOS box (cmd.exe) as Administrator
* Start powershell.exe
* Within powershell run "Get-ExecutionPolicy".  
* If the resulting value isn't RemoteSigned or Unrestricted, run "Set-ExecutionPolicy RemoteSigned"
#>

Get-ExecutionPolicy 
# Set-ExecutionPolicy RemoteSigned

