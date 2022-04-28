//
//  BankerAndCustomer.swift
//  BankManagerConsoleApp
//
//  Created by OneTool, Red on 2022/04/28.
//

import Foundation

class Banker {
    var customer: Customer?
    
    func work() {
        guard let customerNumberTicekt = customer?.numberTicekt else {
            return
        }
        
        print("\(customerNumberTicekt)" + Const.startWorking)
        usleep(useconds_t(Const.workTimeForCustomer * Const.microsecond))
        print("\(customerNumberTicekt)" + Const.endWorking)
        customer = nil
    }
}
