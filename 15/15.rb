# Starting in the top left corner of a 2×2 grid, 
#  and only being able to move to the right and down, 
#  there are exactly 6 routes to the bottom right corner.
# How many such routes are there through a 20×20 grid?

def next_step
  step_type = rand(1) + 1
  step_type == 1 ? "right" : "down"
end