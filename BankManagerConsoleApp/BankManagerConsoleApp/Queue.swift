//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by ehd on 2021/07/28.
//

import Foundation

class Queue<T> {
    var linkedList: LinkedList<T> = LinkedList<T>()
    
    func isEmpty() -> Bool {
        return linkedList.isEmpty
    }
    
    func enqueue(data: T) {
        return self.linkedList.append(Node<T>(data: data))
    }
    
    func dequeue() {
        self.linkedList.removeFirst()
    }
    
    func clear() {
        self.linkedList.removeAll()
    }
    
    func peek() -> Node<T>? {
        return self.linkedList.head
    }
}
