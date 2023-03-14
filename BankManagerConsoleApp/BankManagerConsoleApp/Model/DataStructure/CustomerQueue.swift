//
//  CustomerQueue.swift
//  BankManagerConsoleApp
//
//  Created by Rowan, 릴라 on 2023/03/06.
//

protocol Queueable {
    associatedtype T
    
    func enqueue(_ data: T)
    func dequeue() -> T?

}

struct CustomerQueue<T>: Queueable {
    let list: LinkedList<T> = LinkedList()
    
    var isEmpty: Bool {
        return list.isEmpty
    }

    func enqueue(_ data: T) {
        list.append(data: data)
    }

    @discardableResult
    func dequeue() -> T? {
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
