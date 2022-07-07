//
//  QueueWithLinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 재재, 나별 on 2022/06/28.
//

import Foundation

struct QueueWithLinkedList<T> {
    private var list: LinkedList<T>
    
    init(list: LinkedList<T> = LinkedList<T>()) {
        self.list = list
    }
}

extension QueueWithLinkedList: Queue {
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    var isNotEmpty: Bool {
        return list.isNotEmpty
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
