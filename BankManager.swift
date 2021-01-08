//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

private class BankClerk {
    // MARK: - Properties
    var bankWindowNumber: Int
    var isWorking: Bool {
        currentClient != nil
    }
    var currentClient: Client?
    var workTime: Double = 0.7
    var finishedClients: Int = 0
    
    // MARK: - Methods
    func startWork(for client: Client) {
        currentClient = client
        print("\(client.tag)번 \(client.priority.string)고객 \(client.business.string)업무 시작")
    }
    
    func finishWork() {
        finishedClients += 1
        if let client = currentClient {
            print("\(client.tag)번 \(client.priority.string)고객 \(client.business.string)업무 완료")
        }
        currentClient = nil
    }
    
    init(bankWindowNumber: Int) {
        self.bankWindowNumber = bankWindowNumber
    }
}

struct BankManager {
    // MARK: - Properties
    private var bankClerks: [BankClerk] = [BankClerk]()
    private var waitingClients: Queue<Client> = Queue<Client>()
    private var waitingTicketNumber: Int = 0
    private var startBusinessTime: Double = 0.0
    var currentBusinesstime: Double {
        CFAbsoluteTimeGetCurrent() - startBusinessTime
    }
    var totalBusinessTime: Double?
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
    mutating func addBankClerk(count: Int) {
        guard count > 0 else {
            return
        }
        
        let lastCounterNumber = bankClerks.last?.bankWindowNumber ?? 0
        for i in 1...count {
            let bankClerk = BankClerk(bankWindowNumber: i + lastCounterNumber)
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
    
    mutating func startBusiness() {
        startBusinessTime = CFAbsoluteTimeGetCurrent()
        
        doBusiness()
        endBusiness()
    }
    
    mutating func endBusiness() {
        totalBusinessTime = currentBusinesstime
        printWorkEndMessage()
    }
    
    mutating func doBusiness() {
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
                
                let workTime = Int(waitBankClerk.workTime * 1000)
                DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(workTime)) {
                    waitBankClerk.finishWork()
                }
            }
        }
    }
    
    private func printWorkEndMessage() {
        let totalBusinessTimeString = String(format: "%.2f", totalBusinessTime ?? 0)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalFinishedClients)명이며, 총 업무시간은 \(totalBusinessTimeString)초입니다")
    }
    
    init(_ numberOfBankClerk: Int, _ numberOfClient: Int) {
        addBankClerk(count: numberOfBankClerk)
        addClient(count: numberOfClient)
    }
}
