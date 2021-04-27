//
//  waitingQueue.swift
//  BankManagerConsoleApp
//
//  Created by Yunhwa on 2021/04/27.
//

struct WaitingQueue {
    private(set) var queue: [Customer]
    var first: Customer? {
        return queue.first
    }
    
    mutating func enqueue(_ customer: Customer) -> Result<Customer, WaitingQueueError> {
        queue.append(customer)
        return .success(customer)
    }

    mutating func dequeue() -> Result<Customer, WaitingQueueError> {
        if queue.isEmpty {
            return .failure(.queueIsEmpty)
        } else {
            return .success(queue.removeFirst())
        }
    }
    
    init(_ queue: [Customer] = []) {
        self.queue = queue
    }
}
