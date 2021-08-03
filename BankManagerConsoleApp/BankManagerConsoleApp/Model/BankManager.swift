//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum WorkStatusMessage {
    case workStart
    case workComplete
    
    func returnWorkStatus(number: Int) -> String {
        switch self {
        case .workStart:
            return "\(number)번 고객 업무 시작"
        case .workComplete:
            return "\(number)번 고객 업무 종료"
        }
    }
}

enum BankIsClosedMessage {
    case bankIsClosed
    
    func returnClosedBankMessage(number: Int, time: Double) -> String {
        return "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(number)명이며, 총 업무시간은 \(String(format: "%.2f", time))초 입니다."
    }
}

class BankManager {    
    private var numberOfCustomer: Int
    private let watingQueue = LinkedListQueue<Int>()
    
    init() {
        numberOfCustomer = Int.random(in: 10...30)
    }
    
    func bankSimulator() {
        let startTime = CFAbsoluteTimeGetCurrent()
        insertCustomerWatingQueue()
        workStart()
        let durationTime = CFAbsoluteTimeGetCurrent() - startTime
        displayBankClosed(workTime: durationTime)
    }
    
    private func insertCustomerWatingQueue() {
        for customer in 1...numberOfCustomer {
            watingQueue.enqueue(value: Int(customer))
        }
    }
    
    private func workStart() {
        let workingTime: Double = 0.7
        repeat {
            guard let watingNumber: Int = watingQueue.dequeue() else { return }
            print(WorkStatusMessage.workStart.returnWorkStatus(number: watingNumber))
            Thread.sleep(forTimeInterval: workingTime)
            print(WorkStatusMessage.workComplete.returnWorkStatus(number: watingNumber))
        } while watingQueueIsNotEmpty == true
    }
    
    private func displayBankClosed(workTime: Double) {
        print(BankIsClosedMessage.bankIsClosed.returnClosedBankMessage(number: self.numberOfCustomer, time: workTime))
    }
}

extension BankManager {
    var watingQueueIsNotEmpty: Bool {
        let result: Bool = !watingQueue.isEmpty()
        return result
    }
}
