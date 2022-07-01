//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 예톤, 웡빙 on 2022/06/30.
//

import Foundation

protocol Queue {
    associatedtype Element
    var queue: LinkedList<Element> { get }
    var isEmpty: Bool { get }
    var peek: Element? { get }
    var count: Int { get }
    var currentList: [Element?] { get }
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
    var currentList: [Element?] {
        queue.currentList
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

