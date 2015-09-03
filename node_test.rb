require "./node"
require "minitest/autorun"
require "minitest/pride"

class NodeTest < Minitest::Test

  def test_it_exists
    assert Node
  end

  def setup
    @node = Node.new("I'm a Node value!")
  end

  def test_it_has_a_value
    assert "I'm a Node value!", @node.value
  end

  def test_it_has_a_reference_to_a_next_node
    assert_respond_to @node, :next_node
  end
end
