//
//  CustomerQueue.swift
//  BankManagerConsoleApp
//
//  Created by Rowan, 릴라 on 2023/03/06.
//

struct CustomerQueue<T> {
    private let list: LinkedList<T> = LinkedList()

    var isEmpty: Bool {
        return list.isEmpty
    }

    var count: Int {
        return list.count
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
