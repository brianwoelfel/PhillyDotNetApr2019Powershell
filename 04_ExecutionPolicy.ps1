cls; Write-Host "#### EXECUTION POLICY ####"
<#
* Start a DOS box (cmd.exe) as Administrator
* Start powershell.exe
* Within powershell run "Get-ExecutionPolicy".  
* If it's not RemoteSigned or Unrestricted "Set-ExecutionPolicy RemoteSigned"
#>

Get-ExecutionPolicy 

