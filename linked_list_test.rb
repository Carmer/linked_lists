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

end
