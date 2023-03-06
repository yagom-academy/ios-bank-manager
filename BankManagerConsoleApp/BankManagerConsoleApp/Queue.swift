//  BankManagerConsoleApp - Queue.swift
//  created by vetto, kokkilE on 2023/03/06

struct Queue<T> {
    private(set) var linkedList = LinkedList<T>()
    
    var isEmpty: Bool {
        return linkedList.isEmpty
    }
    
    mutating func enqueue(_ data: T) {
        linkedList.append(data)
    }
    
    mutating func dequeue() -> T? {
        return linkedList.removeFirst()
    }
    
    mutating func clear() {
        linkedList.clear()
    }
    
    func peek() -> T? {
        guard let head = linkedList.head else {
            return nil
        }
        
        return head.data
    }
}
