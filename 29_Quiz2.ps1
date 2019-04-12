cls; Write-Host "#### QUIZ 2 ####"
# 1.  What's wrong with this?
#function Quiz2_A($a $b $c) {
#	Write-Host "a=$a, b=$b, c=$c"
# }
#Quiz2_A "1" "2" "3"

# 2.  What will this return?
 function Quiz2_B($a) {
	@("1", "2", "3")
   return $a
 }
 Quiz2_B "z" 

# 3.  How do I ask Powershell 
# "show me all functions that start with "Quiz2" and end with "C"?
function Quiz2_C($a) {
  Write-Host "Quiz2_C a=$a"
}

# 4.  Challenge- what's wrong with this?
Quiz2_C -a="ZZZ"



















