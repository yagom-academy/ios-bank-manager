//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Rowan, 릴라 on 2023/03/07.
//

import Foundation

protocol workable {
    var customerQueue: CustomerQueue<Customer> { get }
    
    
    func open(totalCustomer: Int)
    func setCustomerQueue(totalCustomer: Int)
    func reportResult(totalCustomer: Int, processTime: CFAbsoluteTime)
}

final class Bank {
    private let customerQueue: CustomerQueue = CustomerQueue<Customer>()
    private let loanBanker: Banker
    private let depositBanker: Banker
    private let workQueue: DispatchQueue = DispatchQueue(label: "workQueue", attributes: .concurrent)
    private let workGroup: DispatchGroup = DispatchGroup()
    
    init(loanBankerCount: Int, depositBankerCount: Int) {
        self.loanBanker = Banker(department: DispatchSemaphore(value: loanBankerCount))
        self.depositBanker = Banker(department: DispatchSemaphore(value: depositBankerCount))
    }
    
    func open(totalCustomer: Int) {
        setCustomerQueue(totalCustomer: totalCustomer)
        let processTime = checkProcessTime(for: startWork)
        reportResult(totalCustomer: totalCustomer, processTime: processTime)
    }
    
    private func setCustomerQueue(totalCustomer: Int) {
        for number in 1...totalCustomer {
            let numberTicket = String(describing: number)
            let customer = Customer(numberTicket: numberTicket)
            customerQueue.enqueue(customer)
        }
    }
    
    private func checkProcessTime(for process: () -> Void) -> CFAbsoluteTime {
        let startTime = CFAbsoluteTimeGetCurrent()
        process()
        let processTime = CFAbsoluteTimeGetCurrent() - startTime
        
        return processTime
    }
    
    private func startWork() {
        while let customer = customerQueue.dequeue(),
              let business = customer.business {
            switch business {
            case .deposit:
                depositBanker.respond(to: customer, workGroup: workGroup)
            case .loan:
                loanBanker.respond(to: customer, workGroup: workGroup)
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
