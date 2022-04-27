//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 허윤영 on 27/04/2022.
//

protocol BankDelegate: AnyObject {
    func close(totalWorkTime: String)
}

final class Bank: BankDelegate, Presentable {
    private let clientQueue = Queue<Client>()
    private let bankClerk: BankClerk
    private let clientCount: Int
    
    init(bankClerk: BankClerk, clientCount: Int) {
        self.bankClerk = bankClerk
        self.clientCount = clientCount
        bankClerk.setDelegate(delegate: self)
    }
    
    private func receiveClients() {
        for order in 1 ... clientCount {
            clientQueue.enqueue(Client(waitingNumber: order))
        }
    }
    
    func open() {
        receiveClients()
        bankClerk.work(clientQueue)
    }
    
    func close(totalWorkTime: String) {
        printClosingMessage(clientCount: clientCount, totalWorkTime: totalWorkTime)
    }
}
