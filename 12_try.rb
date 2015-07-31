Infinity = 1.0/0 
nums = (1..Infinity)

catch :solution do
	(1..Infinity).each do |x|
		array = []
		(1..x).each do |y|
			array << y
			num = array.inject(:+)
			num_array = []
			(1..num).each do |n|
				if num % n == 0
					num_array << n
					
					if num_array.length == 10

						puts "the solution is: #{num}"
						throw :solution
					end
				end

			end
			puts num_array.length
		end
	end
end