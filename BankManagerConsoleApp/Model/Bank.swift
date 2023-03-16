//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 리지, 무리 on 2023/03/08.
//

import Foundation

struct Bank {
    var waitingLine = Queue<Client>()
    var clientCount: Int = 0
    private var bankClerk = BankClerk()
    private let typeOfTask: [Task] = [.deposit, .loan]
    private let depositClerk = OperationQueue()
    private let loanClerk = OperationQueue()
    
    var delegate: BankDelegate?
    
    mutating func manageTodayTask() {
        lineUpClient()
        let totalTime = calculateTaskTime()
        notifyTaskCompletion(totalTime)
    }
    
    mutating func lineUpClient() {
        clientCount += 10
        var startCount = 1
        
        if clientCount == 10 {
            startCount = 1
        } else {
            startCount = clientCount - 9
        }
        
        for number in startCount...clientCount {
            guard let type = typeOfTask.randomElement() else { return }
            let currentClient = Client(waitingNumber: number, purposeOfVisit: type)
            waitingLine.enqueue(currentClient)
            delegate?.sendData(of: currentClient)
        }
    }
    
    mutating private func calculateTaskTime() -> String {
        let startTime = CFAbsoluteTimeGetCurrent()
        
        doTask()
        
        let timeOfTask = CFAbsoluteTimeGetCurrent() - startTime
        let totalTime = String(format: "%.2f", timeOfTask)
        
        return totalTime
    }
    
    mutating func doTask() {
        for _ in 1...waitingLine.count {
            guard let currentClient = waitingLine.dequeue() else { return }
            assignToBankClerk(currentClient)
        }
    }
    
    private func assignToBankClerk(_ currentClient: Client) {
        let process = BlockOperation {
            delegate?.startTask(of: currentClient)
            bankClerk.service(to: currentClient)
            delegate?.completeTask(of: currentClient)
        }

        switch currentClient.purposeOfVisit {
        case .deposit:
            depositClerk.maxConcurrentOperationCount = 2
            depositClerk.addOperation(process)
        case .loan:
            loanClerk.maxConcurrentOperationCount = 1
            loanClerk.addOperation(process)
        }
    }
    
    mutating func reset() {
        waitingLine.clear()
        clientCount = 0
        depositClerk.cancelAllOperations()
        loanClerk.cancelAllOperations()
    }
    
    private func notifyTaskCompletion(_ totalTime: String) {
        let success = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(clientCount)명이며, 총 업무시간은 \(totalTime)초입니다."
        print(success)
    }
}

protocol BankDelegate {
    func sendData(of client: Client)
    func startTask(of client: Client)
    func completeTask(of client: Client)
}
