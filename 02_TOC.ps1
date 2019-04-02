<#
Top tips:
 * All variables get prefixed with $
 * Backtick ` is the escape character, not \
 * Don't use commas to separate arguments when calling a function
 * Orphaned strings in a function get returned
 * Array with one value returned as a single non-array value unless you prefix with comma
 * Use weird "param" syntax for defining function parameters
 * Where-Object shorthand is "... | ? { $_... }"
 * ForEach-Object shorthand is "... | % { $_... }"
 * Can evaluate expressions in double-quotes with $() like "Hello $($MyCount + 1)"
 * Use @" and "@ for a multiline string
 * Use "-eq" not "==" for string equality
 * Functions return values sometimes even without "return" keyword
 * How to use pipelines
 * How to call nuget packages
#>