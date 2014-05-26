require "prime.rb"

module PrimeDivisors  
  def is_prime?
    return Prime.prime?(self)    
  end
  
  # [[2,2,2,2], [3,3], [5], [13]]
  def grouped_prime_divisors
    hash_prime_divisors = {}
    prime_divisors = self.prime_divisors
    
    prime_divisors.each { |prime_div|
      hash_prime_divisors[prime_div] ? hash_prime_divisors[prime_div] << prime_div : hash_prime_divisors[prime_div] = [prime_div]
    }
    
    hash_prime_divisors.values
  end
  
  def prime_divisors
    prime_divisors = []
    max = self / 2 + 1
    
    return [1, self] if self.is_prime?
    
    all_primes = Prime.each(max)
    number = self
    
    all_primes.each { |pn|
      while number % pn == 0
        prime_divisors << pn
        number /= pn
      end
    }
        
    prime_divisors
  end
  
  # Formula, see http://primes.utm.edu/glossary/xpage/tau.html
  def number_of_divisors
    self.grouped_prime_divisors.each.inject(1) {|mem, var| mem * (var.length + 1) }
  end
    
  # Returns all the divisors for a number
  def divisors
    divisors = []
    max = self / 2 + 1
    
    (1..max).each { |num|
      divisors << num if self % num == 0
    }
    
    divisors << self
    
    return divisors    
  end
end