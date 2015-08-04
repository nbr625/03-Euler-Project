#A palindromic number reads the same both ways.
#The largest palindrome made from the product of 
#two 2-digit numbers is 9009 = 91 × 99.
#Find the largest palindrome made from the product of two 3-digit numbers.

#259183 place!

def palindrome?(num)
  num.to_s == num.to_s.reverse
end

def divisible?(num)
  (100).upto(999).each do |n|
  	true if num % n == 0 && (num / n).to_s.length == 3}
  	false
  end
end


999999.downto(100000).each do |n|
  if palindrome?(n) && divisible?(n)
    puts "The result is #{n}"
    break
  end
end

