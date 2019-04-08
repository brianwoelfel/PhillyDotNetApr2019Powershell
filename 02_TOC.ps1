<#

Regular new language stuff
 * All variables get prefixed with $
 * Backtick ` is the escape character, not \
 * Use @" and "@ for a multiline string
 * Use "-eq" not "==" for string equality
 * Can evaluate expressions in double-quotes with $() like "Hello $($MyCount + 1)"

Weird stuff that's not obvious
 * Don't use commas to separate arguments when calling a function
 * Orphaned strings in a function get returned
 * Array with one value returned as a single non-array value unless you prefix with comma
 * Use weird "param" syntax for defining function parameters
 * Where-Object shorthand is "... | ? { $_... }"
 * ForEach-Object shorthand is "... | % { $_... }"
 * Functions return values sometimes even without "return" keyword
 * UTF BOMs
 * How to use pipelines
 * How to call nuget packages
#>