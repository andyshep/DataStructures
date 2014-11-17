// HashTable
//
// Basic Operations
//
// value(key:Int) -> Either<T> -- Returns an Either enum associated with the key.
// setValue(value:T, forKey key:Int) -- Associates a value with a given key.

enum Either<T: Equatable> : Printable {
    case None
    case Some(Node<T>)
    
    var description: String {
        switch self {
            case .Some(let obj):
                return "\(obj.value)"
            case .None:
                return "Either<T>: Nothing, no value."
        }
    }
}

class Node<T: Equatable> {
    var key: Int
    var value: T
    
    init(key:Int, value:T) {
        self.key = key
        self.value = value
    }
}

class HashTable<T: Equatable> {
    var table = [Either<T>]()
    
    private let size = 1021
    
    init() {
        for index in 0..<size {
            table.append(.None)
        }
    }
    
    func value(key:Int) -> Either<T> {
        let hash = hashForKey(key)
        var value = table[hash]
        switch value {
        case .Some(let obj):
            return .Some(obj)
        case .None:
            return .None
        }
    }
    
    func setValue(value:T, forKey key:Int) {
        let node = Node(key: key, value: value)
        let hash = hashForKey(key)
        table[hash] = .Some(node)
    }
    
    func hashForKey(key:Int) -> Int {
        let hash = key % size
        return hashForKey(key, usingLinearProbeHash: hash)
    }
    
    func hashForKey(key:Int, usingLinearProbeHash hash:Int) -> Int {
        let value = table[hash]
        switch value {
        case .Some(let obj):
            if obj.key == key {
                return hash
            }
            else {
                var newHash = (hash + 1) % size
                return hashForKey(key, usingLinearProbeHash: newHash)
            }
        case .None:
            return hash
        }
    }
}

var hashTable = HashTable<Int>()

hashTable.setValue(1010101, forKey: 88)
hashTable.setValue(2099823, forKey: 42)

hashTable.value(88).description
hashTable.value(42).description
hashTable.value(101).description

var hashTable2 = HashTable<String>()

hashTable2.setValue("Garfield", forKey: 99)

hashTable2.value(99).description
hashTable2.value(404).description

hashTable2.value(99).description
hashTable2.value(404).description
