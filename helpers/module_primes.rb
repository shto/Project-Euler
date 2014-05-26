require "prime.rb"

module PrimeDivisors  
  def is_prime?
    return Prime.prime?(self)    
  end
  
  def prime_divisors    
    prime_divisors = []
    max = self / 2
    
    Prime.each(max) { |pn|
      prime_divisors << pn if self % pn == 0
    }
        
    prime_divisors
  end
  
  # A (faster) method to use when we need a quick number results of how many potential divisors self might have
  def number_of_potential_divisors    
    number_of_prime_divisors = self.prime_divisors.length
    
    n = number_of_prime_divisors
    number_of_combination_of_prime_divisors = (n * (n - 1))/2
    
    combined_number_of_all = number_of_combination_of_prime_divisors + number_of_prime_divisors
    
    (combined_number_of_all * (combined_number_of_all - 1))/2
  end
  
  def potential_divisors
    potential_divisors = []
    
    divisors = self.prime_divisors
    
    # create combinations of 2
    combination_of_two_divisors = []
    divisors.combination(2) { |combination|
      combination_of_two_divisors << combination[0] * combination[1]
    }
    
    divisors += combination_of_two_divisors
    
    # create array of potential divisors
    divisors.combination(2) { |combination| 
      potential_divisors << combination[0] * combination[1]
    }
    
    potential_divisors
  end
    
  # Returns all the divisors for a number
  def divisors
    divisors = []
    potential_divisors = self.potential_divisors
    
    potential_divisors.each { |divisor|
      divisors << divisor if self % divisor == 0
    }
    
    return divisors    
  end
end