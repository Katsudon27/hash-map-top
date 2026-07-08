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

  private

  def find_bucket(key)
    bucket_index = hash(key) % @capacity
    raise IndexError if bucket_index.negative? || bucket_index >= @buckets.length

    @buckets[bucket_index]
  end
end
