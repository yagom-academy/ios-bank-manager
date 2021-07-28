//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 박태현 on 2021/07/27.
//

import Foundation

class Queue<Type>: LinkedList<Type> {
    
    func enqueue(value: Type) {
        self.append(value: value)
    }
    
    func dequeue() -> Type? {
        defer {
            self.remove(node: self.head)
        }
        return self.head?.value
    }
        
    func peek() -> Type? {
        return self.head?.value
    }
    
    init(initialValue: Type) {
        super.init()
        self.enqueue(value: initialValue)
    }
    
    override init() {
        super.init()
    }
}
