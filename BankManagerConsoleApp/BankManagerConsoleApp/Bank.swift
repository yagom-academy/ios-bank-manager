//
//  Bank.swift
//  Created by Rhode, sehong.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Bank {
    var clientCount: Int = 0
    
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
    
    private mutating func manageClientQueue() -> (deposit: Queue<Client>, loan: Queue<Client>) {
        var depositClientQueue = Queue<Client>()
        var loanClientQueue = Queue<Client>()
        
        var clientArray: [Int] = []
        clientCount = Int.random(in: 5...10)
        
        (0..<clientCount).forEach {
            clientArray.append($0 + 1)
        }
        
        var loanArray: [Int] = []
        let loanCount = Int.random(in: 0...clientCount)
        
        while loanArray.count < loanCount {
            let loanClientNumber = Int.random(in: 1...clientCount)
            
            if loanArray.contains(loanClientNumber) {
                continue
            } else {
                loanArray.append(loanClientNumber)
            }
        }
        
        loanArray = loanArray.sorted()
        
        for loanClientNumber in loanArray {
            let loanClient = Client(clientWaitingNumber: loanClientNumber, bankingType: .loan)
            loanClientQueue.enqueue(loanClient)
        }
        
        clientArray.removeAll(where: {loanArray.contains($0)})
        
        for depositClientNumber in clientArray {
            let depositClient = Client(clientWaitingNumber: depositClientNumber, bankingType: .deposit)
            depositClientQueue.enqueue(depositClient)
        }
        
        let clientTuple = (deposit: depositClientQueue, loan: loanClientQueue)
        
        return clientTuple
    }
    
    private mutating func distributeClient(depositManagerCount: Int, loanManagerCount: Int) {
        let clientLists = manageClientQueue()
        var depositClientList = clientLists.deposit
        var loanClientList = clientLists.loan
        let bankManager = BankManager()
        let group = DispatchGroup()
        let semaphore = DispatchSemaphore(value: 1)
        
        for _ in Int.zero..<depositManagerCount {
            DispatchQueue.global().async(group: group) {
                semaphore.wait()
                
                while let client = depositClientList.dequeue() {
                    bankManager.work(client: client)
                    semaphore.signal()
                }
            }
        }
        for _ in Int.zero..<loanManagerCount {
            DispatchQueue.global().async(group: group) {
                semaphore.wait()
                
                while let client = loanClientList.dequeue() {
                    bankManager.work(client: client)
                    semaphore.signal()
                }
            }
        }
        group.wait()
    }
    
    private mutating func manageBank() {
        let workTime = workTime {
            distributeClient(depositManagerCount: 2, loanManagerCount: 1)
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
