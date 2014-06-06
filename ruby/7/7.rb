# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
# 
# What is the 10 001st prime number?

require "./../3/prime_checker.rb" # class Fixnum has a is_prime? method there

index = 1
the_number = 1

until index == 10001 do
  the_number += 1
  index += 1 if the_number.is_prime?
end

puts the_number