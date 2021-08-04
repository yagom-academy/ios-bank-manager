//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 박태현 on 2021/07/27.
//

import Foundation

struct Queue<Type> {
    private let linkedList = LinkedList<Type>()
    var isEmpty: Bool {
        return linkedList.isEmpty
    }
    var length: Int {
        var count = 0
        var node = linkedList.head
        
        repeat {
            count += 1
            node = node?.next
        } while node != nil
        
        return count
    }
    
    func enqueue(value: Type) {
        linkedList.append(value: value)
    }
    
    func dequeue() -> Type? {
        let headValue = linkedList.head?.value
        linkedList.remove(target: linkedList.head)
        return headValue
    }
        
    func peek() -> Type? {
        return linkedList.head?.value
    }
    
    init(value: Type) {
        self.enqueue(value: value)
    }
    
    init() {
        
    }
}
