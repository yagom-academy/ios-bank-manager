//
//  Bank.swift
//  BankManagerUIApp
//
//  Created by 조민호 on 2022/05/04.
//

import Foundation

final class Bank {
    private let bankClerks: [BankClerk]
    private let clientCount: Int
    private let queueDictionary: [String: Queue<Client>]
    let bankTimer = BankTimer()
    
    init(bankClerks: [BankClerk],
         clientCount: Int,
         queueDictionary: [String: Queue<Client>]
    ) {
        self.bankClerks = bankClerks
        self.clientCount = clientCount
        self.queueDictionary = queueDictionary
    }
    
    func open() {
        bankTimer.start()
        receiveClients(clientCount: clientCount)
        assignClientToBankClerk()
    }
    
    func receiveClients(clientCount: Int = 10) {
        for order in 1 ... clientCount {
            classifyClients(waitingNumber: order)
        }
    }
    
    private func classifyClients(waitingNumber: Int) {
        let client = Client(waitingNumber: waitingNumber, bankService: .randomBankService)
        switch client.bankService {
        case .deposit:
            queueDictionary[BankServiceType.deposit.description]?.enqueue(client)
            NotificationCenter.default.post(name: .didRecieveClient, object: client)
        case .loan:
            queueDictionary[BankServiceType.loan.description]?.enqueue(client)
            NotificationCenter.default.post(name: .didRecieveClient, object: client)
        }
    }
    
    private func assignClientToBankClerk() {
        let group = DispatchGroup()
        
        bankClerks.filter { $0.bankService == .deposit }.forEach { bankClerk in
            assignWorkToBankClerk(
                group: group,
                queue: queueDictionary[BankServiceType.deposit.description] ?? Queue<Client>(),
                bankClerk: bankClerk
            )
        }
        
        bankClerks.filter { $0.bankService == .loan }.forEach { bankClerk in
            assignWorkToBankClerk(
                group: group,
                queue: queueDictionary[BankServiceType.loan.description] ?? Queue<Client>(),
                bankClerk: bankClerk
            )
        }
        
        group.notify(queue: .global()) {
            self.bankTimer.stop()
        }
    }
    
    private func assignWorkToBankClerk(
        group: DispatchGroup,
        queue: Queue<Client>,
        bankClerk: BankClerk
    ) {
        DispatchQueue.global().async(group: group) {
            while let client = queue.dequeue() {
                bankClerk.work(client: client)
            }
        }
    }
}

