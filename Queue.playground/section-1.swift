// Queue
//
// Basic Operations
// 
// enqueue(value) - Inserts a new value at the end of the queue
// dequeue() - Dequeue and return the value at the front of the queue

class Queue<T: Equatable> : Printable {
    var items: [T]? = []
    
    func enqueue(value:T) {
        items?.append(value)
    }
    
    func dequeue() -> T? {
        if items?.count > 0 {
            let obj = items?.removeAtIndex(0)
            return obj
        }
        else {
            return nil
        }
    }
    
    var isEmpty: Bool {
        if let items = self.items {
            return items.isEmpty
        }
        else {
            return true
        }
    }
    
    var description : String {
        var description = ""
        if let tempItems = self.items {
            while !(self.isEmpty) {
                description += "\(self.dequeue()!) "
            }
            self.items = tempItems
        }
        return description
    }
}

var queue = Queue<Int>()

queue.enqueue(10)
queue.enqueue(20)
queue.enqueue(30)
queue.enqueue(40)

queue.description

queue.dequeue()
queue.dequeue()
queue.dequeue()

queue.description
