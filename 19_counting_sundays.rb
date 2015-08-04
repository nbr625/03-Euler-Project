#You are given the following information, but you may prefer to do some research for yourself.
#1 Jan 1900 was a Monday.
#Thirty days has September,
#April, June and November.
#All the rest have thirty-one,
#Saving February alone,
#Which has twenty-eight, rain or shine.
#And on leap years, twenty-nine.
#A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
#How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

require_relative 'glad_colors'
thirty = [4, 6, 9, 11]
 
m = 1 
d = 1 
y = 1900
dw = 2
 
def leap? y
  return true if y % 400 == 0
  return false if y % 100 == 0 
  y % 4 == 0   
end
 
sundays = 0
 
while(y < 2001)
   
   sundays += 1 if (dw == 1 and d == 1 and y > 1900)
    
   dw += 1
   dw = 1 if dw == 8
       
   case d
    when 1..27
      d += 1
    when 28 && m == 2 && leap?(y)     
      d += 1
    when 28 && m == 2 && !leap?(y) 
      d, m = 1, 3       
    when 28
      d += 1     
    when 29 && m == 2
      d, m = 1, 3
    when 29
      d += 1     
    when 30 && thirty.include?(m)
      d, m = 1, d + 1     
    when 30
      d += 1     
    when 31
      d, m = 1, m + 1
      m, y = 1, y + 1 if m == 13
   end  
end 
 
puts pink(sundays) + " is the answer. " + pink("dim") + " is you."