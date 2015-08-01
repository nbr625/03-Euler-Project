#135458th place!
# But that felt way too easy...
require_relative 'glad_colors'



powernumber = 2**1_000

array = powernumber.to_s.scan(/./)
array.map! {|x| x.to_i}

puts "Answer: " + pink(array.inject(:+)) + " too simple if you ask me. Then again, " + pink("I am a superior being.")