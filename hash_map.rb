require_relative "linked_list"

# A class that represents the Hash Map data structure
class HashMap
  def initialize
    @load_factor = 0.75
    @capacity = 16
    @buckets = Array.new(16) { LinkedList.new }
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
    hash_code
  end

  def set(key, value)
    expand_buckets if grow_buckets?

    bucket = find_bucket(key)

    if bucket.contains?(key)
      bucket.update_node_value(key, value)
    else
      bucket.append(key, value)
    end
  end

  def get(key)
    bucket = find_bucket(key)
    bucket.find_value(key)
  end

  def has?(key)
    bucket = find_bucket(key)
    bucket.contains?(key)
  end

  def remove(key)
    bucket = find_bucket(key)
    bucket.remove_node(key)
  end

  def length
    @buckets.reduce(0) { |sum, bucket| sum + bucket.size }
  end

  def clear
    @buckets = Array.new(16) { LinkedList.new }
  end

  def keys
    keys = []
    @buckets.each do |bucket|
      keys += bucket.keys
    end
    keys
  end

  def values
    values = []
    @buckets.each do |bucket|
      values += bucket.values
    end
    values
  end

  def entries
    entries = []
    @buckets.each do |bucket|
      entries += bucket.entries
    end
    entries
  end

  private

  def find_bucket(key)
    bucket_index = hash(key) % @capacity
    raise IndexError if bucket_index.negative? || bucket_index >= @buckets.length

    @buckets[bucket_index]
  end

  def grow_buckets?
    @capacity * @load_factor < length + 1
  end

  def expand_buckets
    prev_entries = entries
    @capacity *= 2
    @buckets = Array.new(@capacity) { LinkedList.new }
    prev_entries.each do |entry|
      set(entry[0], entry[1])
    end
  end
end
