//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 잼킹 on 2021/07/28.
//

import Foundation

struct Queue<T> {
    private var list = LinkedList<T>()
    
    var isEmpty: Bool {
        list.isEmpty
    }
    
    var peek: T? {
        list.first
    }
    
    func enqueue(data: T) {
        list.addLast(data: data)
    }
    
    func dequeue() -> T? {
        list.removeFirst()
    }
    
    func clear() {
        list.removeAll()
    }
}
