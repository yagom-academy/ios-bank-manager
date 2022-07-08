//
//  BankItemQueue.swift
//  BankManagerConsoleApp
//
//  Created by unchain, baekgom on 2022/06/27.
//

import Foundation

struct BankItemQueue<T> {
    var linkedList = LinkedList<T>()
    
    var isEmpty: Bool {
        return linkedList.isEmpty
    }
    
    var peek: Node<T>? {
        return linkedList.peek
    }
    
    var count: Int {
        linkedList.count
    }
    
    mutating func enQueue(_ data: T) {
        linkedList.append(data: data)
    }
    
    mutating func deQueue() -> T? {
        return linkedList.removeFirst()
    }
    
    mutating func clear() {
        linkedList.removeAll()
    }
}
