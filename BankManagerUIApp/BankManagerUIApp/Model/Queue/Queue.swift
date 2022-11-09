//  BankManagerConsoleApp - Queue.swift
//  Created by Ayaan/Dragon/som on 2022/10/31.
//  Copyright © yagom academy. All rights reserved.

protocol Queue {
    associatedtype Element where Element: Equatable
    var linkedList: LinkedList<Element> { get set }
    var isEmpty: Bool { get }
    var first: Element? { get }
    var last: Element? { get }
    
    mutating func enqueue(_ data: Element)
    mutating func dequeue() -> Element?
    mutating func clear()
    func peek() -> Element?
}

extension Queue {
    var isEmpty: Bool {
        return linkedList.isEmpty
    }
    var first: Element? {
        return linkedList.first
    }
    var last: Element? {
        return linkedList.last
    }
    
    mutating func enqueue(_ data: Element) {
        linkedList.append(data)
    }
    mutating func dequeue() -> Element? {
        return linkedList.removeFirst()
    }
    mutating func clear() {
        linkedList.removeAll()
    }
    func peek() -> Element? {
        return first
    }
}
