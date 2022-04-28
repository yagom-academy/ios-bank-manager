//
//  BankManager.swift
//  Created by OneTool, Red
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Customer {
    let numberTicekt: Int
}

struct BankManager {
    var bankers: [Banker] = []
    var customers = Queue(listType: DoubleStack<Customer>())
    
    init(numberOfBanker: Int = 1) {
        let numberOfCustomer = Int.random(in: 10...30)
        
        for numberTicekt in 1...numberOfCustomer {
            customers.enQueue(data: Customer(numberTicekt: numberTicekt))
        }
        
        for _ in 1...numberOfBanker {
            bankers.append(Banker())
        }
    }
    
    mutating func distributeCustomer() {
        _ = bankers.map { banker in
            if customers.isEmpty == false {
                let customer = customers.deQueue()
                banker.customer = customer
                banker.work()
            }
        }
    }
    
    mutating func startWork() {
        while customers.isEmpty == false {
            distributeCustomer()
        }
    }
}

