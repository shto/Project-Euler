//The prime factors of 13195 are 5, 7, 13 and 29.
//
//What is the largest prime factor of the number 600851475143 ?

// this will become part a class variable
var primesSoFar: Int[] = []

class Prime {
    var previousPrimes: Int[]
    
    init() {
        previousPrimes = []
    }
    
    // Generates prime numbers until number
    func generate(untilNumber number:Int) -> Int[] {
        let start = 2
        var primes: Int[] = [start]
        
        
        
    }
    
    func primes(untilNumber number: Int) -> Int[] {
        var returnedArray: Int[] = []
        let lastPrime = self.previousPrimes[self.previousPrimes.count - 1]
        
        if (lastPrime > number) {
            for prime in self.previousPrimes {
                if (prime < number) {
                    returnedArray += prime
                } else {
                    break
                }
            }
        } else {
            returnedArray = self.generate(untilNumber: number)
        }
        
        return returnedArray
    }
    
    func isPrime(numberToCheck number: Int) -> Bool {
        /**
        There are certain things that can be improved upon here:
        - if the number ends in an even number (2, 4 etc.) or 0, it is not a prime
        - if the number ends in 5, it is not a prime
        - if the sum of the number's numbers is divisible by 3, it means that the number is divisible by 3, meaning that it is not a prime (e.g. 123, 1 + 2 + 3 = 6, divisible by 3, thus 123 is not a prime)
        - have an already defined starting array of the first 1000 primes; this would probably be good enough for all intents and purposes right now
         */
        
        
        let previousPrimes = self.primes(untilNumber: number)
        for prime in previousPrimes {
            if (number % prime == 0) {
                return false
            }
        }
        
        return true
    }
    
    func nextPrime(start startAt: Int) -> Int {
        
        var isPrime = false
        var sentinel = startAt
        
        while !isPrime {
            for prime in self.previousPrimes {
                if (sentinel % prime == 0) {
                    // not a prime
                    break
                }
            }
            
            ++sentinel
        }
    }
    
    
}

var number = 600_851_475_143
var nextPrime = Prime.nextPrime()


