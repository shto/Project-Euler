class Node
  # going back
  attr_accessor :left_node
  attr_accessor :upper_node
  
  # going forward
  attr_accessor :right_node
  attr_accessor :down_node
  
  # movement decision
  attr_accessor :went
  
  def initialize
    went = []
  end
  
  def setup(up_node, right_node, down_node, left_node)
    self.upper_node = up_node
    self.right_node = right_node
    self.down_node = down_node
    self.left_node = left_node
  end
  
  # get previous node
  def previous
    
  end
  
  def next
    # if we have gone all possible ways, just return
    return nil if self.went.length == 2
    return nil if self.is_last?
    
    return_node = nil
    
    if self.went[0] == "right"
      self.went << "down"
      return self.down_node
    elsif self.went[0] == "down"
      self.went << "right"
      return self.right_node
    else
      # didn't go anywhere yet
      if self.right_node
        self.went << "right"
        return self.right_node
      elsif self.down_node
        self.went << "down"
        return self.down_node
      end
    end
  end
  
  def is_last?
    return self.right_node == nil && self.down_node == nil
  end  
end