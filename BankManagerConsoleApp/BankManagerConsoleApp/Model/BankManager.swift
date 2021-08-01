//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum BankManagerMessage {
    case workStart
    case workComplete
    
    var description: String {
        switch self {
        case .workStart:
            return "고객 업무 시작"
        case .workComplete:
            return "고객 업무 종료"
        }
    }
}

class BankManager {    
    private var numberOfCustomer: Int
    private let watingQueue = LinkedListQueue<Int>()
    
    init() {
        numberOfCustomer = Int.random(in: 10...30)
    }
    
    func bankSimulator() {
        insertCustomerWatingQueue()
        workStart()
        bankIsClosed(workTime: 0.7777777)
    }
    
    private func insertCustomerWatingQueue() {
        for customer in 1...numberOfCustomer {
            watingQueue.enqueue(value: Int(customer))
        }
    }
    
    private func workStart() {
        repeat {
            let workingSpeed = UInt32(0.7)
            guard let watingNumber: Int = watingQueue.dequeue() else { return }
            print("\(watingNumber)번" + BankManagerMessage.workStart.description)
            sleep(UInt32(workingSpeed))
            print("\(watingNumber)번" + BankManagerMessage.workComplete.description)
        } while watingQueue.isEmpty() != true
    }
    
    private func bankIsClosed(workTime: Double) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(self.numberOfCustomer)명이며, 총 업무시간은 \(String(format: "%.2f", workTime))초 입니다.")
    }
}
