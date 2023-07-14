//
//  CustomerWatingQueue.swift
//  BankManagerConsoleApp
//
//  Created by karen on 2023/07/11.
//

struct Queue<Element> {
    private var queue = LinkedList<Element>()
    var isEmpty: Bool { return queue.isEmpty }
    var peek: Element? { return queue.peek }

    mutating func enqueue(_ element: Element) {
        queue.append(element)
    }
    
    mutating func dequeue() -> Element? {
        return queue.removeFirst()
    }
    
    mutating func clear() {
        queue.removeAll()
    }
}

