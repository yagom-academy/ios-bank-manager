//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 허윤영 on 27/04/2022.
//

final class Bank {
    private let clientQueue = Queue<Client>()
    private let bankClerk: BankClerk
    
    init(bankClerk: BankClerk) {
        self.bankClerk = bankClerk
    }
    
    private func receiveClients() {
        let clientCount = Int.random(in: 10 ... 30)
        
        for order in 1 ... clientCount {
            clientQueue.enqueue(Client(waitingNumber: order))
        }
    }
    
    func open() {
        receiveClients()
        bankClerk.work(clientQueue)
    }
}
