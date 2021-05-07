//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BankManager {
    private let counter = OperationQueue()
    private var clients = [Client]()
    private var tasks = [Operation]()
    
    private var numberOfClient: UInt = 0
    private var numberOfTeller: UInt
    private var waitingNumber: UInt = 0
    
    init(numberOfTeller: UInt) {
        self.numberOfTeller = numberOfTeller
        counter.maxConcurrentOperationCount = Int(numberOfTeller)
    }
    
    private func generateNumberOfClient() -> UInt {
        let numberOfClient = Int.random(in: 10...30)
        return UInt(numberOfClient)
    }
    
    private func generateClient() {
        waitingNumber += 1
        
        guard let randomClientClass = ClientType.allCases.randomElement(),
              let randomBusinessType = BusinessType.allCases.randomElement() else {
            return
        }
        
        let client = Client(waitingNumber: waitingNumber, clientClass: randomClientClass, businessType: randomBusinessType)
        
        clients.append(client)
    }
    
    private func addToClient() {
        for index in 0..<self.numberOfClient {
            workTask(order: self.clients[Int(index)])
        }
        counter.addOperations(tasks, waitUntilFinished: true)
    }
    
    private func workTask(order: Client) {
        let operation = BlockOperation {
            let tellerStartWorkMessage = "⭕️ \(order.waitingNumber)번 \(order.clientClass)고객님 \(order.businessType)업무 시작"
            let tellerFinishWorkMessage = "🛑 \(order.waitingNumber)번 \(order.clientClass)고객님 \(order.businessType)업무 완료"
            
            print(tellerStartWorkMessage)
            Thread.sleep(forTimeInterval: order.businessType.rawValue)
            print(tellerFinishWorkMessage)
        }
        
        switch order.clientClass {
        case .VVIP:
            operation.queuePriority = .veryHigh
        case .VIP:
            operation.queuePriority = .high
        case .일반:
            operation.queuePriority = .normal
        }
        
        tasks.append(operation)
    }
    
    private func closeBank(workTime: Double) {
        let closeBankMessage = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(Int(numberOfClient))명이며, 총 업무시간은 \(Float(workTime))초입니다."
        
        print(closeBankMessage)
        
        waitingNumber = 0
        numberOfClient = 0
    }
    
    public func measureTime(_ closure: () -> () ) -> TimeInterval {
        let startDate = Date()
        closure()
        return Date().timeIntervalSince(startDate)
    }
    
    func processOfTellerTask() {
        let timer = measureTime {
            let number = generateNumberOfClient()
            numberOfClient = number
            for _ in 1...number {
                generateClient()
            }
            addToClient()
        }
        closeBank(workTime: timer)
    }
}

