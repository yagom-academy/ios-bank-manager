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
    private var totalWorkTime: Double = 0
    
    init(bankWorkers: [BankWorker]) {
        self.bankWorkers = bankWorkers
    }
    
    mutating func publishTicketNumber() -> Int {
        let ticketNumber = totalClientCount + 1
        totalClientCount = ticketNumber
        return ticketNumber
    }
    
    mutating func allocateWork(to worker: BankWorker) {
        bankWorkers[0].bankWork = .deposit
        bankWorkers[1].bankWork = .deposit
        bankWorkers[2].bankWork = .loan
    }
    
    mutating func addClientQueue(_ client: Client) {
        let requestWork = client.requestWork
        
        totalWorkTime += client.requestWork.time
        
        switch requestWork {
        case .deposit:
            depositClientQueue.enqueue(client)
        case .loan:
            loanClientQueue.enqueue(client)
        case .none:
            return
        }
    }
    
    private func directBankWork() {
        let customQueue = DispatchQueue(label: "Cuncurrent", attributes: .concurrent)
        let semaphore = DispatchSemaphore(value: 1)
        
        customQueue.async {
            while !depositClientQueue.isEmpty {
                semaphore.wait()
                guard let client = depositClientQueue.dequeue() else {
                    print("업무를 처리할 예금 고객이 없습니다.")
                    return
                }
                
                bankWorkers[0].startWork(for: client)
                semaphore.signal()
            }
        }
        
        customQueue.async {
            while !depositClientQueue.isEmpty {
                semaphore.wait()
                guard let client = depositClientQueue.dequeue() else {
                    print("업무를 처리할 예금 고객이 없습니다.")
                    return
                }
                
                bankWorkers[1].startWork(for: client)
                semaphore.signal()
            }
        }
        
        customQueue.async {
            while !loanClientQueue.isEmpty {
                guard let client = loanClientQueue.dequeue() else {
                    print("업무를 처리할 대출 고객이 없습니다.")
                    return
                }
                
                bankWorkers[2].startWork(for: client)
            }
        }
    }
    
    mutating func open() {
        directBankWork()
    }
    
    mutating func close() {
        let message: String =
        String(format: "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 %d명이며, 총 업무시간은 %.2f초 입니다.",
               totalClientCount,
               totalWorkTime)
        
        print("\(message)")
        totalClientCount = 0
    }
}
