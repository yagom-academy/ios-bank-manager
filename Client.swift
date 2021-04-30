//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class Client: Operation {
    var waitingNumber: Int?
    var creditRate: creditRating?
    var typeOfWork: workType?
    
    override func main() {
        guard let client = waitingNumber, let credit = creditRate, let taskType = typeOfWork else {
            return
        }
        work(client, credit, taskType)
        
    }
    
    private func work(_ waitingNumber: Int, _ credit: creditRating, _ taskType: workType) {
        switch taskType {
        case .deposit:
            print("\(waitingNumber)번 \(credit)고객 \(taskType.description)업무 시작")
            Thread.sleep(forTimeInterval: workType.deposit.duration)
            print("\(waitingNumber)번 \(credit)고객 \(taskType.description)업무 완료")
        case .loan:
            print("\(waitingNumber)번 \(credit)고객 \(taskType.description)업무 시작")
            Thread.sleep(forTimeInterval: workType.loan.duration)
            print("\(waitingNumber)번 \(credit)고객 \(taskType.description)업무 완료")
        }
    }
}

