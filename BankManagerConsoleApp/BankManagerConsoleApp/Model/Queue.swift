//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 이원빈 on 2022/06/30.
//

import Foundation

protocol Queue {
    associatedtype Element
    var queue: LinkedList<Element> { get }
    var isEmpty: Bool { get }
    var peek: Element? { get }
    var count: Int { get }
    func enqueue(data: Element)
    func dequeue() -> Element?
    func clear()
}

extension Queue {
    var isEmpty: Bool {
        return queue.isEmpty
    }
    var peek: Element? {
        queue.peek
    }
    var count: Int {
        queue.count
    }

    func enqueue(data: Element) {
        queue.append(data: data)
    }

    @discardableResult
    func dequeue() -> Element? {
        queue.removeFirst()
    }

    func clear() {
        queue.clear()
    }
}

