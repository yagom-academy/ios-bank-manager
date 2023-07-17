//
//  BankClerk .swift
//  BankManagerConsoleApp
//
//  Created by hoon, minsup on 2023/07/14.
//

import Foundation

struct BankClerk {
    func work(customer: Customer) -> Double {
        print("\(customer.numberTicket)번 고객 업무 시작")
        usleep(UInt32(customer.task.information.time * 1000000))
        print("\(customer.numberTicket)번 고객 업무 완료")
        
        return customer.task.information.time
    }
}
