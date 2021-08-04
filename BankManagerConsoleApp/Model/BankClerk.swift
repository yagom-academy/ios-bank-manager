//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by kjs on 2021/08/02.
//

import Foundation

struct BankClerk {
    let id: Int
    
    func doTask(about customer: Customer?) {
        guard let customer = customer else {
            return
        }
        
        print("\(customer.id)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: customer.businessType.requiredTime)
        print("\(customer.id)번 고객 업무 종료")
    }
}
