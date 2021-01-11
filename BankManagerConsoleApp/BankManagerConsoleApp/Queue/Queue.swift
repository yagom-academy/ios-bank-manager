//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by Wonhee on 2021/01/05.
//

import Foundation

struct Queue<T> {
    private var list = [T]()
    
    var size: Int {
        return list.count
    }
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    var front: T? {
        return list.first
    }
    
    mutating func enqueue(_ item: T) {
        list.append(item)
    }
    
    mutating func dequeue() -> T? {
        return list.removeFirst()
    }
    
    mutating func removeAll() {
        list.removeAll()
    }
}
