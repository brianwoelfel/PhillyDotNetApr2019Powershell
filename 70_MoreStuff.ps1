<#   #### MORE STUFF YOU SHOULD KNOW ####
Didn't fit into this demo, but you should know:
* Powershell supports classes, but it's an awkward afterthought (like JavaScript).  It does work, but very clunky and it's
  tricky to figure out subtle things like overrides and inheritance.  If you find yourself doing complicated
  object-oriented theoretical stuff in Powershell, it's probably the wrong tool for the job.

* You can make a Config class for your favorite config setings like database strings, make a corresponding
  JSON file and load your param that way, like C# app.settings.

* You can have lots of powershell functions, but the really important ones that you expect other people to 
  use should all start with official Microsoft approved verbs like Get-Something, Import-Something, Set-Something,
  etc.  If you follow this convention, true devops people will find it easier to use your code.

* PESTER is an excellent unit testing kit for powershell.  Follows the same pattern as JUnit, NUnit, Mocha, etc.
  Syntax is a little annoying but if you're doing anything nontrivial test-driven-development is a great asset.

* try/catch/finally works in Powershell, but the syntax is a little weirder than C#

* $Input is a reserved word

* [switch] syntax lets you allow for optional boolean parameters without the caller explicitly supplying $true

* PowerShellCore is rewritten using DotNet core and is platform independent.  Syntax is the same, but it's not
  always clear how third party dependencies work.

* Lots of stuff in powershell about formatting output as tables, but the syntax is weird and hard to use.

* Learn how to use "strict mode" to catch syntax errors early
#>