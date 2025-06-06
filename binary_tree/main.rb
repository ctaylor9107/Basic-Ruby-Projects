require_relative "lib/tree.rb"

arr = (Array.new(15) { rand(1..100) })
tree = Tree.new(arr)

puts tree.pretty_print

puts tree.balanced?

p tree.level_order

p tree.preorder

p tree.inorder

p tree.postorder

tree.insert(145)
tree.insert(113)
tree.insert(267)
tree.insert(2675)
tree.insert(587)

puts tree.pretty_print

puts tree.balanced?

puts tree.rebalance

puts tree.pretty_print

puts tree.balanced?

puts tree.rebalance

p tree.level_order

p tree.preorder

p tree.inorder

p tree.postorder
