# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

class Fixnum
  def divides_by?(number)
    return self % number == 0
  end
  
  def is_prime?
    max = Math.sqrt(self).ceil
    sentinel = 2
    is_prime = true

    (2..max).each { |sentinel|
      if self % sentinel == 0
        is_prime = false
        break
      end
    }  

    is_prime
  end
end

# actually calculating stuff
sentinel = 2
prime_factors = []
number = 600851475143
max = Math.sqrt(number).ceil

(2..max).each { |n|
  prime_factors << n if (number.divides_by?(n) && n.is_prime?)
}

puts prime_factors.inspect