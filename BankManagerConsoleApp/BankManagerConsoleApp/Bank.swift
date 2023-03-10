//
//  Bank.swift
//  Created by Rhode, sehong.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Bank {
    private var clientCount = 0
    
    private enum BankStatus: String {
        case open = "1"
        case close = "2"
    }
    
    mutating func openBank() {
        displayBankMenu()
        let bankStatus = readMenuNumber()
        startWork(bankStatus)
    }
    
    private func displayBankMenu() {
        print(NameSpace.bankMenuText, terminator: " ")
    }
    
    private mutating func readMenuNumber() -> BankStatus? {
        guard let status = readLine(),
              let bankStatus = BankStatus(rawValue: status) else {
            print(NameSpace.InvalidInputText)
            openBank()
            
            return nil
        }
        return bankStatus
    }
    
    private mutating func startWork(_ status: BankStatus?) {
        switch status {
        case .open:
            manageBank()
        case .close:
            return
        default:
            return
        }
    }
    
    private mutating func manageClientQueue() -> Queue<Client> {
        var clientQueue = Queue<Client>()
        let randomClients = Int.random(in: 10...30)
        
        (0..<randomClients).forEach {
            let client = Client(clientWaitingNumber: $0 + 1)
            
            clientQueue.enqueue(client)
            clientCount += 1
        }
        return clientQueue
    }
    
    private mutating func distributeClient(bankManagerCount: Int) {
        var clientList = manageClientQueue()
        let bankManager = BankManager()
        let group = DispatchGroup()
        let semaphore = DispatchSemaphore(value: 1)
        
        for _ in Int.zero..<bankManagerCount {
            DispatchQueue.global().async(group: group) {
                semaphore.wait()
                
                while !clientList.isEmpty {
                    guard let client = clientList.dequeue()?.clientWaitingNumber else { return }
                    
                    bankManager.work(client: client)
                    semaphore.signal()
                }
            }
        }
        group.wait()
    }
    
    private mutating func manageBank() {
        let workTime = workTime {
            distributeClient(bankManagerCount: 1)
        }
        
        completeManagingBank(count: clientCount, time: workTime)
        openBank()
    }
    
    private func workTime(workTimeFunction: () -> Void) -> TimeInterval {
        let startTime = Date()
        
        workTimeFunction()
        
        let endTime = Date()
        let workTime = endTime.timeIntervalSince(startTime)
        
        return workTime
    }
    
    private func completeManagingBank(count: Int, time: Double) {
        let workingTime = String(format: "%.1f", time)
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총\(count)명이며, 총 업무시간은 \(workingTime)초 입니다.")
    }
}
