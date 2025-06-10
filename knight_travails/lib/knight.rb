require_relative 'node.rb'

class Knight
  
  def initialize
  end

  def knight_moves(start, finish)
    root = Node.new(start)
    root.update_node
    queue = [root]
    output_arr = []
    output_values = []
    until output_values.include?(finish)
      queue[0].update_node
      i = 0
      until i == 8
        if !queue[0].nil? && !queue[0].vertices[i].nil?
          queue.push(queue[0].vertices[i])
          i += 1
        elsif queue[0].nil? || queue[0].vertices[i].nil?
          i += 1
        end
      end
      node_to_push = queue.shift
      if node_to_push.nil?
        ""
      elsif !node_to_push.nil?
        output_arr.push(node_to_push)
        output_values.push(node_to_push.position)
      end
    end
    if queue == []
      puts 'blank'
    elsif queue != []
        output_arr.push(queue.shift)
    end
    output = output_arr.select { | node | node.position == finish}
    output.each do |node|
      path = [node.position]
      until node.parent == nil
        path.push(node.parent.position)
        node = node.parent
      end
    puts "You made it in #{path.length - 1} moves!"
    p path.reverse
    return
    end
  end



end