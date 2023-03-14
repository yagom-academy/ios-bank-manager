//
//  BankManager.swift
//  Created by kaki, songjun.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

protocol BankManagerDelegate: AnyObject {
    func sendClient(_ client: Client)
    func startClientTask(_ client: Client)
    func endClientTask(_ client: Client)
}

struct BankManager {
    private var numberOfClient = 0
    private var waitingQueue = Queue<Client>()
    private let loanQueue = OperationQueue()
    private let depositQueue = OperationQueue()
    weak var delegate: BankManagerDelegate?
    
    mutating func setupWaitingQueueAndClientNumber() {
        for _ in 1...10 {
            numberOfClient += 1
            let randomNumberOfTask = Int.random(in: 0...1)
            let client = Client(clientNumber: numberOfClient, requstedTask: .init(rawValue: randomNumberOfTask) ?? .deposit)
            waitingQueue.enqueue(client)
            delegate?.sendClient(client)
        }
    }
    
    mutating func reset() {
        waitingQueue.clear()
    }
    
    mutating func processBusiness() {
        while !waitingQueue.isEmpty {
            guard let client = waitingQueue.dequeue() else { return }
            processBankTask(client)
        }
    }
    
    private func processBankTask(_ client: Client) {
        if client.requstedTask == .loan {
            loanQueue.maxConcurrentOperationCount = 1
            loanQueue.addOperation {
                processPersonalBankTask(client)
            }
        } else if client.requstedTask == .deposit {
            depositQueue.maxConcurrentOperationCount = 2
            depositQueue.addOperation {
                processPersonalBankTask(client)
            }
        }
    }
    
    private func processPersonalBankTask(_ client: Client) {
        delegate?.startClientTask(client)
        Thread.sleep(forTimeInterval: client.requstedTask.taskTime)
        delegate?.endClientTask(client)
    }
    
    private func presentBusinessResult(time: CFAbsoluteTime) {
        let totalTaskTime: String = String(format: "%.2f", time)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfClient)명이며, 총 업무시간은 \(totalTaskTime)초입니다.")
    }
}
