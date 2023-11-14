//
//  CustomerQueue.swift
//  BankManagerConsoleApp
//
//  Created by jyubong, Toy on 11/14/23.
//

import Foundation

struct CustomerQueue<T> {
    private var list = LinkedList<T>()
    
    func enqueue(_ element: T) {
        list.append(value: element)
    }
    
    func dequeue() -> T? {
        return list.removeFirst()
    }
}
