require_relative 'node.rb'
require_relative 'linked_list.rb'

# Class for the Hash Map Data Structure
class HashMap
  attr_reader :buckets, :capacity
  
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

  def increase_capacity?
    if (@capacity * @load_factor) < self.entries.length
      return true
    elsif (@capacity * @load_factor) >= self.entries.length
      return false
    end
  end

  def set(key, value)
    hasher = hash(key)
    if @buckets[hasher].contains?(key)
      self.remove(key)
      @buckets[hasher].append([key, value])
    elsif !@buckets[hasher].contains?(key)
      @buckets[hasher].append([key, value])
    end
    if self.increase_capacity?
      entries = self.entries
      @capacity = @capacity * 2
      @buckets = Array.new(@capacity)
      i = 0
      until i == @capacity
        @buckets[i] = LinkedList.new
        i += 1
      end
      entries.each do |entry|
        set(entry[0], entry[1])
      end
    end
  end

  def get(key)
    @buckets.each do |entry|
      if entry.contains?(key)
        return entry.get_value(key)                                                        
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

  def remove(key)
    if self.has?(key)
      @buckets.each do |entry|
        this_key = entry.get_entry(key)
        if this_key != nil
          index = entry.find(this_key)
          entry.remove_at(index)
          return this_key
        else
         nil
        end
      end
    elsif !self.has?(key)
      nil
    end
  end

  def length
    self.entries.length
  end

  def clear
    @capcity = 16
    @buckets = Array.new(@capacity)
    i = 0
    until i == @capacity
      @buckets[i] = LinkedList.new
      i += 1
    end
  end

  def keys
    entries = self.entries
    keys = []
    entries.each { |entry| keys.push(entry[0]) }
    return keys
  end

  def values
    entries = self.entries
    values = []
    entries.each { |entry| values.push(entry[1]) }
    return values
  end

end