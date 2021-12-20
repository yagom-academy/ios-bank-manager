import Foundation

struct CustomerQueue<T> {
    var linkedList: LinkedList = LinkedList<T>()
    
    mutating func enqueue(_ element: T) {
        linkedList.append(element)
    }
    
    mutating func dequeue() -> T? {
        linkedList.removeLast()
    }
}
