//
//  ClientQueue.swift
//  BankManagerConsoleApp
//
//  Created by minsson, Derrick on 2022/06/27.
//

struct ClientQueue<Element> {
    private let queue = LinkedList<Element>()
    
    var peek: Element? {
        return queue.head?.data ?? nil
    }
}

// MARK: - Internal Actions

extension ClientQueue: Queue {
    mutating func enqueue(_ data: Element) {
        queue.append(Node(data))
    }
    
    func dequeue() -> Node<Element>? {
        return queue.isEmpty() == true ? nil : queue.removeFirst()
    }
    
    func isEmpty() -> Bool {
        return queue.head == nil ? true : false
    }
    
    func clear() {
        queue.removeAll()
    }
}

