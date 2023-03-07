//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by brody, christy, harry on 2023/03/07.
//

struct Bank {
    private let bankers: [Banker]
    private var customerQueue: BankManagerQueue<Customer> = BankManagerQueue()
    
    init(bankers: [Banker]) {
        self.bankers = bankers
    }
}
