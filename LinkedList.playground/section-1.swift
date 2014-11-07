// LinkedLists
//
// Basic Operations
//
// insert(value) -- Inserts a new value into at the end List, by creating a new Node object
// insertHead(value) -- Inserts a new value at the start of the List
// remove(value) -- Removes the first Node matching value from the List

import Foundation

class Node<T: Equatable> {
    var value: T
    var next: Node? = nil
    
    init(_ value:T) {
        self.value = value
    }
}

class LinkedList<T: Equatable> {
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
                    previousNode?.next = nil
                }
                else {
                    previousNode?.next = node?.next
                }
            }
        }
    }
    
    func describe() {
        var node = head
        while node?.next != nil {
            print("\(node!.value) ")
            node = node?.next
        }
        
        println(node!.value)
        println("-----")
    }
}

var linkedList = LinkedList<Int>()

linkedList.insert(10)
linkedList.insert(20)

linkedList.describe()

linkedList.insertHead(99)

linkedList.describe()

linkedList.remove(20)
linkedList.remove(10)

linkedList.describe()
