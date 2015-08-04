#The prime factors of 13195 are 5, 7, 13 and 29.
#What is the largest prime factor of the number 600851475143 ?

require_relative 'glad_colors'
#286895th place!

def prime?(arg)
	(1...arg).each do |n| 
		false if arg % n == 0
	end
	true	
end

def optimus_prime(num)	
	d = 2
	primes = []
	product = num
	while d <= product
		if num % d == 0 && prime?(d)
			primes << d
			product /= d
		end
		d += 1
	end
	return primes.last
end

puts "Took you long enough. Here: " + pink("#{optimus_prime(600_851_475_143)}\n") + "\
Good Job! " + pink("At making me do all the work.")