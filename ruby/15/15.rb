# Starting in the top left corner of a 2×2 grid, 
#  and only being able to move to the right and down, 
#  there are exactly 6 routes to the bottom right corner.
# How many such routes are there through a 20×20 grid?

class Point
  attr_accessor :x, :y
  
  def initialize(xpos, ypos)
    @x = xpos
    @y = ypos
  end
end

# TODO: Create a cache for catching the middle points, which seem to trigger many many recursions in and of themselves

def number_of_paths_to_end_from_point(start_point)
  
  tabs = "\t" * ([start_point.x, start_point.y].max)
  puts "#{tabs} (#{start_point.x}, #{start_point.y})"
  
  # only 1 path to end from the edges
  return 1 if (start_point.y == 2 || start_point.x == 2)
  
  # last point
  return 0 if (start_point.x == 2 && start_point.y == 2)
    
  # otherwise, it's the sum of the paths that can be taken when adding the ones from right and the ones from below
  right_point = Point.new(start_point.x + 1, start_point.y)
  down_point = Point.new(start_point.x, start_point.y + 1)
  
  right = number_of_paths_to_end_from_point(right_point)
  down = number_of_paths_to_end_from_point(down_point)
  
  # puts "From: (#{start_point.x}, #{start_point.y}) -> #{right + down} "
  
  return right + down
end

puts number_of_paths_to_end_from_point(Point.new(0, 0))