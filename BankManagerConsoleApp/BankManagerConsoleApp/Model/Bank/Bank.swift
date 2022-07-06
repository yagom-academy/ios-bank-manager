//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by minsson, Derrick kim on 2022/07/01.
//

import Foundation

final class Bank {
    private let managers: [BankManager] = [BankManager(name: "예금매니저1", task: .deposit),
                                           BankManager(name: "예금매니저2", task: .deposit),
                                           BankManager(name: "대출매니저1", task: .loan)]
    
    let bankManagersGroup = DispatchGroup()
    
    private let depositSemaphore = DispatchSemaphore(value: 1)
    
    private(set) var depositClientQueue = ClientQueue<Client>()
    private(set) var loanClientQueue = ClientQueue<Client>()
    
    private var totalProcessingTime: Double = 0.0
    private var totalVisitedClients: Int = 0
}

extension Bank {
    func decideWhichQueue(for manager: BankManager) -> ClientQueue<Client> {
        switch manager.task {
        case .deposit:
            return depositClientQueue
        case .loan:
            return loanClientQueue
        }
    }
    
    func arrangeAll(_ managers: [BankManager]) {
        for manager in managers {
            DispatchQueue.global().async(group: bankManagersGroup) {
                self.assignTask(to: manager, from: self.decideWhichQueue(for: manager))
            }
        }
    }
    
    func assignTask(to manager: BankManager, from queue: ClientQueue<Client>) {
        while !queue.isEmpty() {
            self.depositSemaphore.wait()
            
            guard let client = queue.dequeue() else {
                return
            }
            
            manager.processRequest(from: client)
            manager.startTask(for: client)
            
            self.totalVisitedClients += 1
            self.depositSemaphore.signal()
            
            Thread.sleep(forTimeInterval: client.request.processingTime)
    
            manager.finishTask(for: client)
        }
    }
    
    func open() {
        generateClients()

        let startTime = CFAbsoluteTimeGetCurrent()
        
        DispatchQueue.global().sync {
            arrangeAll(managers)
            bankManagersGroup.wait()
        }
        
        let closeTime = CFAbsoluteTimeGetCurrent()
        let elapsedTime = closeTime - startTime
        
        reportSummary(elapsedTime: elapsedTime)
    }
    
    func close() {
        totalProcessingTime = 0.0
        totalVisitedClients = 0
    }
    
    func reportSummary(elapsedTime: CFAbsoluteTime) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalVisitedClients)명이며, 총 업무시간은 \(elapsedTime.roundDown())초입니다.")
    }
}

private extension Bank {
    func generateClients() {
        let clientAmount = Int.random(in: 10...30)
        
        for amount in 1...clientAmount {
            guard let requestName = Request.allCases.randomElement() else {
                return
            }
            
            switch requestName {
            case .deposit:
                depositClientQueue.enqueue(Client(request: requestName, waitingNumber: amount))
            case .loan:
                loanClientQueue.enqueue(Client(request: requestName, waitingNumber: amount))
            }
        }
    }
    
}
