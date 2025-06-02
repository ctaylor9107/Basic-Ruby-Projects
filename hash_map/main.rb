require_relative 'lib/hash_map.rb'
require_relative 'lib/node.rb'
require_relative 'lib/linked_list.rb'

test = HashMap.new(0.75, 16)


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

test.clear

p test.entries

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

p test.entries

puts test.keys

puts test.values

puts test.increase_capacity?

test.set('moon', 'silver')

puts test.buckets

puts test.length

puts test.keys

p test.entries

puts test.values

puts test.has?('apple')

puts test.get('ice cream')

p test.remove('grape')

p test.length

p test.entries

test.clear

p test.entries

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
test.set('moon', 'silver')

p test.entries

