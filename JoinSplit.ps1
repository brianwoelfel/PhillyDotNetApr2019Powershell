#
# -join to join an array with a delimiter
#
#

@("a", "b", "c") -join ','
# returns "a,b,c"


#
# -split to split a string into an array by delimiter
#
#

"a,b,c" -split ','
# returns array @("a", "b", "c")

#
# -split can use a regex delimiter
#
#

"a,b;c:d!e" -split '[,;:!]'
# returns array @("a", "b", "c", "d", "e")


#
# You can nest -join and -split with parentheses
#
#

("a,b;c:d!e" -split '[,;:!]') -join "#"
# returns a#b#c#d#e