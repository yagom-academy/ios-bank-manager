//
//  Bank.swift
//  BankManagerUIApp
//
//  Created by Rowan, 릴라 on 2023/03/07.
//

import Foundation

final class Bank {
    private var customerQueue: any CustomerQueueable
    private var depositDepartment: Respondable
    private var loanDepartment: Respondable
    private var currentNumberTicket: Int = 1
    
    init(depositDepartment: Respondable, loanDepartment: Respondable, customerQueue: any CustomerQueueable) {
        self.depositDepartment = depositDepartment
        self.loanDepartment = loanDepartment
        self.customerQueue = customerQueue
    }
    
    convenience init(depositBankerCount: Int, loanBankerCount: Int) {
        let depositDepartment = BankDepartment(workableBankerCount: depositBankerCount)
        let loanDepartment = BankDepartment(workableBankerCount: loanBankerCount)
        let customerQueue = CustomerQueue()
        
        self.init(depositDepartment: depositDepartment,
                  loanDepartment: loanDepartment,
                  customerQueue: customerQueue)
    }
    
    func open(totalCustomer: Int) {
        setCustomerQueue(totalCustomer: totalCustomer)
        startWork()
    }
    
    private func setCustomerQueue(totalCustomer: Int) {
        for _ in 1...totalCustomer {
            let numberTicket = String(describing: currentNumberTicket)
            currentNumberTicket += 1
            let customer = Customer(numberTicket: numberTicket)
            customerQueue.enqueue(customer)
            
            NotificationCenter.default.post(name: .waiting,
                                            object: nil,
                                            userInfo: [NotificationKey.waiting: customer])
        }
    }
    
    private func startWork() {
        while let customer = customerQueue.dequeue(),
              let business = customer.business {
            switch business {
            case .deposit:
                depositDepartment.respond(to: customer)
            case .loan:
                loanDepartment.respond(to: customer)
            }
        }
    }
    
    func close() {
        loanDepartment.cancelTasks()
        depositDepartment.cancelTasks()
        currentNumberTicket = 1
    }
}
