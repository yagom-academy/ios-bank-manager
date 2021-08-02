//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private enum Menu: String {
        case open = "1"
        case close = "2"

        var userInput: String {
            self.rawValue
        }
    }
    
    let clerk = Clerk()
    let customerQueue = Queue<Customer>()
    
    func receiveCustomers() {
        let minimumCustomerNumber = 10
        let maximumCustomerNumber = 30
        let numberOfCustomer = Int.random(in: minimumCustomerNumber...maximumCustomerNumber)
        
        for number in 1...numberOfCustomer {
            customerQueue.enqueue(data: Customer(waitingNumber: number))
        }
    }
}
