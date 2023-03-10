//
//  Bank.swift
//  Created by Rhode, sehong.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Bank {
    private var clientCount = 0
    
    init(clientCount: Int) {
        self.clientCount = clientCount
    }
    
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
        print(Constants.bankMenuText, terminator: " ")
    }
    
    private mutating func readMenuNumber() -> BankStatus? {
        guard let status = readLine(),
              let bankStatus = BankStatus(rawValue: status) else {
            print(Constants.InvalidInputText)
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
        
        (0..<clientCount).forEach {
            let client = Client(clientWaitingNumber: $0 + 1)
            
            clientQueue.enqueue(client)
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
                
                while let clientWaitingNumber = clientList.dequeue()?.clientWaitingNumber {
                    bankManager.work(client: clientWaitingNumber)
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
    
    private func workTime(workTimeHandler: () -> Void) -> TimeInterval {
        let startTime = Date()
        
        workTimeHandler()
        
        let endTime = Date()
        let workTime = endTime.timeIntervalSince(startTime)
        
        return workTime
    }
    
    private func completeManagingBank(count: Int, time: Double) {
        let workingTime = String(format: "%.1f", time)
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총\(count)명이며, 총 업무시간은 \(workingTime)초 입니다.")
    }
}

extension Bank {
    enum Constants {
        static let bankMenuText = "1 : 은행개점 \n2 : 종료\n입력 :"
        static let InvalidInputText = "입력이 잘못되었습니다."
    }
}
