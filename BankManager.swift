//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BankManager {
    let counter = OperationQueue()
    var clients = [Client]()
    
    private var numberOfClient: UInt = 0
    private var numberOfTeller: UInt
    private var waitingNumber: UInt = 1
    
    init(numberOfTeller: UInt) {
        self.numberOfTeller = numberOfTeller
        generateClient()
    }
    
    private func generateClient() {
        guard let randomClientClass = ClientType.allCases.randomElement(),
              let randomBusinessType = BusinessType.allCases.randomElement() else {
            return
        }
        
        let client = Client(waitingNumber: waitingNumber, clientClass: randomClientClass, businessType: randomBusinessType)
        waitingNumber += 1
        
        clients.append(client)
    }
    
    private func generateNumberOfClient() -> UInt {
        let numberOfClient = Int.random(in: 10...30)
        return UInt(numberOfClient)
    }
    
    private func addToClient(number: Int) {
        let number = generateNumberOfClient()
        for index in 1...number {
            counter.addOperation {
                self.workTask(order: UInt(index))
            }
        }
    }

    func workTask(order: UInt) {
        let tellerStartWorkMessage = "\(order)번 고객 업무 시작"
        let tellerFinishWorkMessage = "\(order)번 고객 업무 완료★"
        
        print(tellerStartWorkMessage)
        Thread.sleep(forTimeInterval: 0.7)
        print(tellerFinishWorkMessage)
    }
    
    func processOfTellerTask() {
        counter.maxConcurrentOperationCount = Int(numberOfTeller)
        
        counter.waitUntilAllOperationsAreFinished()
        closeBank()
    }
    
    private func closeBank() {
        let closeBankMessage = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfClient)명이며, 총 업무시간은 \(Double(numberOfClient) * 0.7)초입니다."
        
        print(closeBankMessage)
    }
}
