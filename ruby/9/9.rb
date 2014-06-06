# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
# 
# a^2 + b^2 = c^2
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
# 
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

sum = 0
product = 1

(1..1000).each { |a|
  (a..1000).each { |b|
    c = Math.sqrt(a**2 + b**2)
    
    # check if number is int
    sum = a + b + c if (c % 1 == 0)
    if sum == 1000
      product = a*b*c
      break
    end
  }
  break if sum == 1000
}

puts product.to_i