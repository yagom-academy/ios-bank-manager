//
//  CustomerQueue.swift
//  BankManagerConsoleApp
//
//  Created by 수꿍, 브래드 on 2022/06/28.
//

import Foundation

struct CustomerQueue<T> {
    var linkedList: LinkedList<T>
    var peek: T?
    var isEmpty: Bool
    
    mutating func enqueue(data: T) {
        linkedList.append(data: data)
    }
    
    mutating func dequeue() -> T? {
        linkedList.pop()
    }
    
    mutating func clear() {
        linkedList.removeAll()
    }
}
