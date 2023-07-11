//
//  CustomerWatingQueue.swift
//  BankManagerConsoleApp
//
//  Created by karen on 2023/07/11.
//

struct CustomerWatingQueue<Element> {
    private var queue = LinkedList<Element>()
    var isEmpty: Bool { return queue.isEmpty }
    var peek: Element? { return queue.peek }

    mutating func enqueue(_ value: Element) {
        queue.append(value)
    }
    
    mutating func dequeue() -> Element? {
        return queue.removeFirst()
    }
    
    mutating func clear() {
        queue.clear()
    }
}

