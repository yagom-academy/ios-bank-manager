//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by musun129 on 2021/04/30.
//

import Foundation

class Bank {
    var counters: [Teller] = []
    let customerQueue: CustomerQueue = CustomerQueue(name: "고객 대기열")
    let notificationBoard: NotificationBoard = NotificationBoard()

    class NotificationBoard {}

    class Teller {}

    struct CustomerQueue {
        private var queue: [Customer] = []
        let name: String

        init(name: String) {
            self.name = name
        }

        mutating func enqueue(customer: Customer) {
            queue.append(customer)
        }

        mutating func dequeue() -> Customer? {
            return queue.removeFirst()
        }
    }

    class Customer {}
}
