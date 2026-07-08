# A class that represents a node object in a Linked List
class Node
  attr_accessor :value, :next_node, :key

  def initialize(key = nil, value = nil, next_node = nil)
    @key = key
    @value = value
    @next_node = next_node
  end
end

# A class that represents a Linked List object and contains all of the required operations
class LinkedList
  def initialize
    @head = nil
  end

  def append(key, value)
    # Prepends the value if the existing list is empty
    if @head.nil?
      prepend(key, value)
    else
      tmp_node = @head
      tmp_node = tmp_node.next_node until tmp_node.next_node.nil?
      tmp_node.next_node = Node.new(key, value)
    end
  end

  def prepend(key, value)
    @head = Node.new(key, value, @head)
  end

  def size
    # Iterates through each node and return the total count
    count = 0
    tmp_node = @head
    until tmp_node.nil?
      count += 1
      tmp_node = tmp_node.next_node
    end
    count
  end

  def head
    @head&.value
  end

  def tail
    tmp_node = nil
    unless @head.nil?
      tmp_node = @head
      tmp_node = tmp_node.next_node until tmp_node.next_node.nil?
      return tmp_node.value
    end
    tmp_node
  end

  def contains?(key)
    return false if @head.nil?

    tmp_node = @head
    until tmp_node.nil?
      return true if tmp_node.key == key

      tmp_node = tmp_node.next_node
    end
    false
  end

  def find_value(key)
    unless @head.nil?
      tmp_node = @head
      until tmp_node.nil?
        return tmp_node.value if tmp_node.key == key

        tmp_node = tmp_node.next_node
      end
    end
    nil
  end

  def update_node_value(key, value)
    return nil if @head.nil?

    tmp_node = @head
    until tmp_node.nil?
      if tmp_node.key == key
        tmp_node.value = value
        break
      end
      tmp_node = tmp_node.next_node
    end
  end

  def remove_node(key)
    if !@head.nil? && @head.key == key
      value = head
      @head = @head.next_node
      value
    elsif contains?(key)
      previous_node = @head
      current_node = @head.next_node
      until current_node.nil?
        break if current_node.key == key

        previous_node = current_node
        current_node = current_node.next_node
      end
      # Remove the node at the given index by linking its previous node to its next node
      previous_node.next_node = current_node.next_node
      current_node.value
    end
  end

  def retrieve(data)
    results = []
    tmp_node = @head
    until tmp_node.nil?
      results << if data == "value"
                   tmp_node.value
                 else
                   tmp_node.key
                 end
      tmp_node = tmp_node.next_node
    end
    results
  end

  def entries
    retrieve("key").zip(retrieve("value"))
  end
end
