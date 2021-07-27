//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 박태현 on 2021/07/27.
//

import Foundation

class Queue<Type> {
    private var queue: LinkedList<Type>
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    func enqueue(value: Type) {
        queue.append(value: value)
    }
    
    func dequeue() -> Type? {
        let result = queue.head?.value
        queue.remove(node: queue.head)
        return result
    }
    
    func clear() {
        queue.clear()
    }
    
    func peek() -> Type? {
        return queue.head?.value
    }
    
    init() {
        queue = LinkedList()
    }
    
    init(initialValue: Type) {
        queue = LinkedList()
        self.enqueue(value: initialValue)
    }
}

extension Queue: CustomStringConvertible {
    var description: String {
        return queue.description
    }
}
