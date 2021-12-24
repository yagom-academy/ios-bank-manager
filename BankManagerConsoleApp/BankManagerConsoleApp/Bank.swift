//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Jun Bang on 2021/12/24.
//

import Foundation

struct Ticket {
    let number: Int
}

struct Client {
    let orderTicket: Ticket
    let taskDuration = 0.7
}

struct BankClerk {
    var isAvailable = true
}

struct Bank {
    private var clientQueue = WaitingQueue<Client>()
    private var clerkQueue = WaitingQueue<BankClerk>()
    private var totalClientCount: Int = 0
    private var totalWorkingTime: Double = 0
    
    init(numberOfClerks: Int) {
        (0..<numberOfClerks).forEach { _ in
            let clerk = BankClerk(isAvailable: true)
            clerkQueue.enqueue(clerk)
        }
    }
}

