//
//  Bank.swift
//  
//
//  Created by Hisop on 2023/11/17.
//

import Foundation

public final class Bank {
    private var name: String
    private var customerCount: Int = 0
    private var workTime: Double = 0
    
    private let customerQueue = CustomerQueue<Customer>()
    private let depositQueue = CustomerQueue<Customer>()
    private let loanQueue = CustomerQueue<Customer>()
    
    private let depositSemaphore = DispatchSemaphore(value: 1)
    private let loanSemaphore = DispatchSemaphore(value: 1)
    private let BankSemaphore = DispatchSemaphore(value: 1)
    
    private var employeesList: [Employees] = []
    
    init(name: String, chargeDepositCount: Int, chargeLoanCount: Int) {
        self.name = name
        for _ in 1...chargeDepositCount {
            employeesList.append(Employees(business: .deposit, semaphore: depositSemaphore))
        }
        for _ in 1...chargeLoanCount {
            employeesList.append(Employees(business: .loan, semaphore: loanSemaphore))
        }
    }
    
    public func open() {
        addCustomer()
        addQueue()
        employeesWork()
        endWork()
    }
    
    private func addQueue() {
        while customerQueue.isEmpty() == false {
            guard let customer = customerQueue.dequeue() else {
                return
            }
            switch customer.business {
            case .deposit:
                depositQueue.enqueue(value: customer)
            case .loan:
                loanQueue.enqueue(value: customer)
            }
        }
    }
    
    private func employeesWork() {
        let group = DispatchGroup()
        
        for employees in employeesList {
            DispatchQueue.global().async(group: group, execute: makeWork(employees: employees))
        }
        group.wait()
    }
    
    private func makeWork(employees: Employees) -> DispatchWorkItem {
        DispatchWorkItem(block: { [self] in
            var queue: CustomerQueue<Customer>
            switch employees.business {
            case .deposit:
                queue = depositQueue
            case .loan:
                queue = loanQueue
            }
            while queue.isEmpty() == false {
                employees.semaphore.wait()
                guard let customer = queue.dequeue() else {
                    return
                }
                employees.semaphore.signal()
                
                WorkReport.startWork(customer: customer)
                Thread.sleep(forTimeInterval: employees.business.workTime)
                
                BankSemaphore.wait()
                workTime += employees.business.workTime
                customerCount += 1
                BankSemaphore.signal()
                
                WorkReport.endWork(customer: customer)
            }
        })
    }
    
    private func endWork() {
        WorkReport.endWorkString(customerCount: customerCount, workTime: workTime)
        customerCount = 0
        workTime = 0
    }
    
    private func addCustomer() {
        let count = Int.random(in: 10...30)
        for number in 1...count {
            customerQueue.enqueue(value: Customer(number: number))
        }
    }
}
