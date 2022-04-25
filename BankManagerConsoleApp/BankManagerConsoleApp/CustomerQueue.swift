import Foundation

struct CustomerQueue<T> {
    private var list = LinkedList<T>()
    
    func enqueue(element: T) {
        list.append(element)
    }
    
    func dequeue() -> T? {
        return list.removeHead()
    }
    
    func clear() {
        list.clear()
    }
    
    func peek() -> T? {
        return list.head?.data
    }
    
    func isEmpty() -> Bool {
        return list.isEmpty
    }
}
