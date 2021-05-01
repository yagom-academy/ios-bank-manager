//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

protocol Bank: class {
    var numberTicket: Int { get set }
    
    func openAlert()
    func closeAlert()
    func giveNumberTicket() -> Int
}

extension Bank {
    var numerTicket: Int {
        numberTicket += 1
        return numberTicket
    }
    
    func giveNumberTicket() -> Int {
        return 1
    }
}

protocol Customer {
    var ticketNumber: Int { get }
}
