
## I am pretty proud of this one. Since I have not seen anyone use the product method to make derive the answer. 
## Aparently my bookworming throught he ruby docs is bearing fruit.


hundreds = ["", "onehundredand", "twohundredand", "threehundredand", "fourhundredand", "fivehundredand", "sixhundredand", \
"sevenhundredand", "eighthundredand", "ninehundredand" ]
tens = ["", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
digits = ["", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
d_length =  digits.flatten.join("").length


alpha_array = hundreds.product(tens, digits)
	

teenagers = ("teneleventwelvethirteenfourteenfifteensixteenseventeeneighteennineteen").length * 5 
teenagers += 10	


num = alpha_array.flatten.join("").length
alpha_num = num - digits.flatten.join("").length


puts teenagers + alpha_num








