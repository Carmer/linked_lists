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
    @linked_list.append("node 4 value")
  end

  def test_it_can_see_if_a_value_is_in_a_larger_list
    larger_list

    result1 = @linked_list.includes?("node 2 value")
    result2 = @linked_list.includes?("node 3 value")
    result3 = @linked_list.includes?("node 3 value")

    assert result1
    assert result2
    assert result3
  end

  def test_it_can_return_false_if_value_is_not_in_a_larger_list
    refute @linked_list.includes?("notta value")
  end


end
