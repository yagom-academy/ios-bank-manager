//
//  Teller.swift
//  BankManagerUIApp
//
//  Created by 박세웅 on 2022/05/05.
//

import Foundation

struct Teller {
    func work(for customer: Customer) {
        guard let task = customer.bankingType else {
            return
        }
        
        Thread.sleep(forTimeInterval: task.workTime)
    }
}
