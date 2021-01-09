//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by iluxsm on 2021/01/05.
//

import Foundation
import Dispatch

struct BankClerk {
    let windowNumber: Int
    
    init(windowNumber: Int) {
        self.windowNumber = windowNumber
    }
    
    func serveCustomers(customers: Customer) {
        let waitingCustomers = DispatchQueue(label: "Serial Queue")
        waitingCustomers.sync {
            
            BankerMessage.printTaskText(customer: waitNumber, customerClass: customerClassMessage, state: .start)
            usleep(70000)
            BankerMessage.printTaskText(customer: waitNumber, customerClass: customerClassMessage, state: .completion)
        }
    }
    
//    func calculateTime() {
//        let taskedTime: useconds_t = 70000 * todayCustomer
//        return
//    }
}
