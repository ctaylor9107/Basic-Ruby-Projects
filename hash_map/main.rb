require_relative 'lib/hash_map.rb'
require_relative 'lib/node.rb'
require_relative 'lib/linked_list.rb'

test = HashMap.new(0, 16)


test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

puts test.buckets.select { |entry| entry.head != nil }

puts test.has?('apple')

puts test.get('ice cream')

p test.entries

p test.remove('grape')

p test.entries

p test.length


