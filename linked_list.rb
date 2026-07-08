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

  def prepend(value)
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

  def contains?(value)
    return false if @head.nil?

    tmp_node = @head
    until tmp_node.nil?
      return true if tmp_node.value == value

      tmp_node = tmp_node.next_node
    end
    false
  end

  def index(value)
    unless @head.nil?
      tmp_node = @head
      index = 0
      until tmp_node.nil?
        return index if tmp_node.value == value

        tmp_node = tmp_node.next_node
        index += 1
      end
    end
    nil
  end

  def to_s
    return "" if @head.nil?

    tmp_node = @head
    list_string = ""
    until tmp_node.nil?
      list_string += "( #{tmp_node.value} ) -> "
      tmp_node = tmp_node.next_node
    end

    "#{list_string} nil"
  end

  def insert_at(index, *values)
    raise IndexError if index.negative? || index >= size

    tmp_node = @head
    values.each do |value|
      if index.zero?
        prepend(value)
      else
        (index - 1).times do
          tmp_node = tmp_node.next_node
        end
        # Change the link of the node before the given index to a new node
        # and assign the original next_node to the new node
        tmp_node.next_node = Node.new(value, tmp_node.next_node)
      end
    end
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
end
