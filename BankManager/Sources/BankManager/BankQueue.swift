//
//  BankQueue.swift
//
//
//  Created by Danny, Prism on 3/19/24.
//

protocol Queueable {
    associatedtype T
    var isEmpty: Bool { get }
    var count: Int { get }
    var first: T? { get }
    var last: T? { get }
    func enqueue(element: T)
    func dequeue() -> T?
    func clear()
}

class BankQueue<T>: Queueable {
    let list = SinglyLinkedList<T>()
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    var count: Int {
        return list.count
    }
    
    var first: T?
    
    var last: T?
    
    func enqueue(element: T) {
        
    }
    
    func dequeue() -> T? {
        return nil
    }
    
    func clear() {
        
    }
    
}
