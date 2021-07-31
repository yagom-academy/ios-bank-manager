//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum BankManagerMessage {
    case workStart
    case workComplete
    case bankIsClosed
    
    var description: String {
        switch self {
        case .workStart:
            return "고객 업무 시작"
        case .workComplete:
            return "고객 업무 종료"
        case .bankIsClosed:
            return "업무가 마감되었습니다."
        }
    }
}

class BankManager {
    
    private(set) var numberOfCustomer: Int
    private let watingQueue = LinkedListQueue<Int>()
    
    init() {
        numberOfCustomer = Int.random(in: 10...30)
    }
    
    func openBank() {
        insertCustomerWatingQueue()
        workStart()
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
}
