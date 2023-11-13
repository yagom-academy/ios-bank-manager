//
//  CustomerQueue.swift
//  BankManagerUIApp
//
//  Created by Kiseok on 11/13/23.
//

final class CustomerQueue<T> {
    private var queue: LinkedList<T> = LinkedList()
    
    var peek: T? {
        return queue.head?.data
    }
    
    var isEmpty:Bool {
        return queue.isEmpty
    }
    
    func enqueue(data: T) {
        queue.append(data: data)
    }
    
    @discardableResult
    func dequeue() -> T? {
        return isEmpty ? nil : queue.removeFirst()
    }
    
    func clear() {
        queue.removeAll()
    }
}
