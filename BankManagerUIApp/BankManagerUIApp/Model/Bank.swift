//
//  Bank.swift
//  BankManagerUIApp
//
//  Created by 조민호 on 2022/05/04.
//

import Foundation

fileprivate extension Constants {
    static let ten: Int = 10
}

protocol BankDelegate: AnyObject {
    func addClientToStackView(client: Client)
}

final class Bank {
    let bankClerks: [BankClerk]
    private let clientCount: Int
    private var queueDictionary: [String: Queue<Client>]
    private var totalClientCount: Int = 1
    private let depositOperationQueue = OperationQueue()
    private let loanOperationQueue = OperationQueue()
    let bankTimer = BankTimer()
    weak var delegate: BankDelegate?
    
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
        receiveClients()
        assignClientToBankClerk()
    }

    private func receiveClients() {
        for order in 1 ... clientCount {
            classifyClients(waitingNumber: order)
            totalClientCount += 1
        }
    }
    
    func receiveTenMoreClients() {
        for order in totalClientCount ..< totalClientCount + Constants.ten {
            classifyClients(waitingNumber: order)
            totalClientCount += 1
        }
        
        if bankTimer.currentStatus == .notRunning {
            assignClientToBankClerk()
            bankTimer.start()
        } else {
            assignClientToBankClerk()
        }
    }
    
    private func classifyClients(waitingNumber: Int) {
        let client = Client(waitingNumber: waitingNumber, bankService: .randomBankService)
        switch client.bankService {
        case .deposit:
            queueDictionary[BankServiceType.deposit.description]?.enqueue(client)
            delegate?.addClientToStackView(client: client)
        case .loan:
            queueDictionary[BankServiceType.loan.description]?.enqueue(client)
            delegate?.addClientToStackView(client: client)
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
        setUpOperationQueue()
        
        switch bankClerk.bankService {
        case .deposit:
            group.enter()
            depositOperationQueue.addOperation {
                while let client = queue.dequeue() {
                    bankClerk.work(client: client)
                }
                group.leave()
            }
        case .loan:
            group.enter()
            loanOperationQueue.addOperation {
                while let client = queue.dequeue() {
                    bankClerk.work(client: client)
                }
                group.leave()
            }
        }
    }
    
    private func setUpOperationQueue() {
        depositOperationQueue.maxConcurrentOperationCount = Constants.numberOfDepositBankClerks
        loanOperationQueue.maxConcurrentOperationCount = Constants.numberOfLoanBankClerks
    }
    
    func reset() {
        queueDictionary[BankServiceType.deposit.description]?.clear()
        queueDictionary[BankServiceType.loan.description]?.clear()
        bankTimer.reset()
        depositOperationQueue.cancelAllOperations()
        loanOperationQueue.cancelAllOperations()
        totalClientCount = 1
    }
}
