//
//  BankClerk .swift
//  BankManagerConsoleApp
//
//  Created by hoon, minsup on 2023/07/14.
//

import Foundation

struct BankClerk {
    func work(customer: Customer) -> Double {
        print("\(customer.priority)번 고객 업무 시작")
        usleep(UInt32(customer.taskTime * 1000000))
        print("\(customer.priority)번 고객 업무 완료")
        
        return customer.taskTime
    }
}
