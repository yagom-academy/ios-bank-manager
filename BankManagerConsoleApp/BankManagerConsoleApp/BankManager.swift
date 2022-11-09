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
    private var totalWorkTime: Double = 0.0
    private let group: DispatchGroup = DispatchGroup()
    
    init(bankWorkers: [BankWorker]) {
        self.bankWorkers = bankWorkers
    }
    
    mutating func publishTicketNumber() -> Int {
        let ticketNumber = totalClientCount + 1

        totalClientCount = ticketNumber
        
        return ticketNumber
    }
    
    mutating func addClientQueue(_ client: Client) {
        let requestingWork = client.requestingWork
        
        totalWorkTime += requestingWork.time
        
        switch requestingWork {
        case .deposit:
            depositClientQueue.enqueue(client)
        case .loan:
            loanClientQueue.enqueue(client)
        case .none:
            return
        }
    }
    
    mutating func open() {
        configureWorkType()
        assignBankWork()
    }
    
    mutating private func configureWorkType() {
        var currentDepositWorkerCount: Int = 0
        
        for (index, _) in bankWorkers.enumerated() {
            if currentDepositWorkerCount < DepositWorkerNumber.max {
                bankWorkers[index].bankWork = .deposit
                currentDepositWorkerCount += 1
            } else {
                bankWorkers[index].bankWork = .loan
            }
        }
    }
    
    private func assignBankWork() {
        for worker in bankWorkers {
            switch worker.bankWork {
            case .deposit:
                doDepositWork(by: worker)
            case .loan:
                doLoanWork(by: worker)
            case .none:
                return
            }
        }
        
        group.wait()
    }
    
    private func doDepositWork(by worker: BankWorker) {
        let semaphore = DispatchSemaphore(value: 1)
        
        DispatchQueue.global().async(group: group) {
            while !depositClientQueue.isEmpty {
                semaphore.wait()
                guard let client = depositClientQueue.dequeue() else {
                    print("업무를 처리할 예금 고객이 없습니다.")
                    return
                }
                
                semaphore.signal()
                worker.startWork(for: client)
            }
        }
    }
    
    private func doLoanWork(by worker: BankWorker) {
        let semaphore = DispatchSemaphore(value: 1)
        
        DispatchQueue.global().async(group: group) {
            while !loanClientQueue.isEmpty {
                semaphore.wait()
                guard let client = loanClientQueue.dequeue() else {
                    print("업무를 처리할 대출 고객이 없습니다.")
                    return
                }
                
                semaphore.signal()
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
