# hash-map-top

This is a project part of the Odin Project curriculum where the main objective is to implement a Hash Map as well as operations associated with the data structure.

# Objects and Classes

1. `HashMap` - represents the Hash Map data structure and contains implementations for each operation.
2. `LinkedList` - represents the data structure used within each bucket and contains methods that support operations of HashMap
3. `Node` - represents a node object as part of the linked list, and is used to store key, value pairs. 

# Implemented Operations

1. `#hash(key)` - converts and returns the key as a hash code.
2. `#set(key, value)` - adds a key-value pair into the corresponding bucket. If a key already exists, the previous value will be overwritten.
3. `#get(key)` - returns the value associated with the given key.
4. `#has?(key)` - returns true/false based on whether the key exists within the hash map.
5. `#remove(key)` - removes the key-value pair based on the provided key and return its value.
6. `#length` - returns the number of key-value pairs in the hash map.
7. `#clear` - removes all entries in the hash map.
8. `#keys` - returns an array of keys stored in the hash map.
9. `#values` - returns an array of values stored in the hash map.
10. `#entries` - returns an array of all key-value pairs stored in the hash map.
