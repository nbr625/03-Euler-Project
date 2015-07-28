
fibo_even = []
fibo_array = [1, 2]
def fibonacci(array)

	while array.length < 10
		i = 0
		next_num = array[i] + array[i + 1]
		array.push(next_num)
		i += 1
	end

	puts array
end
fibonacci(fibo_array)

