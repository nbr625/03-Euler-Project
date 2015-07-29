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

			
