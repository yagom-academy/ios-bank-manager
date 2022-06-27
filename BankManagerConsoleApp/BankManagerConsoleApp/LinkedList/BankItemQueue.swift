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
    
    mutating func enQueue(_ data: T) {
        linkedList.append(data: data)
    }
}
