//
//  CustomerQueue.swift
//  BankManagerConsoleApp
//
//  Created by Rowan, 릴라 on 2023/03/06.
//

struct CustomerQueue<T>: Queue {
    let list: LinkedList<T> = LinkedList()
}

protocol Queue {
    associatedtype T
    
    var list: LinkedList<T> { get }
    
}

extension Queue {
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
