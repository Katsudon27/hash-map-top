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

  def at(index)
    return nil if index > size || index.negative?

    tmp_node = @head
    index.times do
      tmp_node = tmp_node.next_node
    end
    tmp_node.value
  end

  def pop
    return @head if @head.nil?

    tmp_node = @head
    @head = @head.next_node
    tmp_node.value
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

  def index(key)
    unless @head.nil?
      tmp_node = @head
      index = 0
      until tmp_node.nil?
        return index if tmp_node.key == key

        tmp_node = tmp_node.next_node
        index += 1
      end
    end
    nil
  end

  def remove_at(index)
    raise IndexError if index.negative? || index >= size

    if index.zero?
      @head = @head.next_node
    else
      previous_node = @head
      current_node = @head.next_node
      (index - 1).times do
        previous_node = current_node
        current_node = current_node.next_node
      end
      # Remove the node at the given index by linking its previous node to its next node
      previous_node.next_node = current_node.next_node
    end
  end

  def keys
    keys = []
    tmp_node = @head
    until tmp_node.nil?
      keys << tmp_node.key
      tmp_node = tmp_node.next_node
    end
    keys
  end

  def values
    values = []
    tmp_node = @head
    until tmp_node.nil?
      values << tmp_node.value
      tmp_node = tmp_node.next_node
    end
    values
  end
end
