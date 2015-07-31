#126615th place! 

require_relative 'glad_colors'
def triNum(n)
  sum = 0
  (1..n).each { |n| sum += n }
  return sum
end

def factors(num)
  array = []
  if ( num == 1 )
    array.push(1)
  end
  
  denominator = 1
  max = num
  while (denominator <= max)
     if ( num % denominator == 0 )
       array.push(denominator)
       subfac = num/denominator      
       if ( denominator != subfac )
         array.push(subfac)
       end
       max = subfac
     end
     denominator += 1
   end
   return array
 end
 
 index = 1
 while(factors(triNum(index)).length < 500)
   index += 1
 end
 
 puts "You answer: " + pink(triNum(index)) + ". If you like it so much why don't you marry it? " \
 + pink("Well, I won't let you!")

