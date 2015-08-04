#A Pythagorean triplet is a set of three natural numbers,
#a < b < c, for which, a2 + b2 = c2
#For example, 32 + 42 = 9 + 16 = 25 = 52.

#There exists exactly one Pythagorean triplet for which a + b + c = 1000.
#Find the product abc.
require_relative 'glad_colors'

catch :solution do
  (200..500).each do |a|
  	(200..500).each do |b|
  	  (300..1000).each do |c|
	    if (a*a) + (b*b) == (c*c) && a + b + c == 1000
		  puts "The solution: " + pink("#{a * b * c}") + ", pretty simple." + pink(" Like you.")
		  throw :solution
		end
	  end
    end
  end
end

			
