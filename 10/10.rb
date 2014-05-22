# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# 
# Find the sum of all the primes below two million.

require "../helpers/prime_checker.rb"

sum = (2..2_000_000).inject(2) { |memo, num|
  num.is_prime? ? memo + num : memo
}

puts sum