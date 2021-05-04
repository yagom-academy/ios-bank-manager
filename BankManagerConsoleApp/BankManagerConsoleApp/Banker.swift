//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by 오인탁 on 2021/05/04.
//

import Foundation

struct Banker {
    var workTime: Double = 0
    
    mutating func bankerWorkProgress(customer: Customer) {
        print("\(customer.waitNumber)번 \(customer.tier.rawValue)고객 \(customer.business.rawValue)업무 시작")
        switch customer.business {
        case .deposit:
            usleep(700000)
            self.workTime += 0.7
        default:
            usleep(1100000)
            self.workTime += 1.1
        }
        
        print("\(customer.waitNumber)번 \(customer.tier.rawValue)고객 \(customer.business.rawValue)업무 완료")
    }
    
}
