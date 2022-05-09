//
//  Queue.swift
//  BankManagerUIApp
//
//  Created by 박세웅 on 2022/05/05.
//

import Foundation

struct Queue<T> {
    private let list = LinkedList<T>()
    var isEmpty: Bool {
        return list.isEmpty
    }

    func enqueue(_ element: T) {
        list.append(element)
    }

    func dequeue() -> T? {
        return list.removeFirst()
    }

    func clear() {
        list.clear()
    }

    func peek() -> T? {
        return list.head?.data
    }
}
