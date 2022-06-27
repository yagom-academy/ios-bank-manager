//
//  BankItemQueue.swift
//  BankManagerConsoleApp
//
//  Created by unchain, baekgom on 2022/06/27.
//

import Foundation

struct BankItemQueue<T> {
    var linkedList = LinkedList<T>()
    
    mutating func enQueue(_ data: T) {
        linkedList.append(data: data)
    }
}
