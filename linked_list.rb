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
    tail.next_node = Node.new(new_node_value)
  end

  def prepend(new_node_value)
    new_node = Node.new(new_node_value, @head)
    @head = new_node
  end

  def includes?(value)
    return  true if @head.next_node.nil? && @head.value == value

    current_node = @head

    until current_node.nil?
      if current_node.value == value
        return true
      else
        included = false
      end
      current_node = current_node.next_node
    end
    included
  end

  def pop
    current_node = @head

    until current_node.next_node.next_node.nil?
      current_node = current_node.next_node
    end
    value_of_popped = current_node.next_node.value
    current_node.next_node = nil
    value_of_popped
  end

end
