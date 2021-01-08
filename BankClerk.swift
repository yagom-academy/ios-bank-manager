//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by iluxsm on 2021/01/05.
//

import Foundation
import Dispatch

struct BankClerk {
    func serveCustomers(customers: Int) -> useconds_t {
        let waitingCustomers = DispatchQueue(label: "Serial Queue")
        waitingCustomers.sync {
            for customer in 1...customers {
                BankerMessage.printTaskText(customer: customer, state: .start)
                usleep(700000)
                BankerMessage.printTaskText(customer: customer, state: .completion)
            }
        }
        return useconds_t(700000 * customers)
    }
}
