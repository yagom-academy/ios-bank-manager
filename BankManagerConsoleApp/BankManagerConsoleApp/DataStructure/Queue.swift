//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by mmim, malrang.
//

import Foundation

struct Queue<List: Listable> {
    private var list: List
    
    init(list: List) {
        self.list = list
    }
    
    var count: Int {
        return list.count
    }
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    var peek: List.Element? {
        return list.first
    }
    
    mutating func enqueue(_ value: List.Element) {
        list.append(value: value)
    }
    
    mutating func dequeue() -> List.Element? {
        return list.removeFirst()
    }
    
    mutating func clear() {
        list.removeAll()
    }
}
