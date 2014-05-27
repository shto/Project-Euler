require "./node.rb"

class Grid
  attr_reader :grid
  attr_reader :current_x, :current_y
  
  def initialize(grid_width=2, grid_height=2)
    (0...grid_width).each { |x|
      (0...grid_height).each { |y|
        @grid[x, y] = Node.new
      }
    }
    
    self.setup_nodes
  end
  
  def setup_nodes
    (0..grid_width).each { |x|
      (0..grid_width).each { |y|
        node = @grid[x, y]
        
        node_to_right = @grid[x, y + 1]
        node_to_left = @grid[x, y - 1]
        node_up = @grid[x-1, y]
        node_down = @grid[x+1, y]
        
        node.setup(node_up, node_to_right, node_down, node_to_left)        
      }
    }
  end
  
  def perform_next_step
    step_type_rand = rand(1) + 1
    if step_type_rand == 1
      # going right
      @grid[current_x, current_y] = 'right'
      @current_x += 1
    elsif step_type_rand == 0
      #going down
      @grid[current_x, current_y] = 'down'
      @current_y += 1
    end
  end
  
  # goes back one step
  def go_back
    check_left_index = @current_x - 1
    check_up_index = @current_y - 1
    if @grid[check_left_index, @current_y] == 'right'
      # go back left
      @grid[current_x]
  end
end