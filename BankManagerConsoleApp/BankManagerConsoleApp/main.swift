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

func displayMenu() {
    print("1 : 은행개점\n2 : 종료")
    print("입력 : ", terminator: "")
}

func decideToStartProgram() -> Decision {
    while true {
        displayMenu()
        if let unwrappedString = readLine(),
           let decision = Decision.init(rawValue: unwrappedString) {
            return decision
        }
    }
}

func makeClientQueue() -> Queue<Client> {
    let numberOfCustomers = Int.random(in: 10...30)
    var clientQueue = Queue<Client>()
    for number in 1...numberOfCustomers {
        clientQueue.enqueue(Client(waitingNumber: number))
    }
    return clientQueue
}

// MARK: --- main Program
while true {
    guard decideToStartProgram() == .excute else { break }
    let clientQueue = makeClientQueue()
    var yagomBank = BankManager(client: clientQueue)
    yagomBank.open()
    yagomBank.close()
}
