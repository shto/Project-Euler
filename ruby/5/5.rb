# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

number = 2 * 3 * 5 * 7 * 11 * 13 * 19
found = false

def divides_by_all(number, range=(1..20))
  divides_by_all = true
  
  range.each { |e|
    if number % e != 0
      divides_by_all = false
    end
    
    break if !divides_by_all
  }
  
  return divides_by_all
end

while !found do
  found = divides_by_all(number)
  puts number if found    
  number+=2
end

puts "ended"