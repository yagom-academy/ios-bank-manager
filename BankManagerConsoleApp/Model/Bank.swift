//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 리지, 무리 on 2023/03/08.
//

import Foundation

struct Bank {
    private var waitingLine = Queue<Client>()
    private var clientCount: Int = 10
    private var BankClerkCount: Int = 3
    private var bankClerk = BankClerk()
    private let typeOfTask: [Task] = [.deposit, .loan]
    private let loanSemaphore = DispatchSemaphore(value: 1)
    private let depositSemaphore = DispatchSemaphore(value: 2)

    mutating func manageTodayTask() {
        lineUpClient()
        let totalTime = checkTaskTime()
        notifyTaskCompletion(totalTime)
    }
    
    mutating func lineUpClient() {
        clientCount = Int.random(in: 10...30)
        for number in 1...clientCount {
            guard let type = typeOfTask.randomElement() else { return }
            let currentClient = Client(waitingNumber: number, purposeOfVisit: type)
            waitingLine.enqueue(currentClient)
        }
    }
    
    mutating func checkTaskTime() -> String {
        let startTime = CFAbsoluteTimeGetCurrent()
        doTask()
        let timeOfTask = CFAbsoluteTimeGetCurrent() - startTime
        let totalTime = String(format: "%.2f", timeOfTask)
        return totalTime
    }

    mutating func doTask() {
        for _ in 1...waitingLine.count {
            guard let currentClient = waitingLine.dequeue() else { return }
            dispatchQueue(currentClient)
        }
    }
    
    private func dispatchQueue(_ currentClient: Client) {
        
        let depositService = DispatchWorkItem() { [self] in
            depositSemaphore.wait()
            bankClerk.service(to: currentClient)
            depositSemaphore.signal()
        }
        let loanService = DispatchWorkItem() { [self] in
            loanSemaphore.wait()
            bankClerk.service(to: currentClient)
            loanSemaphore.signal()
        }
        
        if currentClient.purposeOfVisit == .deposit {
            DispatchQueue.global().async(execute: depositService)
        } else {
            DispatchQueue.global().async(execute: loanService)
        }
    }
    
    mutating func notifyTaskCompletion(_ totalTime: String) {
        let success = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(clientCount)명이며, 총 업무시간은 \(totalTime)초입니다."
        print(success)
    }
}
