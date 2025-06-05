require_relative 'merge_sort.rb'
require_relative 'node.rb'

class Tree
  attr_accessor :root
  
  def initialize(array)
    p sorted_array = merge_sort(array.uniq)
    @root = build_tree(sorted_array, 0, sorted_array.length - 1)
  end

  def build_tree(array, start, finish)
    if start > finish
      return nil
    else
      mid = start + ((finish - start)/2).floor
      root = Node.new(array[mid])
      root.left_node = build_tree(array, start, mid - 1)
      root.right_node = build_tree(array, mid + 1, finish)

      return root
    end
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right_node, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_node
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left_node, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_node
  end

  def insert(value, node)
    if node == nil
     return Node.new(value)
    elsif node.data == value
      return node
    elsif value < node.data
      node.left_node = insert(value, node.left_node)
    elsif value > node.data
      node.right_node = insert(value, node.right_node) 
    end 
    return node
  end

  def find(value, node)
    if node.data == value
     return node
    elsif node.left_node.nil? && node.right_node.nil?
      nil
    elsif node.left_node.nil? && !node.right_node.nil?
      return find(value, node.right_node)
    elsif node.right_node.nil? && !node.left_node.nil?
      return find(value, node.left_node)
    elsif !node.left_node.nil? && !node.right_node.nil?
      left = find(value, node.left_node)
      right = find(value, node.right_node)
      if !left.nil?
        return left
      elsif !right.nil?
        return right
      else
        nil
      end
    end
  end
  
end