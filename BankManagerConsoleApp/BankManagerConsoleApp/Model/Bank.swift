//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 허윤영 on 27/04/2022.
//

import Foundation

fileprivate extension Constants {
    static let decimalPlace = "%.2f"
}

final class Bank: Presentable {
    private let bankClerks: [BankClerk]
    private let clientCount: Int
    private let queueDictionary: [String: Queue<Client>]
    
    init(bankClerks: [BankClerk],
         clientCount: Int,
         queueDictionary: [String: Queue<Client>]
    ) {
        self.bankClerks = bankClerks
        self.clientCount = clientCount
        self.queueDictionary = queueDictionary
    }
    
    func open() {
        receiveClients()
        
        let totalWorkTime = measureTotalWorkTime {
            assignClientToBankClerk()
        }
        
        close(totalWorkTime: totalWorkTime)
    }
    
    private func receiveClients() {
        for order in 1 ... clientCount {
            classifyClients(waitingNumber: order)
        }
    }
    
    private func classifyClients(waitingNumber: Int) {
        let client = Client(waitingNumber: waitingNumber, bankService: .randomBankService)
        switch client.bankService {
        case .deposit:
            queueDictionary[BankServiceType.deposit.description]?.enqueue(client)
        case .loan:
            queueDictionary[BankServiceType.loan.description]?.enqueue(client)
        }
    }
    
    private func measureTotalWorkTime(_ task: () -> Void) -> String {
        let startTime = CFAbsoluteTimeGetCurrent()
        task()
        let finishTime = CFAbsoluteTimeGetCurrent()
        let totalTime = finishTime - startTime
        
        return totalTime.formatted
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
        
        group.wait()
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
    
    private func close(totalWorkTime: String) {
        printClosingMessage(clientCount: clientCount, totalWorkTime: totalWorkTime)
    }
}

fileprivate extension CFAbsoluteTime {
    var formatted: String {
        String(format: Constants.decimalPlace, self)
    }
}
