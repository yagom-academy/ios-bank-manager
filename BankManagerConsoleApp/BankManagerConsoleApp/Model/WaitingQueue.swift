//
//  WaitingQueue.swift
//  BankManagerUIApp
//
//  Created by Sunwoo on 2021/12/21.
//

import Foundation

struct WaitingQueue<T> {
    private var list = LinkedList<T>()
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    mutating func enqueue(_ item: T) {
        list.append(item)
    }
    
    mutating func dequeue() -> T? {
        let firstItem = list.removeFirst()
        
        return firstItem
    }
    
    mutating func clear() {
        list.removeAll()
    }
    
    func peek() -> T? {
        let peekedNode = list.firstNode
        
        return peekedNode?.data
    }
}
