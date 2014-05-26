# 08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08
# 49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00
# 81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65
# 52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91
# 22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80
# 24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50
# 32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70
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

# calculates the maximum product of 4 adjacent numbers for an array
def max_product_of_four_adjacent_numbers_from_array(numbers)
  max_product = 1
  
  (0..numbers.length - 4).each { |index|
    four_numbers = []
    (0..3).each { |position|
      four_numbers << numbers[index + position]
    }
    
    product = four_numbers.inject(1) { |mem, var| mem * var }
    max_product = product if (max_product < product)
  }
  
  return max_product
end

# calculates the maximum product of 4 adjacent numbers from an array of arrays, supposing to represent an array of lines of numbers
def max_product_of_four_adjacent_numbers_from_collection_of_arrays(lines)
  max_product = 1
  
  lines.each {|line|
    line_max = max_product_of_four_adjacent_numbers_from_array(line)
    max_product = line_max if (max_product < line_max)
  }
  
  return max_product
end

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

final_results = []

# get all vertical lines as arrays of numbers
all_vertical_lines = []
(0..16).each { |column|
  vertical_line = []
  (0..16).each { |row|
    vertical_line << grid_hash[[row, column]]
  }
  
  all_vertical_lines << vertical_line
}

max_vertical = max_product_of_four_adjacent_numbers_from_collection_of_arrays(all_vertical_lines)
    
final_results << max_vertical

# check horizontally
all_horizontal_lines = []
(0..16).each { |row|
  horizontal_line = []
  (0..16).each { |column|
    horizontal_line << grid_hash[[row, column]]
  }
  
  all_horizontal_lines << horizontal_line
}

max_horizontal = max_product_of_four_adjacent_numbers_from_collection_of_arrays(all_horizontal_lines)
    
final_results << max_horizontal

# check diagonally UL -> BR
all_diagonal_lines = []
(0..19).each{|row_or_column|
  diagonal_line_up = []
  diagonal_line_down = []
  
  (0..19-row_or_column).each{|index|
    # e.g. (0,4), (1,5), (2,6) ... (14, 18), (15, 19)
    diagonal_line_up << grid_hash[[index, index + row_or_column]]
    diagonal_line_down << grid_hash[[index + row_or_column, index]]
  }
  
  all_diagonal_lines << diagonal_line_up
  all_diagonal_lines << diagonal_line_down
}

max_diagonal_ul_br = max_product_of_four_adjacent_numbers_from_collection_of_arrays(all_diagonal_lines)
    
final_results << max_diagonal_ul_br
    
# check diagonally BR -> UL
all_diagonals = []
(0..19).each{|sum_between_components|
  diagonal_line_up = []
  
  (0..sum_between_components).each{|index|
    diagonal_line_up << grid_hash[[index, sum_between_components - index]]
  }
  
  all_diagonals << diagonal_line_up
}

max_diagonal_br_ul_1 =
max_product_of_four_adjacent_numbers_from_collection_of_arrays(all_diagonals)
    
final_results << max_diagonal_br_ul_1
    
    
last_diagonals = []
(20..38).each{|sum|
  start = sum - 19  # start is also the row
  diagonal = []
  (start..19).each{|row|
    diagonal << grid_hash[[row, sum - row]]
  }
  
  last_diagonals << diagonal
}

max_diagonal_br_ul_2 = max_product_of_four_adjacent_numbers_from_collection_of_arrays(last_diagonals)
    
final_results << max_diagonal_br_ul_2

puts final_results.sort.inspect