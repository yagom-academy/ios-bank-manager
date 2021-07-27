//
//  BankManagerQueue.swift
//  BankManagerConsoleApp
//
//  Created by 김준건 on 2021/07/27.
//

import Foundation

struct BankManagerQueue<T> {
    private var linkedList = LinkedList<T>()
    
    func dequeue() -> T? {
        let deletedNode = linkedList.removeFirst()
        return deletedNode?.data
    }
    
    func enqueue(data: T) {
        linkedList.append(data: data)
    }
    
    func clear() {
        linkedList.removeAll()
    }
    
    func peek() -> T? {
        return linkedList.peekFirst()?.data
    }
    
    var isEmpty: Bool {
        linkedList.isEmpty
    }
}
