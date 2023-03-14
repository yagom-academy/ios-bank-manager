//
//  CustomerQueue.swift
//  BankManagerConsoleApp
//
//  Created by Rowan, 릴라 on 2023/03/06.
//

class Queue<T> {
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

final class CustomerQueue: Queue<Customer> { }
