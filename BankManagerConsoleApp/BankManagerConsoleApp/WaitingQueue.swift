//
//  waitingQueue.swift
//  BankManagerConsoleApp
//
//  Created by Yunhwa on 2021/04/27.
//

struct WaitingQueue {
    private(set) var queue: [Customer] = []
    var first: Customer? {
        return queue.first
    }
    
    mutating func enqueue(customer: Customer) -> Result<Customer, Error> {
        queue.append(customer)
        return .success(customer)
    }

    mutating func dequeue() -> Result<Customer, Error> {
        if queue.isEmpty {
            return .failure(Error)
        } else {
            return .success(queue.removeFirst())
    }
}
