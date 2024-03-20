//
//  BankQueue.swift
//
//
//  Created by Danny, Prism on 3/19/24.
//

protocol Queueable {
    associatedtype Element
    var isEmpty: Bool { get }
    var count: Int { get }
    var first: Element? { get }
    var last: Element? { get }
    func enqueue(element: Element)
    func dequeue() -> Element?
    func clear()
}

final class BankQueue<T>: Queueable {
    private let list = SinglyLinkedList<T>()
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    var count: Int {
        return list.count
    }
    
    var first: T? {
        return list.first
    }
    
    var last: T? {
        return list.last
    }
    
    func enqueue(element: T) {
        list.addLast(element: element)
    }
    
    func dequeue() -> T? {
        return list.removeFirst()
    }
    
    func clear() {
        list.clear()
    }
}
