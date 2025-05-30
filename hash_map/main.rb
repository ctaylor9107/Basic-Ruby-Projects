require_relative 'lib/hash_map.rb'

test = HashMap.new(0, 16)

p test.buckets

test.set('apple', 'red')

p test.buckets

