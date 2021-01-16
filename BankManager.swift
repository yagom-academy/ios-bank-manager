//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum BankBusiness: CaseIterable {
    case loan
    case deposit
    
    var string: String {
        switch self {
        case .loan:
            return "대출"
        case .deposit:
            return "예금"
        }
    }
}

struct BankManager {
    // MARK: - Properties
    private let bankHeadOffice: BankHeadOffice
    private var bankClerks = [BankClerk]()
    private var waitingClients = Queue<Client>()
    private var waitingTicketNumber: Int = 0
    private var startBusinessTime: CFAbsoluteTime = 0.0
    var currentBusinessTime: CFAbsoluteTime {
        CFAbsoluteTimeGetCurrent() - startBusinessTime
    }
    var totalBusinessTime: CFAbsoluteTime?
    var totalFinishedClients: Int {
        bankClerks.reduce(0) {
            $0 + $1.finishedClients
        }
    }
    var isAllBankClerkFinishWork: Bool {
        let waitingBankClerks = bankClerks.filter{$0.isWorking == false}
        return waitingBankClerks.count == bankClerks.count
    }
    
    // MARK: - Methods
    init(bankHeadOffice: BankHeadOffice, bankClerks: Int, clients: Int) {
        self.bankHeadOffice = bankHeadOffice
        addBankClerk(count: bankClerks)
        addClient(count: clients)
    }
    
    mutating func addBankClerk(count: Int) {
        guard count > 0 else {
            return
        }
        
        let lastCounterNumber = bankClerks.last?.bankWindowNumber ?? 0
        for i in 1...count {
            let bankClerk = BankClerk(bankHeadOffice: bankHeadOffice, bankWindowNumber: i + lastCounterNumber)
            bankClerks.append(bankClerk)
        }
    }
    
    mutating func addClient(count: Int) {
        guard count > 0 else {
            return
        }
        
        for _ in 1...count {
            waitingTicketNumber += 1
            waitingClients.enqueue(element: Client(tag: waitingTicketNumber))
        }
    }
    
    mutating func doBusiness() {
        startBusiness()
        makeBankClerkWork()
        endBusiness()
    }
    
    private mutating func startBusiness() {
        startBusinessTime = CFAbsoluteTimeGetCurrent()
    }
    
    private mutating func endBusiness() {
        totalBusinessTime = currentBusinessTime
        printWorkEndMessage()
    }
    
    private mutating func makeBankClerkWork() {
        while true {
            if waitingClients.isEmpty && isAllBankClerkFinishWork {
                break
            } else {
                startBankClerkWork()
            }
        }
    }
    
    private mutating func startBankClerkWork() {
        let waitBankClerks = bankClerks.filter{$0.isWorking == false}
        for waitBankClerk in waitBankClerks {
            if let client = waitingClients.dequeue() {
                waitBankClerk.startWork(for: client)
            }
        }
    }
    
    private func printWorkEndMessage() {
        let totalBusinessTimeString = String(format: "%.2f", totalBusinessTime ?? 0)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalFinishedClients)명이며, 총 업무시간은 \(totalBusinessTimeString)초입니다")
    }
}
