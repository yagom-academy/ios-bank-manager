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
                MessageCollection.printTaskStartText(customer: customer)
                usleep(700000)
                MessageCollection.printTaskCompletionText(customer: customer)
            }
        }
        return useconds_t(700000 * customers.count)
    }
}
