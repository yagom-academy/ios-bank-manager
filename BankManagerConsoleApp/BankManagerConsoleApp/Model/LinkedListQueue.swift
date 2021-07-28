//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 김태영 on 2021/07/27.
//

import Foundation

struct LinkedListQueue<T> {
    
    let list = LinkedList<Int>()
    
    var peek: Int? {
        return list.head?.value
    }
    
    func enqueue(watingNumber: Int) {
        list.append(value: watingNumber)
    }
    
    func dequeue() -> Int? {
        return list.removeFirst()
    }
    
    func clear() {
        list.removeAll()
    }
    
    func isEmpty() -> Bool {
        return list.headIsEmpty
    }
}
