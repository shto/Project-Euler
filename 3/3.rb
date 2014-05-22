# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

require "./prime_checker.rb"

# actually calculating stuff
sentinel = 2
prime_factors = []
number = 600851475143
max = Math.sqrt(number).ceil

(2..max).each { |n|
  prime_factors << n if (number.divides_by?(n) && n.is_prime?)
}

puts prime_factors.inspect