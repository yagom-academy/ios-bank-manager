//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by iluxsm on 2021/01/05.
//

import Foundation
import Dispatch

class BankClerk {
    let windowNumber: Int
    var isWorking: Bool = false
    var queue: DispatchQueue
    
    init(windowNumber: Int) {
        self.windowNumber = windowNumber
        queue = DispatchQueue(label: "\(windowNumber)")
    }
    
    func serveCustomers(customer: Customer) {
//        let waitingCustomers = DispatchQueue(label: "Serial Queue")
//        waitingCustomers.sync {
//
            BankerMessage.printTaskText(customer: customer.waitingNumber, customerClass: customer.customerClass.description, state: .start)
            self.isWorking = true
            usleep(700000)
            BankerMessage.printTaskText(customer: customer.waitingNumber, customerClass: customer.customerClass.description, state: .completion)
            self.isWorking = false
     //   }
    }
    
    //    func calculateTime() {
    //        let taskedTime: useconds_t = 70000 * todayCustomer
    //        return
    //    }
}
