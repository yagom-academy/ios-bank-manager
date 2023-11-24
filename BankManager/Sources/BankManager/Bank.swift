//
//  Bank.swift
//
//
//  Created by Kiseok on 11/15/23.
//
import Foundation

@available(macOS 10.15, *)
public struct Bank {
    private let bankClerk: BankClerk = .init()
    private let bankManager: BankManager = .init()
    private let customerNumber = Int.random(in: 10...30)
    private let firstDepositLine: CustomerQueue<Customer> = .init()
    private let secondDepositLine: CustomerQueue<Customer> = .init()
    private let loanLine: CustomerQueue<Customer> = .init()
    
    public init() {}
    
    public func open() {
        bankManager.giveWaitingTicketAndLineUp(
            customerNumber: customerNumber,
            firstDepositLine: firstDepositLine,
            secondDepositLine: secondDepositLine,
            loanLine: loanLine
        )
        
        let taskStart = CFAbsoluteTimeGetCurrent()
        while customerLine.hasCustomer != 0 {
            guard let ticketNumber = customerLine.dequeue()?.waitingTicket else {
                return
            }
            
            bankClerk.startTask(count: ticketNumber)
        }
        let taskEnd = CFAbsoluteTimeGetCurrent() - taskStart
        
        close(time: taskEnd)
    }
    
    private func close(time: CFAbsoluteTime) {
        bankClerk.endTask(
            customerNumber: self.customerNumber,
            time: time
        )
    }
}
