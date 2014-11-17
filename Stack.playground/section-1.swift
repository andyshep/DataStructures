// Stack
//
// Basic Operations
//
// push(value) -- Pushes a new value onto the Stack, at the top
// pop(value) -- Pops a value off the top of the Stack
// peek(value) -- Return the value off the top of the Stack, without Popping

class Stack<T: Equatable> {
    var items: [T]? = []
    
    func push(value:T) {
        items?.append(value)
    }
    
    func pop() -> T? {
        if let value = self.peek() {
            items?.removeLast()
            return value
        }
        
        return nil
    }
    
    func peek() -> T? {
        if let value = items?.last {
            return value
        }
        
        return nil
    }
}

var stack = Stack<Int>()

stack.push(10)
stack.push(20)
stack.push(30)

stack.peek()
stack.pop()

