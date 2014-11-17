// LinkedLists
//
// Basic Operations
//
// insert(value) -- Inserts a new value into at the end List, by creating a new Node object
// insertHead(value) -- Inserts a new value at the start of the List
// remove(value) -- Removes the first Node matching value from the List

class Node<T: Equatable> {
    var value: T
    var next: Node? = nil
    
    init(_ value:T) {
        self.value = value
    }
}

class LinkedList<T: Equatable> : Printable {
    var head: Node<T>? = nil
    
    func insert(value:T) {
        if head == nil {
            head = Node(value)
        } else {
            var lastNode = head
            while lastNode?.next != nil {
                lastNode = lastNode?.next
            }
            
            let newNode = Node(value)
            lastNode?.next = newNode
        }
    }
    
    func insertHead(value:T) {
        if head == nil {
            self.head = Node(value)
        } else {
            let newNode = Node(value)
            newNode.next = head
            self.head = newNode
        }
    }
    
    func remove(value:T) {
        if head != nil {
            var node = head
            var previousNode: Node<T>? = nil
            while node?.value != value && node?.next != nil {
                previousNode = node
                node = node?.next

            }
            
            if node?.value == value {
                if node?.next != nil {
                    previousNode?.next = node?.next
                }
                else {
                    previousNode?.next = nil
                }
            }
        }
    }
    
    var description : String {
        var node = head
        var description = "\(node!.value)"
        while node?.next != nil {
            node = node?.next
            description += " \(node!.value)"
        }
        return description
    }
}

var linkedList = LinkedList<Int>()

linkedList.insert(10)
linkedList.insert(20)

linkedList.description

linkedList.insertHead(99)

linkedList.description

linkedList.remove(20)
linkedList.remove(10)

linkedList.description

var linkedList2 = LinkedList<String>()

linkedList2.insert("Fred")
linkedList2.insert("Jed")
linkedList2.insert("Ned")
linkedList2.insert("Ted")
linkedList2.insert("Red")

linkedList2.remove("Ned")

linkedList2.description
