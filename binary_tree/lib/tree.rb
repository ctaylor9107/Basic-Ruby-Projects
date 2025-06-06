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

  def insert(value, node = @root)
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

  def get_successor(curr)
    curr = curr.right_node
    while (!curr.nil? && !curr.left_node.nil?)
      curr = curr.left_node
    end
    return curr
  end

  def delete(value, node = @root)
    if node == nil
      nil
    elsif node.data == value
      if node.left_node.nil? && node.right_node.nil?
        return nil
      elsif node.left_node.nil? && !node.right_node.nil?
        return node.right_node
      elsif !node.left_node.nil? && node.right_node.nil?
        return node.left_node
      elsif !node.left_node.nil? && !node.right_node.nil?
        succ = get_successor(node)
        node.data = succ.data
        node.right_node = delete(succ.data, node.right_node)        
      end
    else
      if value < node.data
        node.left_node = delete(value, node.left_node)
      elsif value > node.data
        node.right_node = delete(value, node.right_node)
      end
    end
    return node    
  end

  def find(value, node = @root)
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

  def level_order
    node = @root
    queue = [node]
    level_arr = []
    until queue == []
      if !queue[0].left_node.nil? && !queue[0].right_node.nil?
        queue.push(queue[0].left_node)
        queue.push(queue[0].right_node)
        level_arr.push(queue.shift)
      elsif queue[0].left_node.nil? && !queue[0].right_node.nil?
        queue.push(queue[0].right_node)
        level_arr.push(queue.shift)
      elsif !queue[0].left_node.nil? && queue[0].right_node.nil?
        queue.push(queue[0].left_node)
        level_arr.push(queue.shift)
      else
        level_arr.push(queue.shift)
      end
    end
    if block_given?
      level_arr.each do |node|
        yield node
      end
    elsif !block_given?
      level_arr.map { |node| node.data}
    end
  end

  def preorder(node = @root, array = [])
    if node == nil
      nil
    else
      array.push(node)
      preorder(node.left_node, array)
      preorder(node.right_node, array)
    end
    if block_given?
      array.each do |node|
        yield node
      end
    elsif !block_given?
      array.map { |node| node.data}
    end
  end

  def inorder(node = @root, array = [])
    if node == nil
      nil
    else
      inorder(node.left_node, array)
      array.push(node)
      inorder(node.right_node, array)
    end
    if block_given?
      array.each do |node|
        yield node
      end
    elsif !block_given?
      array.map { |node| node.data}
    end
  end

  def postorder(node = @root, array = [])
    if node == nil
      nil
    else
      postorder(node.left_node, array)
      postorder(node.right_node, array)
      array.push(node)
    end
    if block_given?
      array.each do |node|
        yield node
      end
    elsif !block_given?
      array.map { |node| node.data}
    end
  end

  def get_height(node, counter, array)
    if node.left_node.nil? && node.right_node.nil?
      array.push(counter)
    elsif !node.left_node.nil? && node.right_node.nil?
      counter += 1
      get_height(node.left_node, counter, array)
    elsif node.left_node.nil? && !node.right_node.nil?
      counter += 1
      get_height(node.right_node, counter, array)
    elsif !node.left_node.nil? && !node.right_node.nil?
      counter += 1
      get_height(node.left_node, counter, array)
      get_height(node.right_node, counter, array)
    end
    return array

  end

  def height(value)
    node = find(value)
    if node == nil
      return nil
    elsif node.left_node.nil? && node.right_node.nil?
      return 0
    else
      i = 0
      array = get_height(node, i, [])
    end
    return array.max
  end
  
end