#n! means n × (n − 1) × ... × 3 × 2 × 1
#For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
#and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
#Find the sum of the digits in the number 100!

require_relative 'glad_colors'

# the revenge of the factorize method!
def factorize(num)
	array = (1..num)
	return array.inject(:*)
end

def add_fac_digits(num)
	array = factorize(num).to_s.split(//)
	array.map! {|x| x.to_i}
	array.reduce(:+)
end

puts "Answer: " + pink(add_fac_digits(100)) + ". That hardly seemed worth my time.\
 Maybe you have not heard of this wonderful thing called: " + pink("a calculator") + \
 ". Seems more your speed. Or should I say " + pink("slowness")
