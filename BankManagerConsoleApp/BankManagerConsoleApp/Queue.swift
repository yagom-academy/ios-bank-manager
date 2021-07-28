//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 잼킹 on 2021/07/28.
//

import Foundation

struct Queue<T> {
    private var list = LinkedList<T>()
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    var peek: T? {
        list.first
    }
}
