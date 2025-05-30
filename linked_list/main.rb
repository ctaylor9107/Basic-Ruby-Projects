require_relative 'linked_list'

list = LinkedList.new


list.append('dogs')
list.append('cats')
list.append('mice')
list.append('fleas')

puts list
puts list.head.value
puts list.tail.value

list.prepend('cows')
list.prepend('horses')

puts list
puts list.contains?('dogs')
puts list.contains?('aliens')
puts list.at(3)
puts list.at(10)
puts list.size
puts list.find('cows')
puts list.find('aliens')

list.pop
puts list
puts list.head.value
puts list.tail.value

list.insert_at('rhinos', 0)
list.insert_at('fleas', 6)
list.insert_at('goats', 3)
list.insert_at('spaceships', 89)
list.insert_at('elevators', -7)
puts list
puts list.head.value
puts list.tail.value

list.remove_at(0)
puts list
puts list.head.value
puts list.tail.value

list.remove_at(6)
puts list
puts list.head.value
puts list.tail.value

list.remove_at(2)
list.remove_at(76)
list.remove_at(-8)
puts list
puts list.head.value
puts list.tail.value
puts list.size

list.remove_at(4)
list.remove_at(0)
list.remove_at(2)
puts list
puts list.head.value
puts list.tail.value
puts list.size

list.pop
puts list
puts list.head.value
puts list.tail.value
puts list.size

list.pop
puts list
puts list.head
puts list.tail
puts list.size
