//
//  Bank.swift
//
//
//  Created by Kiseok on 11/15/23.
//
import Foundation

@available(macOS 10.15, *)
public struct Bank {
    public static let notificationName = Notification.Name("BankNotification")
    private let bankClerk: BankClerk = .init()
    private let bankManager: BankManager = .init()
    private let customerNumber = Int.random(in: 10...30)
    private let depositLine: CustomerQueue<Customer> = .init()
    private let loanLine: CustomerQueue<Customer> = .init()
    
    public init() {}
    
    public func open() {
        bankManager.giveWaitingTicketAndLineUp(
            customerNumber: customerNumber,
            depositLine: depositLine,
            loanLine: loanLine
        )
        
        let firstBankClerk: BankClerk = .init()
        let secondBankClerk: BankClerk = .init()
        let thirdBankClerk: BankClerk = .init()
        
        Task {
            let taskStart = CFAbsoluteTimeGetCurrent()
            while depositLine.hasCustomer != 0 || loanLine.hasCustomer != 0 {
                await withTaskGroup(of: Void.self) { group in
                    group.addTask {
                        guard let loanCustomer = loanLine.dequeue() else {
                            return
                        }
                        await thirdBankClerk.startTask(customer: loanCustomer)
                    }
                    
                    group.addTask {
                        guard let depositCustomer = depositLine.dequeue() else {
                            return
                        }
                        await firstBankClerk.startTask(customer: depositCustomer)
                    }
                    
                    group.addTask {
                        guard let depositCustomer = depositLine.dequeue() else {
                            return
                        }
                        await secondBankClerk.startTask(customer: depositCustomer)
                    }
                }
            }
            let taskEnd = CFAbsoluteTimeGetCurrent() - taskStart
            
            close(time: taskEnd)
            NotificationCenter.default.post(name: Bank.notificationName, object: nil)
        }
    }
    
    private func close(time: CFAbsoluteTime) {
        bankClerk.endTask(
            customerNumber: self.customerNumber,
            time: time
        )
    }
}
