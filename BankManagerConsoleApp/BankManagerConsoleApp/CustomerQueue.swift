//
//  CustomerQueue.swift
//  BankManagerConsoleApp
//
//  Created by 변재은 on 2022/06/28.
//

import Foundation

struct CustomerQueue<T> {
    private var list: LinkedList<T>
    
    init(list: LinkedList<T> = LinkedList<T>()) {
        self.list = list
    }
}

extension CustomerQueue: Queue {
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    var peek: T? {
        return list.peek
    }
    
    mutating func enqueue(_ element: T) {
        list.append(element)
    }
    
    mutating func dequeue() -> T? {
        return list.pop()
    }
    
    mutating func clear() {
        list.removeAll()
    }
}
