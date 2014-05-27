# Getting the numbers
numbers = []
numbers_file = File.open("13.txt", "r")
row = 0

numbers_file.each {|line| numbers << line.to_i }

puts numbers.inject(0) { |sum, val| sum + val }