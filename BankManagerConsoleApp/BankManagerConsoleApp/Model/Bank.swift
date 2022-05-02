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
    private let depositClientQueue = Queue<Client>()
    private let loanClientQueue = Queue<Client>()
    
    init(bankClerks: [BankClerk], clientCount: Int) {
        self.bankClerks = bankClerks
        self.clientCount = clientCount
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
    
    private func measureTotalWorkTime(_ task: () -> Void) -> String {
        let startTime = CFAbsoluteTimeGetCurrent()
        task()
        let finishTime = CFAbsoluteTimeGetCurrent()
        let totalTime = finishTime - startTime
        
        return totalTime.formatted
    }
    
    private func assignClientToBankClerk() {
        let group = DispatchGroup()
        let depositSemaphore = DispatchSemaphore(value: Constants.numberOfDepositBankClerks)
        let loanSemaphore = DispatchSemaphore(value: Constants.numberOfLoanBankClerks)
        
        bankClerks.filter { $0.service == .deposit }.forEach { bankClerk in
            assignWorkToBankClerk(
                group: group,
                queue: self.depositClientQueue,
                bankClerk: bankClerk,
                semaphore: depositSemaphore
            )
        }
        
        bankClerks.filter { $0.service == .loan }.forEach { bankClerk in
            assignWorkToBankClerk(
                group: group,
                queue: self.loanClientQueue,
                bankClerk: bankClerk,
                semaphore: loanSemaphore
            )
        }
        
        group.wait()
    }
    
    private func assignWorkToBankClerk(
        group: DispatchGroup,
        queue: Queue<Client>,
        bankClerk: BankClerk,
        semaphore: DispatchSemaphore
    ) {
        DispatchQueue.global().async(group: group) {
            semaphore.wait()
            while let client = queue.dequeue() {
                bankClerk.work(client: client)
            }
            semaphore.signal()
        }
    }
    
    private func classifyClients(waitingNumber: Int) {
        let client = Client(waitingNumber: waitingNumber, bankService: .randomBankService)
        switch client.bankService {
        case .deposit:
            depositClientQueue.enqueue(client)
        case .loan:
            loanClientQueue.enqueue(client)
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
