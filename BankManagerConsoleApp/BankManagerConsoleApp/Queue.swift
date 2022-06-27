//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by LeeChiheon on 2022/06/27.
//

import Foundation

class Queue<T> {
    private var linkedList = LinkedList<T>()
    
    var isEmpty: Bool {
        linkedList.isEmpty
    }
    
    var peek: T? {
        linkedList.peek
    }
    
    func enqueue(data: T) {
        linkedList.enqueue(data: data)
    }
    
    func dequeue() -> T? {
        return linkedList.dequeue()
    }
    
    func clear() {
        linkedList.clear()
    }
}
