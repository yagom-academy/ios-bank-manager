//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Decision: String {
    case excute = "1"
    case exit = "2"
}

func announceMessage() {
    print("1 : 은행개점\n2 : 종료")
    print("입력 : ", terminator: "")
}

func decideToStartProgram() -> Decision {
    while true {
        announceMessage()
        if let unwrappedString = readLine(),
           let decision = Decision.init(rawValue: unwrappedString) {
            return decision
        }
    }
}

func makeCustomerQueue() -> Queue<Customer> {
    let numberOfCustomers = Int.random(in: 10...30)
    var customerQueue = Queue<Customer>()
    for number in 1...numberOfCustomers {
        customerQueue.enqueue(Customer(waitingNumber: number))
    }
    return customerQueue
}

// MARK: --- main Program
while true {
    guard decideToStartProgram() == .excute else { break }
    let customerQueue = makeCustomerQueue()
    var yagomBank = Bank(customer: customerQueue)
    yagomBank.open()
    yagomBank.close()
}
