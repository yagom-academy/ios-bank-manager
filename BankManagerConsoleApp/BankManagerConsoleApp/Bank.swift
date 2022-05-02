//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by OneTool, Red on 2022/05/02.
//

import Foundation

struct Bank {
    private var banker = Banker()
    var customers = Queue(listType: DoubleStack<Customer>())
    var numberOfCustomer: Int = Const.defaultCount
    var numberOfBankers: DispatchSemaphore
    var wholeWorkTime: Double = Double.zero
    
    init(numberOfBankers: Int = Const.defaultBankerCount) {
        self.numberOfBankers = DispatchSemaphore(value: numberOfBankers)
        reset(numberOfBankers: numberOfBankers)
    }
    
    private mutating func reset(numberOfBankers: Int = Const.defaultBankerCount) {
        numberOfCustomer = Int.random(in: Const.customerRange)
        for numberTicekt in Const.startCount...numberOfCustomer {
            customers.enQueue(data: Customer(numberTicekt: numberTicekt))
        }
    }
}
