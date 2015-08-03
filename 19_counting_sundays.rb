
d = 1 #day
m = 1 #month
y = 1900 #year
wd = 2 #weekday

thirtydays = [4, 6, 9, 11] # months with thirty days
s = 0 #number of sundays

def leap?(year)
	true if year % 400 == 0
	false if year if y % 100 == 0
end



while(y < 2001)
	
	if d == 1 && wd == 1 && y > 1900
		s += 1
	end

	wd += 1
	wd = 1 if wd  == 8

	case
	when 1..27
		d += 1
	when 28 && m == 2 && leap?(y)
		d, m = 1, 3
	when 28 && m == 2 && !leap?(y)
		d += 1
	when 29 && m == 2
		d, m = 1, 3
	when 29
		d += 1
	when 30 && thirtydays.include?
		d, m = 1, d + 1 
	when 30
		d += 1
	when 31
		d, m = 1, m + 1
		m, y = 1, y + 1 if m == 13
	end
end

puts s

