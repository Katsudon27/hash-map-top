require_relative "hash_map"

test = HashMap.new

test.set("apple", "red")
test.set("banana", "yellow")
test.set("carrot", "orange")
test.set("dog", "brown")
test.set("elephant", "gray")
test.set("frog", "green")
test.set("grape", "purple")
test.set("hat", "black")
test.set("ice cream", "white")
test.set("jacket", "blue")
test.set("kite", "pink")
test.set("lion", "golden")

puts test.length

test.set("apple", "green")
test.set("dog", "black")

p test.entries

test.set("moon", "silver")

p test.entries

test.set("moon", "white")

p test.entries

puts test.get("dog")
puts test.has?("lion")
puts test.has?("abc")
puts test.remove("apple")
puts test.length
p test.keys
p test.values
p test.entries
test.clear
p test.entries
