# class used to create linked list data structures
class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new
    new_node.value = value
    if @head.nil? && @tail.nil?
      @head = new_node
      @tail = new_node
    elsif @head == @tail
      @tail = new_node
      @head.next_node = @tail
    elsif @head != @tail
      @tail.next_node = new_node
      @tail = new_node
    end
  end

  def prepend(value)
    new_node = Node.new
    new_node.value = value
    if @head.nil? && @tail.nil?
      @head = new_node
      @tail = new_node
    elsif @head == @tail
      @head = new_node
      new_node.next_node = @tail
    elsif @head != @tail
      new_node.next_node = @head
      @head = new_node
    end
  end

  def size
    list_size = 0
    curr_node = @head
    until curr_node.nil?
      list_size += 1
      curr_node = curr_node.next_node
    end
    list_size
  end

  def at(index)
    curr_node = @head
    i = 0
    until i == index || curr_node == nil
      curr_node = curr_node.next_node
      i += 1
    end
    if curr_node == nil
      'nil'
    else
      curr_node.value
    end
  end

  def pop
    curr_node = @head
    if curr_node == @tail
      @head = nil
      @tail = nil
    elsif curr_node != @tail
      until curr_node.next_node == @tail
        curr_node = curr_node.next_node
      end
      @tail = curr_node
      curr_node.next_node = nil
    end
  end

  def contains?(value)
    curr_node = @head
    output = ""
    until curr_node.nil?
      if curr_node.value == value
        output = true
        break
      elsif curr_node.value != value
        curr_node = curr_node.next_node
        output = false
      end
    end
    return output
  end

  def find(value)
    curr_node = @head
    node_index = 0
    until curr_node.nil?
      if curr_node.value == value
        print node_index
        output = ""
        break
      elsif curr_node.value != value
        curr_node = curr_node.next_node
        node_index += 1
        output = 'nil'
      end
    end
    print output
  end

  def to_s
    curr_node = @head
    output = ''
    until curr_node.nil?
      if !curr_node.next_node.nil?
        output << "( #{curr_node.value} ) -> "
        curr_node = curr_node.next_node
      elsif curr_node.next_node.nil?
        output << "( #{curr_node.value} ) -> nil"
        curr_node = curr_node.next_node
      end
    end
    output
  end

  def insert_at(value, index)
    curr_node = @head
    if curr_node.nil?
      'nil'
    elsif !curr_node.nil?
      if index == 0
        prepend(value)
      else
        i = 0
        until i == index - 1 || curr_node.nil?
          curr_node = curr_node.next_node
          i += 1
        end
        if curr_node.nil?
          'nil'
        elsif !curr_node.nil?
          new_node = Node.new
          new_node.value = value
          new_node.next_node = curr_node.next_node
          curr_node.next_node = new_node
          if new_node.next_node == nil
            @tail = new_node
          end
        end
      end
    end
  end

  def remove_at(index)
    curr_node = @head
    if index == 0
      @head = @head.next_node
    elsif index > 0
      i = 0
      until i == index - 1 || curr_node.nil?
        curr_node = curr_node.next_node
        i += 1
      end
      if curr_node.nil?
        'nil'
      else
        if curr_node.next_node.next_node.nil?
          loop_again = @head
          until loop_again.next_node == @tail
            loop_again = loop_again.next_node
          end
          @tail = loop_again
          @tail.next_node = nil
        elsif !curr_node.next_node.nil?
          curr_node.next_node = curr_node.next_node.next_node
        end
      end
    end
  end

  # class to create nodes in the linked list
  class Node
    attr_accessor :value, :next_node

    def initialize
      @value = nil
      @next_node = nil
    end
  end
end
