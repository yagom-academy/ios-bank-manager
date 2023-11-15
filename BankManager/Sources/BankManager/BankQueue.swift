//
//  File.swift
//  
//
//  Created by hyunMac on 11/13/23.
//

import Foundation

struct BankQueue<T> {
    private let list = LinkedList<T>()
    
    func enqueue(data: T) {
        list.append(data: data)
    }
    
    @discardableResult
    func dequeue() -> T? {
        list.removeFirst()
    }
    
    func clear() {
        list.removeAll()
    }
    
    func peek() -> T? {
        list.showFirstNode()
    }
    
    func isEmpty() -> Bool {
        list.count() == 0
    }
}
