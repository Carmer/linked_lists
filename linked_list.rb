require "./node"


class LinkedList

  def initialize(head_node_value = nil)
    if head_node_value
      @head = Node.new(head_node_value)
    else
      @head = head_node_value
    end
  end

  def head
    @head
  end

  def tail
    current_node = @head

    until current_node.next_node.nil?
      current_node = current_node.next_node
    end
    current_node
  end

  def append(new_node_value)
    current_node = @head

    until current_node.next_node
  end

end
