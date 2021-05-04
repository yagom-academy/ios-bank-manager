//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by 오인탁 on 2021/05/04.
//

import Foundation

struct Banker {
    
    func bankerWorkProgress(customerNumber: Int) {
        print("\(customerNumber)번 고객 업무 시작")
        usleep(700000)
        print("\(customerNumber)번 고객 업무 완료")
    }
    
    func matchBankerAndCustomer(customers: inout [Customer]) -> Int {
        let customer: Customer = customers.removeFirst()
        
        return customer.waitNumber
    }
    
}
