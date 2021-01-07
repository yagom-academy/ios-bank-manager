//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by iluxsm on 2021/01/05.
//

import Foundation
import Dispatch

struct BankClerk {
    func serveCustomers(customers: [Int]) -> useconds_t {
        let waitingCustomers = DispatchQueue(label: "Serial Queue")
        waitingCustomers.sync {
            for customer in customers {
                print("\(customer)번 고객 업무 시작")
                usleep(700000)
                print("\(customer)번 고객 업무 완료")
            }
        }
        return useconds_t(700000 * customers.count)
    }
}
