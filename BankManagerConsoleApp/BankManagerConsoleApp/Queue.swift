//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by Eddy, dudu on 2022/04/25.
//

import Foundation

final class Queue<Element> {
    let list: LinkedList<Element>

    init(list: LinkedList<Element>) {
        self.list = list
    }

    var isEmpty: Bool {
        return list.isEmpty
    }

    var peek: Element? {
        return list.peek
    }

    func enqueue(_ element: Element) {
        return list.append(element)
    }

    func dequeue() -> Element? {
        return list.removeFirst()
    }

    func clear() {
        list.clear()
    }
}
