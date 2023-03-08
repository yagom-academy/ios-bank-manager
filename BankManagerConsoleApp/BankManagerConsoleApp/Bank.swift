//
//  Bank.swift
//  Created by Rhode, sehong.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Bank {
    var clientCount = 0
    
    private enum BankStatus: String {
        case open = "1"
        case close = "2"
    }
    
    mutating func openBank() {
        print("1 : 은행개점 \n2 : 종료\n입력 :", terminator: " ")
        guard let status = readLine(),
              let bankStatus = BankStatus(rawValue: status) else {
            print("입력이 잘못되었습니다.")
            openBank()
            
            return
        }
        startWork(bankStatus)
    }
    
    private mutating func startWork(_ status: BankStatus) {
        switch status {
        case .open:
            manageBank()
        case .close:
            return
        }
    }
    
    private mutating func managingClientQueue() -> Queue<Client> {
        var clientQueue = Queue<Client>()
        let randomClients = Int.random(in: 0...10)
        
        (0..<randomClients).forEach {
            let client = Client(clientWaitingNumber: $0 + 1)
            
            clientQueue.enqueue(client)
            clientCount += 1
        }
        return clientQueue
    }
    
    private mutating func distributeClient(bankManagerCount: Int) {
        var clientList = managingClientQueue()
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
