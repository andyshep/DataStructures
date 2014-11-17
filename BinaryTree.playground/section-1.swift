// Tree
//
//

class Node<T: Comparable> {
    var value: T
    var left: Node?
    var right: Node?
    
    init(value:T) {
        self.value = value
        
        self.left = nil
        self.right = nil
    }
}

class BinarySearchTree<T: Comparable> : Printable {
    var root: Node<T>?
    
    init() {
        self.root = nil
    }
    
    convenience init(value:T) {
        self.init()
        self.root = Node(value: value)
    }
    
    func insert(value:T) {
        if var root = self.root {
            self.insert(value, node: &root)
        }
        else {
            self.root = Node(value: value)
        }
    }
    
    func insert(value:T, inout node: Node<T>) {
        if (node.value > value) {
            if var left = node.left {
                insert(value, node: &left);
            }
            else {
                node.left = Node(value: value)
            }
        }
        else if (node.value < value) {
            if var right = node.right {
                insert(value, node: &right);
            }
            else {
                node.right = Node(value: value)
            }
        }
        else {
            println("duplicate value: \(value)")
        }
    }
    
    func remove(value:T) {
        // TODO: implement
    }
    
    var description : String {
        return Traverser.inorderTraversal(self.root)
    }
}

class Traverser<T: Comparable> {
    class func preorderTraversal(node:Node<T>?) -> String {
        var string = ""
        if node != nil {
            string += "\(node!.value) "
            string += preorderTraversal(node?.left)
            string += preorderTraversal(node?.right)
        }
        
        return string
    }
    
    class func postorderTraversal(node:Node<T>?) -> String {
        var string = ""
        if node != nil {
            string += preorderTraversal(node?.left)
            string += preorderTraversal(node?.right)
            string += "\(node!.value) "
        }
        
        return string
    }
    
    class func inorderTraversal(node:Node<T>?) -> String {
        var string = ""
        if node != nil {
            string += preorderTraversal(node?.left)
            string += "\(node!.value) "
            string += preorderTraversal(node?.right)
        }
        
        return string
    }
}

var bst = BinarySearchTree<Int>()

bst.insert(10)
bst.insert(13)
bst.insert(7)

bst.insert(20)
bst.insert(45)

bst.insert(1)
bst.insert(1)

bst.description

Traverser.preorderTraversal(bst.root)
Traverser.postorderTraversal(bst.root)
Traverser.inorderTraversal(bst.root)
