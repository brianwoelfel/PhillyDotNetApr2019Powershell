cls; Write-Host "#### QUIZ 3 ####"

# 1.  What's wrong with this?
# "brown bear" | replace "brown" "black"

# 2.  Which of these work as expected?
#@("a.txt", "b.txt", "c.docx") | ? { $_ -like "*.txt" }
#@("a.txt", "b.txt", "c.docx") | ? { $_ -match "*.txt" }
#@("a.txt", "b.txt", "c.docx") | ? { $_ -contains "*.txt" }
#@("a.txt", "b.txt", "c.docx") | ? { $_ -similar-to "*.txt" }

# 3.  What's wrong with this?
#if("apple.txt" like "*apple*") { Write-Host "like apple"}

# 4.  What's wrong with this?
@("brown", "black", "yellow", "green") | foreach { $_ = $_ -replace "b","B"}

# 5.  Challenge: replace brown to black, only if it contains "brown", and print array as single comma delimited string
$words = @("brown bear", "brown fish", "white whale");

