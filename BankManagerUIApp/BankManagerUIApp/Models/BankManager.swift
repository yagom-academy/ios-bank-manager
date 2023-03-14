//
//  BankManager.swift
//  Created by kaki, songjun.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

protocol BankManagerDelegate: AnyObject {
    func sendClient(client: Client)
}

struct BankManager {
    private var numberOfClient = 0
    private var waitingQueue = Queue<Client>()
    private let loanSemaphore = DispatchSemaphore(value: 1)
    private let depositSemaphore = DispatchSemaphore(value: 2)
    private let bankTaskGroup = DispatchGroup()
    weak var delegate: BankManagerDelegate?
    
    mutating func setupWaitingQueueAndClientNumber() {
        for _ in 1...10 {
            numberOfClient += 1
            let randomNumberOfTask = Int.random(in: 0...1)
            let client = Client(clientNumber: numberOfClient, requstedTask: .init(rawValue: randomNumberOfTask) ?? .deposit)
            waitingQueue.enqueue(client)
            delegate?.sendClient(client: client)
        }
    }
    
    mutating func reset() {
        waitingQueue.clear()
    }
    
    mutating func processBusiness() {
        let startTime = CFAbsoluteTimeGetCurrent()
        
        while !waitingQueue.isEmpty {
            guard let client = waitingQueue.dequeue() else { return }
            processBankTask(client)
        }
        bankTaskGroup.wait()
        
        let leadTime = CFAbsoluteTimeGetCurrent() - startTime
        presentBusinessResult(time: leadTime)
    }
    
    private func processBankTask(_ client: Client) {
        if client.requstedTask == .loan {
            DispatchQueue.global().async(group: bankTaskGroup) {
                loanSemaphore.wait()
                processPersonalBankTask(client)
                loanSemaphore.signal()
            }
        } else if client.requstedTask == .deposit {
            DispatchQueue.global().async(group: bankTaskGroup) {
                depositSemaphore.wait()
                processPersonalBankTask(client)
                depositSemaphore.signal()
            }
        }
    }
    
    private func processPersonalBankTask(_ client: Client) {
        print("\(client.clientNumber)번 고객 \(client.requstedTask.taskName)업무 시작")
        Thread.sleep(forTimeInterval: client.requstedTask.taskTime)
        print("\(client.clientNumber)번 고객 \(client.requstedTask.taskName)업무 완료")
    }
    
    private func presentBusinessResult(time: CFAbsoluteTime) {
        let totalTaskTime: String = String(format: "%.2f", time)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfClient)명이며, 총 업무시간은 \(totalTaskTime)초입니다.")
    }
}
