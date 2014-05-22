# In the 20×20 grid below, four numbers along a diagonal line have been marked in red.
#00 0  1  2  3  4  5  6
#0 08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08
#1 49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00
#2 81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65
#3 52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91
#4 22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80
#5 24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50
#6 32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70
# 67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21
# 24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72
# 21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95
# 78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92
# 16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57
# 86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58
# 19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40
# 04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66
# 88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69
# 04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36
# 20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16
# 20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54
# 01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48

# The product of these numbers is 26 × 63 × 78 × 14 = 1788696.
# 
# What is the greatest product of four adjacent numbers in the same direction (up, down, left, right, or diagonally) in the 20×20 grid?

grid_hash = {}

# Building the grid (grid can be found in the grid.txt file)
grid_file = File.open("grid.txt", "r")
row = 0

grid_file.each {|line|
  # build the hash
  line_numbers = line.split(" ")
  column = 0
  
  line_numbers.each {|num_string|
    grid_hash[[row, column]] = num_string.to_i
    column+=1
  }
  
  row+=1
}

grid_hash.each_pair {|key, value|
  puts "#{key} => #{value}"
}

# check vertically
vertical_maximum_product = 1

(0..15).each { |column|
  (0..15).each { |row|
    four_numbers = []
    four_numbers << grid_hash[[row, column]]
    (1..3).each {|index|
      four_numbers << grid_hash[[row + index, column]]
    }
    
    product = four_numbers.inject(1) {|memo, num| memo * num }
    vertical_maximum_product = product if (vertical_maximum_product < product)
  }
}

puts "vertical: " + vertical_maximum_product.to_s

# check horizontally
horizontal_maximum_product = 1

(0..15).each {|row|
  (0..15).each {|column|
    four_numbers = []
    four_numbers << grid_hash[[row, column]]
    (1..3).each{|index|
      four_numbers << grid_hash[[row, column + index]]
    }
    
    product = four_numbers.inject(1) { |mem, var| mem * var }
    horizontal_maximum_product = product if (horizontal_maximum_product < product)
  }
}

puts "horizontal: " + horizontal_maximum_product.to_s

#check diagonally
diagonal_maximum_product = 1

# middle
# =>          (0,0) (1,1) (2,2) (3,3) | (1,1) (2,2) (3,3) (4,4) | ...
middle_max_product = 1
(0..16).each {|row_column|
  four_numbers = []
  four_numbers << grid_hash[[row_column, row_column]]
  (1..3).each {|index|
    four_numbers << grid_hash[[row_column + index, row_column + index]]
  }
  
  product = four_numbers.inject(1) { |mem, var| mem * var }
  middle_max_product = product if (middle_max_product < product)
}

# =>          - upper
#             (0,1) (1,2) (2,3) (3,4) | (1,2) (2,3) (3,4) (4,5) | ...
# =>          (0,2) (1,3) (2,4) (3,5) | (1,3) (2,4) (3,5) (4,6) | ...
# =>          ....
# =>          (0,16) (1,17) (2,18) (3,19)
# =>          - lower (opposite of upper)
# =>          (1,0) (2,1) (3,2) (4,3)

upper_max = 1
lower_max = 1
(0..16).each{|start_index|
  upper_four_numbers = []
  lower_four_numbers = []
  
  (start_index..start_index+3).each {|second_index|    
    upper_four_numbers << grid_hash[[start_index, second_index]]
    lower_four_numbers << grid_hash[[second_index, start_index]]    
  }
  
  upper_product = upper_four_numbers.inject(1) { |mem, var| mem * var }
  lower_product = lower_four_numbers.inject(1) { |mem, var| mem * var }

  upper_max = upper_product if (upper_max < upper_product)
  lower_max = lower_product if (lower_max < lower_product)
}

maxes = [vertical_maximum_product, horizontal_maximum_product, middle_max_product, upper_max, lower_max]
puts maxes.sort.inspect