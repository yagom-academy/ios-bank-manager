//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Wonhee on 2021/01/04.
//

import Foundation

private enum CustomerMessage {
    static let start = "번 고객 업무 시작"
    static let end = "번 고객 업무 완료"
}

struct Customer {
    let waitingNumber: Int
    let taskAmount: Int
    
    var startMessage: String {
        return "\(waitingNumber)\(CustomerMessage.start)"
    }
    var endMessage: String {
        return "\(waitingNumber)\(CustomerMessage.end)"
    }
}
