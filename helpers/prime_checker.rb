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