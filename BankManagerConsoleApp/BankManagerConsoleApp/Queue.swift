//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by OneTool, Red on 2022/04/26.
//

struct Queue<T> {
    var linkedList = LinkedList<T>()

    var isEmpty: Bool {
        return linkedList.isEmpty
    }

    var peek: T? {
        return linkedList.peek
    }

    mutating func clear() {
        return linkedList.removeAll()
    }

    mutating func enQueue(data: T) {
        return linkedList.append(data: data)
    }

    mutating func deQueue() -> T? {
        return linkedList.pop()
    }
}
