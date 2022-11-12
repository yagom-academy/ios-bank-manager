//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by 애쉬, 로빈 on 2022/11/04.
//

import Foundation

struct BankManager {
    private var bankWorkers: [BankWorker] = []
    private let depositClientQueue: Queue<Client> = Queue()
    private let loanClientQueue: Queue<Client> = Queue()
    private var totalClientCount: Int = 0
    private var totalWorkTime: TimeInterval = 0.0
    private let group: DispatchGroup = DispatchGroup()
    private let depositSemaphore = DispatchSemaphore(value: 1)
    private let loanSemaphore = DispatchSemaphore(value: 1)
    
    init() {
        var currentDepositWorkerCount: Int = 0
        
        for _ in 0..<(DepositWorkerNumber.max + LoanWorkerNumber.max) {
            if currentDepositWorkerCount < DepositWorkerNumber.max {
                let bankWorker: BankWorker = BankWorker(bankWork: .deposit)
                
                bankWorkers.append(bankWorker)
                currentDepositWorkerCount += 1
            } else {
                let bankWorker: BankWorker = BankWorker(bankWork: .loan)
                
                bankWorkers.append(bankWorker)
            }
        }
    }
    
    mutating func publishTicketNumber() -> Int {
        let ticketNumber = totalClientCount + 1
        
        totalClientCount = ticketNumber
        
        return ticketNumber
    }
    
    mutating func addClientQueue(_ client: Client) {
        let requestingWork = client.requestingWork
        
        switch requestingWork {
        case .deposit:
            depositClientQueue.enqueue(client)
        case .loan:
            loanClientQueue.enqueue(client)
        }
        
        totalWorkTime += requestingWork.time
    }
    
    mutating func open() {
        assignBankWork()
    }
    
    private func assignBankWork() {
        for worker in bankWorkers {
            switch worker.bankWork {
            case .deposit:
                doDepositWork(by: worker)
            case .loan:
                doLoanWork(by: worker)
            default:
                return
            }
        }
        
        group.wait()
    }
    
    private func doDepositWork(by worker: BankWorker) {
        DispatchQueue.global().async(group: group) {
            while !depositClientQueue.isEmpty {
                depositSemaphore.wait()
                guard let client = depositClientQueue.dequeue() else {
                    depositSemaphore.signal()
                    print("업무를 처리할 예금 고객이 없습니다.")
                    return
                }
                
                depositSemaphore.signal()
                worker.startWork(for: client)
            }
        }
    }
    
    private func doLoanWork(by worker: BankWorker) {
        DispatchQueue.global().async(group: group) {
            while !loanClientQueue.isEmpty {
                loanSemaphore.wait()
                guard let client = loanClientQueue.dequeue() else {
                    loanSemaphore.signal()
                    print("업무를 처리할 대출 고객이 없습니다.")
                    return
                }
                
                loanSemaphore.signal()
                worker.startWork(for: client)
            }
        }
    }
    
    func close() {
        let message: String =
        String(format: "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 %d명이며, 총 업무시간은 %.2f초 입니다.",
               totalClientCount,
               totalWorkTime)
        
        print("\(message)")
    }
    
    mutating func resetWorkData() {
        totalClientCount = 0
        totalWorkTime = 0
    }
}
