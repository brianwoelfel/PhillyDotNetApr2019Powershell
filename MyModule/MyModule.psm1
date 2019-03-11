. $PSScriptRoot\ExcelUtil\CopySheet.ps1
. $PSScriptRoot\ExcelUtil\ExcelColumnUtil.ps1
. $PSScriptRoot\ExcelUtil\ExcelCsv.ps1
. $PSScriptRoot\ExcelUtil\Get-WorksheetNames.ps1
. $PSScriptRoot\ExcelUtil\Get-ExcelSummary.ps1
. $PSScriptRoot\ExcelUtil\Invoke-UnpivotExcel.ps1
. $PSScriptRoot\ExcelUtil\MoreExcelImport.ps1
. $PSScriptRoot\Exploder\Explode-Util.ps1
. $PSScriptRoot\Extracter\GenericExtracter.ps1
. $PSScriptRoot\Util\Get-SharepointOnlineFolder.ps1
. $PSScriptRoot\Util\New-ModuleHelpToSingleMarkdown.ps1
. $PSScriptRoot\Util\Util.ps1

Export-ModuleMember -Function 'Convert-CsvStringToExcel'
Export-ModuleMember -Function 'Convert-ExcelCellToColumnNumber'
Export-ModuleMember -Function 'Convert-ExcelCellToRowNumber'
Export-ModuleMember -Function 'Convert-ExcelColumnNameToNumber'
Export-ModuleMember -Function 'Convert-ExcelColumnNumberToName'
Export-ModuleMember -Function 'Convert-ExcelToCsvString'
Export-ModuleMember -Function 'Convert-ExcelWithHeaderToTextFile'
Export-ModuleMember -Function 'Convert-HashtableToString'
Export-ModuleMember -Function 'Convert-MarkdownToHtml'
Export-ModuleMember -Function 'Copy-ExcelSheet'
Export-ModuleMember -Function 'Copy-ExcelSheetViaEPPlus'
Export-ModuleMember -Function 'Copy-ExcelSheetViaExcel'
Export-ModuleMember -Function 'Copy-ExcelSheetViaNPoi'
Export-ModuleMember -Function 'Export-SubsetFromExcel'
Export-ModuleMember -Function 'Get-BaseFileNameFromRegex'
Export-ModuleMember -Function 'Get-ColumnMapping'
Export-ModuleMember -Function 'Get-ColumnNamesFromTable'
Export-ModuleMember -Function 'Get-ExcelSummary'
Export-ModuleMember -Function 'Get-FirstMatchingFile'
Export-ModuleMember -Function 'Get-HeaderCommentFromSql'
Export-ModuleMember -Function 'Get-MarkdownPrevNextLinks'
Export-ModuleMember -Function 'Get-PowershellModuleHelp'
Export-ModuleMember -Function 'Get-SharepointOnlineFolder'
Export-ModuleMember -Function 'Get-TextSummary'
Export-ModuleMember -Function 'Get-WorksheetNames'
Export-ModuleMember -Function 'Import-ExcelWithHeaderToTable'
Export-ModuleMember -Function 'Import-TextFileNoHeaderToTable'
Export-ModuleMember -Function 'Invoke-ExplodeExcelFiles'
Export-ModuleMember -Function 'Invoke-FuncThroughPipeline'
Export-ModuleMember -Function 'Invoke-ReplaceTextInFile'
Export-ModuleMember -Function 'Invoke-UnpivotExcel'
Export-ModuleMember -Function 'Remove-ItemFromArray'
Export-ModuleMember -Function 'Remove-TrailingBlanksFromArray'
Export-ModuleMember -Function 'Remove-UtfBom'
Export-ModuleMember -Function 'Resolve-Paths'
Export-ModuleMember -Function 'Test-ArrayBlank'
Export-ModuleMember -Function 'Test-ArrayEqual'
Export-ModuleMember -Function 'Update-PowershellMarkdownHelp'
Export-ModuleMember -Function 'Write-ErrorDetail'
Export-ModuleMember -Function 'Get-ExtractParamFromJson'
Export-ModuleMember -Function 'Test-FilesExistAndTimestampsMatch'
Export-ModuleMember -Function 'Set-FileModifyTimeAgainstOtherFile'

#
# Load Nuget packages to support reading Excel files
#
# Explanation of this technique to load nuget packages into powershell:
# https://stackoverflow.com/questions/39257572/loading-assemblies-from-nuget-packages
# and 
# https://social.technet.microsoft.com/Forums/en-US/8248d617-816b-4435-924d-5dab7de2774d/try-catch-what-is-the-exception-type?forum=winserverpowershell
@("NPoi", "EPPlus") | % {
	[string]$PackageName = $_
	# Make sure package is installed
	try {
		Get-Package $PackageName -ErrorAction Stop | Out-Null
	} catch {
		Write-Error "REV_REC_ERROR Nuget Package $PackageName not installed"
	}

	# Load NPoi into the current session
	try {
		(Get-ChildItem -Filter *.dll -Recurse (Split-Path (get-package $PackageName).Source)).FullName | % { 
			[Reflection.Assembly]::LoadFrom($_) | Out-Null 
		}
	} catch {
		throw "REV_REC_ERROR Failed attempting to load $PackageName toolkit $_"
	}
}

