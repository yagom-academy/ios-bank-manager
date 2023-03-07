//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by brody, christy, harry on 2023/03/07.
//

struct Bank {
    private let bankers: [Banker]
    private var customerQueue: BankManagerQueue<Customer> = BankManagerQueue()
    
    init(bankersCount: Int) {
        self.bankers = .init(repeating: Banker(), count: bankersCount)
        
        let numberOfCustomer = Int.random(in: 10...30)
        
        for waitingNumber in 1...numberOfCustomer {
            let customer = Customer(waitingNumber: waitingNumber)
            customerQueue.enqueue(customer)
        }
    }
    
    func startWork() {
        
    }
}
