class Path
  # array of nodes
  attr_reader :nodes
  
  def += (node)
    add_node(node)
  end
  
  def add_node(node)
    nodes << node
  end
end