class Node
  attr_accessor :position, :node, :parent, :vertices, :vertex1, :vertex2, :vertex3, :vertex4, :vertex5, :vertex6, :vertex7, :vertex8
  
  def initialize(position)
    @position = position
    @parent = nil
    @vertices = Array.new(8)
  end
    
  def update_node(position = self.position)
    arr = update_array(position)
    self.vertices.each_with_index do |vertex, index|
      if arr[index].nil?
        self.vertices[index] = nil
      elsif !arr[index].nil?
        self.vertices[index] = Node.new(arr[index])
        self.vertices[index].parent = self
      end
    end
    self.vertices
    return arr
  end

  def order_level_search
    node = self
    queue = [node]
    ordered_array = []
    until queue == []
      i = 0
      until i == 8
        if !queue[0].vertices[i].nil?
          queue.push(queue[0].vertices[i])
          i += 1
        elsif queue[0].vertices[i].nil?
          i += 1
        end
      end
      ordered_array.push(queue.shift)
    end
    ordered_array.map { |value| value.position}
  end

  def valid_position?(x, y)
    if x > 7 || x < 0 || y > 7 || y < 0
      false
    else
      true
    end
  end

  def check_valid_positions(check_array)
    check_array.each_with_index do |value, index|
      if valid_position?(value[0], value[1])
        "cool"
      elsif !valid_position?(value[0], value[1])
        check_array[index] = nil
      end
    end
    check_array  
  end

  def update_array(position)
    update_array = []
    update_array.push([position[0] + 1, position[1] + 2])
    update_array.push([position[0] - 1, position[1] + 2])
    update_array.push([position[0] - 2, position[1] + 1])
    update_array.push([position[0] - 2, position[1] - 1])
    update_array.push([position[0] - 1, position[1] - 2])
    update_array.push([position[0] + 1, position[1] - 2])
    update_array.push([position[0] + 2, position[1] - 1])
    update_array.push([position[0] + 2, position[1] + 1])
    output = check_valid_positions(update_array)
    return output
  end

end