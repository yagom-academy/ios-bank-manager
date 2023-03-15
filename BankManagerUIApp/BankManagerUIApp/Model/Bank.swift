//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Rowan, 릴라 on 2023/03/07.
//

import Foundation

protocol Openable {
    var processTime: CFAbsoluteTime? { get }
    
    func open(totalCustomer: Int)
    func reportResult(totalCustomer: Int, processTime: CFAbsoluteTime) -> String
}

final class Bank: Openable {
    private var customerQueue: any CustomerQueueable
    private var loanDepartment: Respondable
    private var depositDepartment: Respondable
    private var currentNumberTicket: Int = 1
    var processTime: CFAbsoluteTime?
    
    init(loanDepartment: Respondable, depositDepartment: Respondable, customerQueue: any CustomerQueueable) {
        self.loanDepartment = loanDepartment
        self.depositDepartment = depositDepartment
        self.customerQueue = customerQueue
    }
    
    convenience init(loanBankerCount: Int, depositBankerCount: Int) {
        let loanDepartment = BankDepartment(workableBankerCount: 1)
        let depositDepartment = BankDepartment(workableBankerCount: 2)
        let customerQueue = CustomerQueue()
        self.init(loanDepartment: loanDepartment,
                  depositDepartment: depositDepartment,
                  customerQueue: customerQueue)
    }
    
    func open(totalCustomer: Int) {
        setCustomerQueue(totalCustomer: totalCustomer)
        let processTime = ProcessTimer.calculateProcessTime(for: startWork)
        let result = self.reportResult(totalCustomer: currentNumberTicket, processTime: processTime)
        print(result)
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
    
    func reportResult(totalCustomer: Int, processTime: CFAbsoluteTime) -> String {
        let roundedProcessTime = round(processTime * 100) / 100
        let message = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 \(roundedProcessTime)초 입니다."
        
        return message
    }
    
    func close() {
        loanDepartment.cancelTasks()
        depositDepartment.cancelTasks()
    }
}
