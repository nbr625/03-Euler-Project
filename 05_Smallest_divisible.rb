require_relative 'glad_colors'
#This I was able to solve without programming.
#It is easy if you treat it like a logic puzzle
#But for the sake of the challenge I will go the 
#Circumvential way.

arr = (2..20).to_a
arr2 = (2..20)
arr3 = []

arr.each do |el|
  arr2.each do |el2|
    if el % el2 == 0

      arr.each_index do |i|

	    if arr[i] % el2 == 0
		  arr[i] /= el2
		end
	  end
	  arr3 << el2
	end

  end
end

puts "the answer is " + pink(arr3.inject(:*)) + " You know you could have just typed\ 
" + pink("arr.inject(:lcm)") + " , right? Aren't you " + pink("stubborn") + "?"

			




