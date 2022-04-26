//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by OneTool, Red on 2022/04/26.
//

final class Queue<T> {
    var linkedList = LinkedList<T>()

    var isEmpty: Bool {
        return linkedList.isEmpty
    }

    var peek: T? {
        return linkedList.first
    }

    func clear() {
        return linkedList.removeAll()
    }

    func enQueue(data: T) {
        return linkedList.append(data: data)
    }

    func deQueue() -> T? {
        return linkedList.last
    }
}
