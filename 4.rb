# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.

class Fixnum
  def is_palindrome?
    return self.to_s == self.to_s.reverse
  end
end

palindromes = []

(100..999).each { |n| 
  (100..999).each { |x|
    palindromes << n * x if (n * x).is_palindrome?
  }
}

palindromes.sort

puts palindromes