//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by kjs on 2021/08/02.
//

import Foundation

struct BankClerk {
    let id: Int
    
    func startTask(about customer: Customer?) {
        guard let customer = customer else {
            return
        }
        
        print("\(customer.id)번 고객 업무 시작")
        usleep(700000)
        print("\(customer.id)번 고객 업무 종료")
    }
}
