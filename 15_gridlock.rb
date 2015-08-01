# 109287th place!
require_relative 'glad_colors'

# God this took me like an hour of sketching binary sequences and trying to
# crack the code to the universe. In the end I found an useful equation that
# that did not require me to make 800 loops...

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