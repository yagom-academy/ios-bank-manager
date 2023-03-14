//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Rowan, 릴라 on 2023/03/07.
//

import Foundation

protocol Openable {
    func open(totalCustomer: Int)
}

final class Bank: Openable {
    private let customerQueue: Queue<Customer>
    private let loanDepartment: BankDepartment
    private let depositDepartment: BankDepartment
    private let workGroup: DispatchGroup = DispatchGroup()
    
    init(loanBankerCount: Int, depositBankerCount: Int, customerQueue: Queue<Customer>) {
        self.loanDepartment = BankDepartment(workableBankerCount: loanBankerCount)
        self.depositDepartment = BankDepartment(workableBankerCount: depositBankerCount)
        self.customerQueue = customerQueue
    }
    
    func open(totalCustomer: Int) {
        setCustomerQueue(totalCustomer: totalCustomer)
        let processTime = ProcessTimer.calculateProcessTime(for: startWork)
        reportResult(totalCustomer: totalCustomer, processTime: processTime)
    }
    
    private func setCustomerQueue(totalCustomer: Int) {
        for number in 1...totalCustomer {
            let numberTicket = String(describing: number)
            let customer = Customer(numberTicket: numberTicket)
            customerQueue.enqueue(customer)
        }
    }
    
    private func startWork() {
        while let customer = customerQueue.dequeue(),
              let business = customer.business {
            switch business {
            case .deposit:
                depositDepartment.respond(to: customer, workGroup: workGroup)
            case .loan:
                loanDepartment.respond(to: customer, workGroup: workGroup)
            }
        }
        
        workGroup.wait()
    }
    
    private func reportResult(totalCustomer: Int, processTime: CFAbsoluteTime) {
        let roundedProcessTime = round(processTime * 100) / 100
        let message = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 \(roundedProcessTime)초 입니다."
        print(message)
    }
}
