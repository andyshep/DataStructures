// HashTable
//
// Basic Operations
//
// value(key) -> Int
// setValue(value, key)

import Foundation

class Node {
    var key: Int
    var value: Int
    
    init(key:Int, value:Int) {
        self.key = key
        self.value = value
    }
}

class HashTable {
    private let size = 1021
    
    var table = NSMutableArray()
    
    init() {
        for index in 0..<size {
            table[index] = NSNull()
        }
    }
    
    func value(key:Int) -> Int {
        var hash = key % size
        
        while (table[hash] is Node && (table[hash] as Node).key != key) {
            hash = (hash + 1) % size
        }
        
        if (table[hash] is NSNull) {
            return NSNotFound
        }
        else {
            if let node = table[hash] as? Node {
                return node.value
            }
            
            return NSNotFound
        }
    }
    
    func setValue(value:Int, forKey key:Int) {
        var hash = key % size
        
        while (table[hash] is Node && (table[hash] as Node).key != key) {
            hash = (hash + 1) % size
        }
        
        table[hash] = Node(key: key, value: value)
    }
}

var hashTable = HashTable()

hashTable.setValue(1044, forKey: 10)
hashTable.setValue(23023, forKey: 20)
hashTable.setValue(2088, forKey: 30)

let value = hashTable.value(30)
println(value)
