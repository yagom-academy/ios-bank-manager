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
            return "고객 대출업무 시작"
        case .workComplete:
            return "고객 예금업무 시작"
        case .bankIsClosed:
            return "업무가 마감되었습니다."
        }
    }
}

class BankManager {
    
    let numberOfCustomer: Int
    let watingQueue = LinkedListQueue<Int32>()
    
    init() {
        numberOfCustomer = Int.random(in: 1...30)
        print(numberOfCustomer)
    }
    
    public func openBank() {
        insertCustomerWatingQueue()
        workStart()
    }
    
    private func insertCustomerWatingQueue() {
        for customer in 1...numberOfCustomer {
            watingQueue.enqueue(value: Int32(customer))
        }
    }
    
    private func workStart() {
        repeat {
            guard let watingNumber: Int32 = watingQueue.dequeue() else { return }
            print("\(watingNumber)번" + BankManagerMessage.workStart.description)
            sleep(UInt32(watingNumber))
            print("\(watingNumber)번" + BankManagerMessage.workComplete.description)
        } while watingQueue.isEmpty() == true
    }
}
