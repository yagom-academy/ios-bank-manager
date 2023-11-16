//
//  Bank.swift
//
//
//  Created by Kiseok on 11/15/23.
//
import Foundation

public struct Bank {
    public let bankClerk: BankClerk = BankClerk()
    public let bankManager: BankManager = BankManager()
    public let bankManagerCount: Int
    public let customerNumber = Double.random(in: 10...30)
    public let customerLine: CustomerQueue<Customer>
    
    public init(bankManager: Int, customerLine: CustomerQueue<Customer>) {
        self.bankManagerCount = bankManager
        self.customerLine = customerLine
    }
    
    public func open() {
        bankManager.giveWaitingTicket(customerNumber: self.customerNumber,
                                      customerLine: self.customerLine
        )
        
        while customerLine.count != 0 {
            guard let ticketNumber = customerLine.dequeue()?.waitingTicket else {
                return
            }
            
            bankClerk.startTask(count: ticketNumber)
        }
    }
    
    public func close() {
        bankClerk.endTask(customerNumber: self.customerNumber)
    }
}
