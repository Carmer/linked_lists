require "./linked_list"
require "minitest/autorun"
require "minitest/pride"

class LinkedListTest < Minitest::Test

  def test_it_exists
    assert LinkedList
  end

  def setup
    @linked_list = LinkedList.new("I'm the value of the head Node!")
  end

  def test_it_has_a_head
    assert_respond_to @linked_list, :head
  end

  def test_it_has_a_nil_head_if_list_is_empty
    @empty_list = LinkedList.new
    assert_equal nil, @empty_list.head
  end

  def test_head_is_a_Node
    assert_equal Node, @linked_list.head.class
  end

  def test_head_node_has_a_value
    assert_equal "I'm the value of the head Node!", @linked_list.head.value
  end

  def test_it_has_a_tail_node
    assert_respond_to @linked_list, :tail

    result = @linked_list.tail
    assert_equal Node, result.class
    assert_equal "I'm the value of the head Node!", @linked_list.tail.value
  end

  def test_it_can_append_a_new_node_to_the_list
    @linked_list.append("New Node value")
    assert_equal "New Node value", @linked_list.tail.value
  end

  def test_it_can_prepend_a_new_node_to_the_list
    @linked_list.prepend("new head node value")
    assert_equal "new head node value", @linked_list.head.value
    refute_equal "I'm the value of the head Node!", @linked_list.head.value
  end

  def test_it_can_see_if_a_value_is_included_in_the_list
    assert @linked_list.includes?("I'm the value of the head Node!")
  end

  def test_it_can_return_false_if_value_not_in_list
    refute @linked_list.includes?("Value not in list")
  end

  def larger_list
    @linked_list.append("node 2 value")
    @linked_list.append("node 3 value")
    @linked_list.append("tail node value")
  end

  def test_it_can_see_if_a_value_is_in_a_larger_list
    larger_list

    result1 = @linked_list.includes?("node 2 value")
    result2 = @linked_list.includes?("node 3 value")
    result3 = @linked_list.includes?("tail node value")

    assert result1
    assert result2
    assert result3
  end

  def test_it_can_return_false_if_value_is_not_in_a_larger_list
    refute @linked_list.includes?("notta value")
  end

  def test_it_can_pop_an_item_off_the_end_of_a_list
    larger_list

    assert @linked_list.includes?("tail node value")

    assert_equal "tail node value", @linked_list.pop

    refute @linked_list.includes?("tail node value")
  end

  def test_it_can_pop_twice
    larger_list

    assert @linked_list.includes?("tail node value")
    assert @linked_list.includes?("node 3 value")

    assert_equal "tail node value", @linked_list.pop
    assert_equal "node 3 value", @linked_list.pop

    refute @linked_list.includes?("tail node value")
    refute @linked_list.includes?("node 3 value")
  end

  def test_it_can_pop_off_the_head_node
    assert @linked_list.includes?("I'm the value of the head Node!")

    assert_equal "I'm the value of the head Node!", @linked_list.pop

    assert_equal nil, @linked_list.head
  end

  def test_it_can_count_the_number_of_nodes_in_the_list
    assert_equal 1, @linked_list.count
  end

  def test_it_can_count_a_larger_list
    larger_list

    assert_equal 4, @linked_list.count
  end

  def test_it_can_find_node_by_index
    larger_list

    result = @linked_list.find_by_index(2)

    assert_equal "node 3 value", result.value
  end

  def test_it_returns_false_if_index_searched_for_is_larger_than_the_size_of_the_list
    larger_list

    result = @linked_list.find_by_index(6)

    refute result
  end

  def test_it_can_find_position_of_a_node_by_the_value_provided
    larger_list

    result = @linked_list.find_by_value("node 3 value")

    assert_equal 2, result
  end

  def test_it_returns_nil_if_the_value_is_not_in_the_list
    larger_list

    result = @linked_list.find_by_value("value not in the list")

    assert_equal nil, result
  end

  def test_it_can_remove_a_node_by_the_index
    larger_list
    assert_equal 4, @linked_list.count

    assert_equal "node 2 value", @linked_list.remove_by_index(1)

    assert_equal 3, @linked_list.count
  end

  def test_it_can_remove_the_head_node_by_index_in_larger_list
    larger_list

    assert_equal 4, @linked_list.count

    assert_equal "I'm the value of the head Node!", @linked_list.remove_by_index(0)

    assert_equal 3, @linked_list.count
  end

  def test_it_can_remove_a_node_by_value
    larger_list

    assert_equal 4, @linked_list.count

    assert_equal "node 2 value", @linked_list.remove_by_value("node 2 value")

    assert_equal 3, @linked_list.count
  end

  def test_it_can_remove_a_head_node_by_value
    larger_list

    assert_equal 4, @linked_list.count

    assert_equal "I'm the value of the head Node!", @linked_list.remove_by_value("I'm the value of the head Node!")

    assert_equal 3, @linked_list.count
  end

end
