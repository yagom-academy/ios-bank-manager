//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

private class BankClerk {
    var bankWindowNumber: Int
    var isWorking: Bool {
        currentClient != nil
    }
    var currentClient: Client?
    var workTime: Double = 0.7
    var totalWorkTime: Double = 0.0
    var finishedClients: Int = 0
    
    func startWork(for client: Client) {
        currentClient = client
        print("\(client.tag)번 고객 업무 시작")
    }
    
    func finishWork() {
        totalWorkTime += workTime
        finishedClients += 1
        if let client = currentClient {
            print("\(client.tag)번 고객 업무 완료")
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
    var totalWorkTime: Double {
        bankClerks.reduce(0) {
            $0 + $1.totalWorkTime
        }
    }
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
    
    mutating func doBusiness() {
        while true {
            if waitingClients.isEmpty && isAllBankClerkFinishWork {
                break
            } else {
                startBankClerkWork()
            }
        }
        
        printWorkEndMessage()
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
        let totalWorkTimeString = String(format: "%.2f", totalWorkTime)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalFinishedClients)명이며, 총 업무시간은 \(totalWorkTimeString)초입니다")
    }
    
    init(_ numberOfBankClerk: Int, _ numberOfClient: Int) {
        addBankClerk(count: numberOfBankClerk)
        addClient(count: numberOfClient)
    }
}
