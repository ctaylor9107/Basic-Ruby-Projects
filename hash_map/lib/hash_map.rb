require_relative 'node.rb'
require_relative 'linked_list.rb'

# Class for the Hash Map Data Structure
class HashMap
  attr_reader :buckets
  
  def initialize(load_factor, capacity)
    @load_factor = load_factor
    @capacity = capacity
    @buckets = Array.new(capacity)
    i = 0
    until i == capacity
      @buckets[i] = LinkedList.new
      i += 1
    end
  end

  def hash(key)
   hash_code = 0
   prime_number = 31
   
   key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
   
   hash_code % @buckets.length
  end

  def set(key, value)
    hasher = hash(key)
    @buckets[hasher].append([key, value])
  end

  def get(key)
    @buckets.each do |entry|
      if entry.contains?(key)
        return entry.get_value(key, entry.size)                                                        
      end
    end
    nil
  end

  def has?(key)
    selection = @buckets.select { |entry| entry.head != nil}
    selection.each do |entry|
      entry.contains?(key) ? (return true) : false
    end
    false
  end

  def entries
    entries = []
    i = 0
    while i < @buckets.length
      if @buckets[i].head == nil
        i += 1
      elsif @buckets[i].head != nil
        curr_node = @buckets[i].head
        until curr_node == nil
          entries.push(curr_node.value)
          curr_node = curr_node.next_node
        end
        i += 1
      end
    end
    entries
  end
end