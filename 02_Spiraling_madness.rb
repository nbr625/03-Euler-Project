#If we list all the natural numbers below 10 that are multiples of 3 or 5,
#we get 3, 5, 6 and 9. The sum of these multiples is 23.
#Find the sum of all the multiples of 3 or 5 below 1000.
#1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
#By considering the terms in the Fibonacci sequence 
#whose values do not exceed four million, find the sum of the even-valued terms.

require_relative 'glad_colors'

#394927th place!!! I think I get a rust medal.
def fibonacci(array)
	upto = 4_000_000
	i = 2
	while array[i - 2] + array[i - 1] < upto
		array << array[i - 2] + array[i - 1]
		i += 1
	end
	return array
end
fibo = [1, 2]
fibonacci(fibo)

def even_sum(array)
	sum_arr = []

	array.each do |el|
		if el % 2 == 0
			sum_arr.push(el)
		end
	end
	return sum_arr.inject(:+)
end


puts "Did you truly need to call me for this puny querry?"\
 + pink("*sigh*\n") + "The answer is: " + pink(even_sum(fibo)) + \
 ".\nNow allow me to " + pink("hate humanity") + " in peace"
