//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by OneTool, Red on 2022/04/28.
//

import Foundation

class Banker {
    func work(customer: Customer?) {
        guard let customerNumberTicekt = customer?.numberTicekt else {
            return
        }
        
        print("\(customerNumberTicekt)" + Const.startWorking)
        Thread.sleep(forTimeInterval: Const.workTimeForCustomer)
        print("\(customerNumberTicekt)" + Const.endWorking)
    }
}
