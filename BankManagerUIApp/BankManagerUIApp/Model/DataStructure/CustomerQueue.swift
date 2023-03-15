//
//  CustomerQueue.swift
//  BankManagerConsoleApp
//
//  Created by Rowan, 릴라 on 2023/03/06.
//

protocol Queueable {
    associatedtype T
    
    var list: LinkedList<T> { get }
    
    var isEmpty: Bool { get }

    mutating func enqueue(_ data: T)

    @discardableResult
    mutating func dequeue() -> T?

    func clear()

    @discardableResult
    func peek() -> T?
}

extension Queueable {
    var isEmpty: Bool {
        return list.isEmpty
    }

    mutating func enqueue(_ data: T) {
        list.append(data: data)
    }

    @discardableResult
    mutating func dequeue() -> T? {
        return list.removeFirst()
    }

    func clear() {
        list.clear()
    }

    @discardableResult
    func peek() -> T? {
        return list.headData
    }
}

protocol CustomerQueueable : Queueable where T == Customer { }

struct CustomerQueue: CustomerQueueable {
    let list: LinkedList<Customer> = LinkedList()
}
