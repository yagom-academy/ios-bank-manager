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
    
    mutating func Enqueue(node: Node<T>) {
        return self.linkedList.append(node)
    }
    
    mutating func dequeue() {
        self.linkedList.removeFirst()
    }
    
    mutating func clear() {
        self.linkedList.removeAll()
    }
    
    mutating func peek() -> Node<T>? {
        return self.linkedList.head
    }
}
