//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by OneTool, Red on 2022/04/26.
//

final class Queue<T> {
    private var linkedList = LinkedList<T>()

    var isEmpty: Bool {
        return linkedList.isEmpty
    }

    var peek: T? {
        return linkedList.peek
    }

    func clear() {
        return linkedList.removeAll()
    }

    func enQueue(data: T) {
        return linkedList.append(data: data)
    }

    func deQueue() -> T? {
        return linkedList.pop()
    }
}
