# The following iterative sequence is defined for the set of positive integers:

# n → n/2 (n is even)
# n → 3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the following sequence:

# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1 
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

# Which starting number, under one million, produces the longest chain?

# NOTE: Once the chain starts the terms are allowed to go above one million.

def next_value (start)
  start % 2 == 0 ? start / 2 : 3 * start + 1
end

def length_of_chain_starting_at(start)
  length = 0
  value_now = start
  
  begin
    length+=1
    value_now = next_value(value_now)
  end while value_now != 1
  
  return length
end

max_length = 0
max_number = 0

(2..1_000_000).each { |start|
  chain_length = length_of_chain_starting_at (start)
  
  puts "#{start} --> #{chain_length}"
  
  if max_length < chain_length
    max_length = chain_length
    max_number = start
  end
}

puts "Max: #{max_number}"