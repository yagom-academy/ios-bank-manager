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
        let headValue = self.head?.value
        self.remove(target: self.head)
        return headValue
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
