//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Teller {
    let counterNumber: Int
    let identityNumber: Int
}

struct Client {
    let waitingNumber: Int
    let taskTime: Double
    let task: BankTaskOperation
    
    init(waitingNumber: Int, taskTime: Double) {
        self.waitingNumber = waitingNumber
        self.taskTime = taskTime
        self.task = BankTaskOperation(waitingNumber, taskTime)
    }
}

class BankTaskOperation: Operation {
    let clientNumber: Int
    let taskTime: Double
    
    init(_ clientNumber: Int, _ taskTime: Double) {
        self.clientNumber = clientNumber
        self.taskTime = taskTime
    }
    
    override func main() {
        print("\(clientNumber)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: taskTime)
        print("\(clientNumber)번 고객 업무 완료")
    }
}
