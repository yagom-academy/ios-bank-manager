//
//  waitingQueue.swift
//  BankManagerConsoleApp
//
//  Created by Yunhwa on 2021/04/27.
//

import Foundation

struct WaitingQueue {
    private(set) var queue: [Customer] = []
    var first: Customer? {
        return queue.first
    }
    
    func enqueue(customer: Customer) {
        queue.append(customer)
    }

    mutating func dequeue() {
        queue.removeFirst()
    }
}
