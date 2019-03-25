https://blog.tyang.org/2011/02/24/powershell-functions-do-not-return-single-element-arrays/

function MyFunc1 { return @("a", "b", "c") }
(MyFunc1).GetType().Name
# returns "Object[]"

function MyFunc2 { return @("a") }
(MyFunc2).GetType().Name

function MyFunc3 { return "a" }
(MyFunc3).GetType().Name

function MyFunc4 { return ,@("a") }
(MyFunc4).GetType().Name

function MyFunc5 { return ,@("a", "b", "c") }
(MyFunc5).GetType().Name
