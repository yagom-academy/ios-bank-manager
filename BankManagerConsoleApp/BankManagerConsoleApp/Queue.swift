//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 이윤주 on 2021/07/27.
//

import Foundation

class Queue<Value> {
    let linkedList = LinkedList<Value>()
    
    func enqueue(_ value: Value) {
        linkedList.append(value)
    }
}
