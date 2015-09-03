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

    if @head.next_node.nil?
      value_of_popped = @head.value
      @head = nil
    else
      until current_node.next_node.next_node.nil?
        current_node = current_node.next_node
      end
      value_of_popped = current_node.next_node.value
      current_node.next_node = nil
    end
    value_of_popped
  end

  def count
    current_node = @head
    list_count = 1
    until current_node.next_node.nil?
      list_count += 1
      current_node = current_node.next_node
    end
    list_count
  end

  def find_by_index(index)
    current_node = @head
    list_index = 0

    if count > index + 1
      until list_index == index
        list_index +=1
        current_node = current_node.next_node
      end
      return current_node
    else
      false
    end
  end

  def find_by_value(value)
    current_node = @head
    list_index = 0
    if includes?(value)
      until current_node.value == value
        list_index += 1
        current_node = current_node.next_node
      end
      return list_index
    else
      return nil
    end
  end

  def remove_by_index(index)
    if index == 0
      removed_node = @head
      @head = @head.next_node
      return removed_node.value
    end

    current_node = @head

    list_index = 0
    if count > index + 1
      until list_index == index - 1
        list_index += 1
        current_node = current_node.next_node
      end
        removed_node = current_node.next_node
        current_node.next_node = current_node.next_node.next_node
        removed_node.value
    else
      return nil
    end
  end

  def remove_by_value(value)
    if @head.value == value
      removed_node = @head
      @head = @head.next_node
      return removed_node.value
    end

    if includes?(value)
      current_node = @head
      until current_node.next_node.value == value
        current_node = current_node.next_node
      end
      removed_node = current_node.next_node
      current_node.next_node = current_node.next_node.next_node
      removed_node.value
    end
  end

end
