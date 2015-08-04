#By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, 
#we can see that the 6th prime is 13.
#What is the 10 001st prime number?
require_relative 'glad_colors'
# 234325th place!! Not the fastest... Not fast at all really, needs work
# But its mine. Doesn't matter that I almost gave the cpu an enurism.
 

Infinity = 1.0/0
# This chicanery sent me into a chuckling fit.
# What have I becomed??

nums = (2..Infinity)
arr = []


dn = 2
nums.each do |n|
	if arr.length == 10_001
		break
	elsif dn == n
		arr.push(n)
		dn = 2
	elsif n % dn == 0
		dn = 2
		next		
	else
		dn += 1
		redo
	end
end

			
puts pink("*pant* *pant*") + "here is... you answer: " + pink(arr.last) \
+ ", slave driver."




