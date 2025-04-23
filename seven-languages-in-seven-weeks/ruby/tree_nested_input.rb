#tree_nested_input.rb
class Tree
  attr_accessor :children
  attr_accessor :node_name

  def initialize(nested_hash={})
    @node_name = nested_hash.keys[0]
    # the trick here is to use the `.collect` method to iterate as it accepts
    # both the `array` and `hash` class methods. Using `.each` throws an error.
    @children = nested_hash[node_name].collect{|k, v| Tree.new(k => v)}
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

nested_hash_family = {'grandpa' => {'dad' => {'child_1' => {}, 'child_2' => {} }, 'uncle' => {'child_1' => {}, 'child_2' => {} } } }

ruby_tree = Tree.new(nested_hash_family)

puts "visiting a node"

ruby_tree.visit {|node| puts node.node_name}

puts "Visiting entire tree."
ruby_tree.visit_all {|node| puts "Name: #{node.node_name} children: #{node.children}"}

