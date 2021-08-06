//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by 김준건 on 2021/07/30.
//

import Foundation

class Banker {
    let type: BusinessType
    init(type: BusinessType) {
        self.type = type
    }
    
    func doBusiness(customer: Customer) {
        print(BankMessage.workingMessage(numberTicket: customer.numberTicket,
                                         type: customer.business,
                                         isStartWork: true))
        Thread.sleep(forTimeInterval: type.workingTime)
        print(BankMessage.workingMessage(numberTicket: customer.numberTicket,
                                         type: customer.business,
                                         isStartWork: false))
    }
}
