//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by ehd on 2021/07/28.
//

import Foundation

struct Queue<T> {
    
    var linkedList: LinkedList<T> = LinkedList<T>()
    
    func isEmpty() -> Bool {
        return linkedList.isEmpty
    }
    
    mutating func enqueue(data: T) {
        return self.linkedList.append(Node<T>(data: data))
    }
    
    mutating func dequeue() -> Node<T>? {
        return self.linkedList.removeFirst()
    }
    
    mutating func clear() {
        self.linkedList.removeAll()
    }
    
    mutating func peek() -> Node<T>? {
        return self.linkedList.head
    }
}
