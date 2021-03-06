#If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
#If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
#NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. 
#The use of "and" when writing out numbers is in compliance with British usage.

## I am pretty proud of this one. Since I have not seen anyone use the product method to make derive the answer. 
## Aparently my bookworming throught he ruby docs is bearing fruit.
require_relative 'glad_colors'

hundreds = ["", "onehundredand", "twohundredand", "threehundredand", "fourhundredand", "fivehundredand", "sixhundredand", \
"sevenhundredand", "eighthundredand", "ninehundredand" ]
tens = ["", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
digits = ["", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
teenagers_thousand = (("teneleventwelvethirteenfourteenfifteensixteenseventeeneighteennineteen").length * 5) + 10

alpha_num = 0
alpha_array = 0

def combinator(a, b, c)
  alpha_array = a.product(b, c)
  return alpha_array.flatten.join("").length - a.flatten.join("").length
end

puts "Your answer: " + pink(teenagers_thousand + combinator(digits, tens, hundreds)) + " aren't we a clever " + pink("primate.")







