class Node

  def initialize(value, next_node = nil)
    @value = value
    @next_node  = next_node
  end

  def value
    @value
  end

  def next_node
    @next_node
  end

  def next_node=(new_node)
    @next_node = new_node
  end

end
