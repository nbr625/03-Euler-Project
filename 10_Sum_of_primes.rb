require_relative 'glad_colors'

primer = []
nums = (2..2_000_000)
dn = 2
nums.each do |n|
	if n == dn
		primer.push(n)
		dn = 2
		puts n
		next
	elsif
		n % dn == 0
		dn = 2
		next
	else
		dn += 1
		redo
	end
end
		
solution = primer.inject(:+)
puts "your solution: " + pink(solution) + ", you magnificent " + pink("bastard")
