require_relative "module_primes"

class Fixnum
  include PrimeDivisors
end

class Bignum
  include PrimeDivisors
end