import Foundation

struct Queue<T: Customer> {
    private let list = LinkedList<T>()
    var isEmpty: Bool {
        return list.isEmpty
    }

    func enqueue(_ element: T) {
        list.append(element)
    }
    
    func dequeue() -> T? {
        return list.removeFirst()
    }
    
    func clear() {
        list.clear()
    }
    
    func peek() -> T? {
        return list.head?.data
    }
}
