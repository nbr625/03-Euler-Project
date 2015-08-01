# 109287th place!
require_relative 'glad_colors'

# Update! I found a way to write the formula that I was trying to contruct initiallly. Today I learned about 
# The permuation method which is exactly what I required. My logic: The only directions are down and right.
# The only thing that differs the route is when the right is made and when it is not. there fore if we
# write a binary sequence of 0 and 1 and look for the permutations of twenty 0's and twenty 1's we arrive at the answer

# Formula: ([1, 0]*20).permutation.to_a.uniq.length     (Do not release from its hash prison.)

# So simple but very sloooooow and dangerous (gladis could barely take it.) But the output is correct. 
# I am just happy that my theory was right, no matter how harebrained it turned out to be as a solution.


# Practical/boring solution
def factorize(num)
	array = (1..num)
	return array.inject(:*)
end

def grid_paths(n)
	numerator = factorize(n*2)
	denominator = factorize(n) * factorize(n)
	return numerator/denominator
end

puts "Answer: " + pink(grid_paths(20)) + " paths. I suggest you take one of them and " + pink("never come back.")