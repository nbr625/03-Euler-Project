
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

