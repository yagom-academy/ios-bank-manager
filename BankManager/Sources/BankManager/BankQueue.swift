//
//  BankQueue.swift
//  
//
//  Created by Gray, Gama on 2024/03/18.
//

struct BankQueue<T> {
    private var list = BankLinkedList<T>()
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    mutating func enqueue(element: T) {
        list.append(element: element)
    }
    
    mutating func dequeue() -> T? {
        return list.removeFirst()
    }
    
    func peek() -> T? {
        return list.first
    }
    
    mutating func clear() {
        list.removeAll()
    }
}
