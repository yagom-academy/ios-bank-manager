//
//  CustomerQueue.swift
//  BankManagerUIApp
//
//  Created by Sunwoo on 2021/12/21.
//

import Foundation

struct CustomerQueue<T> {
    private var list = LinkedList<T>()
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    mutating func enqueue(_ item: T) {
        list.append(data: item)
    }
    
    mutating func dequeue() -> T? {
        let firstItem = list.removeFirst()
        
        return firstItem
    }
}
