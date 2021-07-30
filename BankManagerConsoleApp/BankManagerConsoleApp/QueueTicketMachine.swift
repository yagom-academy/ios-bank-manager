//
//  QueueTicket.swift
//  BankManagerConsoleApp
//
//  Created by Jost, Hosinging on 2021/07/30.
//

import Foundation

struct QueueTicketMachine {
    // MARK:- private Property
    private var queueTicketNumber: UInt = 0
    
    // MARK:- internal Methods
    mutating func issueQueueTicket() -> UInt {
        queueTicketNumber += 1
        return queueTicketNumber
    }
    
    mutating func reset() {
        queueTicketNumber = 0
    }
    
    func getCurrentTicketNumber() -> UInt {
        return queueTicketNumber
    }
}
