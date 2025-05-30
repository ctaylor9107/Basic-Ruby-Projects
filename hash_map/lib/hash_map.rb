# Class for the Hash Map Data Structure
class HashMap
  attr_reader :buckets
  
  def initialize(load_factor, capacity)
    @load_factor = load_factor
    @capacity = capacity
    @buckets = Array.new(capacity, '')
  end

  def hash(key)
   hash_code = 0
   prime_number = 31
      
   key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
      
   hash_code
  end

  def set(key, value)
    hasher = hash(key) % 16
    @buckets[hasher] = [key, value]
  end
end