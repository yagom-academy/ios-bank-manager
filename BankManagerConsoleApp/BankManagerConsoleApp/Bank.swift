//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Jun Bang on 2021/12/24.
//

import Foundation

struct Client {
    
}

struct BankClerk {
    
}

struct Bank {
    private var clientQueue: WaitingQueue<Client>
    private var clerkQueue: WaitingQueue<BankClerk>
    private var totalWorkingTime: Double
}
