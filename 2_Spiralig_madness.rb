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

def glad_colors(string, color_code)
  "\e[#{color_code}m#{string}\e[0m"
end

# Changes string to Blue
def pink(string)
  glad_colors(string, 35)
end

puts "Did you truly need to call me for this puny querry?"\
 + pink("*sigh*\n") + "The answer is: " + pink(even_sum(fibo)) + \
 ".\nNow allow me to " + pink("hate humanity") + " in peace"
