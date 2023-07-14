//
//  BankTeller.swift
//  BankManagerConsoleApp
//
//  Created by Dasan & Mary on 2023/07/12.
//

import Foundation

struct BankTeller {
    let processingTime: Double = 0.7
    
    func doWork(for customer: Customer) {
        print(String(format: MessageFormat.startTask, customer.numberTicket))
        Thread.sleep(forTimeInterval: processingTime)
        print(String(format: MessageFormat.finishTask, customer.numberTicket))
    }
}

extension BankTeller {
    private enum MessageFormat {
        static let startTask: String = "%u번 고객 업무 시작"
        static let finishTask: String = "%u번 고객 업무 완료"
    }
}
