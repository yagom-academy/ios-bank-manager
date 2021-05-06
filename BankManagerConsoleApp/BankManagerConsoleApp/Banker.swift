//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by 오인탁 on 2021/05/04.
//

import Foundation

final class Banker {
    var workTime: Double = 0
    let semaphore = DispatchSemaphore(value: 1)

    func bankerWorkProgress(customers: inout [Customer]) {
        while customers.count > 0 {
            semaphore.wait()
            let customer: Customer = customers.removeFirst()
            semaphore.signal()
            
            print("🟢\(customer.waitNumber)번 \(customer.tier.tierName)고객 \(customer.business.rawValue)업무 시작")
            
            switch customer.business {
            case .deposit:
                usleep(700000)
                self.workTime += 0.7
            default:
                usleep(1100000)
                self.workTime += 1.1
            }
            
            print("🔵\(customer.waitNumber)번 \(customer.tier.tierName)고객 \(customer.business.rawValue)업무 완료")
        }
    }

}
