
## I am pretty proud of this one. Since I have not seen anyone use the product method to make derive the answer. 
## Aparently my bookworming throught he ruby docs is bearing fruit.
require_relative 'glad_colors'

hundreds = ["", "onehundredand", "twohundredand", "threehundredand", "fourhundredand", "fivehundredand", "sixhundredand", \
"sevenhundredand", "eighthundredand", "ninehundredand" ]
tens = ["", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
digits = ["", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
teenagers_thousand = (("teneleventwelvethirteenfourteenfifteensixteenseventeeneighteennineteen").length * 5) + 10


d_length = 

alpha_num = 0
alpha_array = 0

def combinator(a, b, c)
  alpha_array = a.product(b, c)
  return alpha_array.flatten.join("").length - a.flatten.join("").length
end

	

puts "Your answer: " + pink(teenagers_thousand + combinator(digits, tens, hundreds)) + " aren't we a clever " + pink("primate.")







