//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 쿼카, 두기 on 2022/04/28.
import Foundation

protocol BankDelegate: AnyObject {
    func sendAddedCustomer(customer: Customer)
    func sendTaskingCustomer(customer: Customer)
    func sendEndCustomer(customer: Customer)
    func sendFinishWork()
}

struct Bank {
    enum Task: CaseIterable {
        case deposit
        case loan
        
        var clerkCount: Int {
            switch self {
            case .deposit:
                return 2
            case .loan:
                return 1
            }
        }
        
        var title: String {
            switch self {
            case .deposit:
                return "예금"
            case .loan:
                return "대출"
            }
        }
    }

    private var customerQueue = Queue<Customer>()
    private var totalCustomerCount = Int.zero
    let depositQueue = OperationQueue()
    let loanQueue = OperationQueue()
    
    weak var delegate: BankDelegate?
    
    private mutating func receiveCustomer() {
        for _ in 1...10 {
            guard let task = Task.allCases.randomElement() else {
                return
            }
            totalCustomerCount += 1
            let customer = Customer(number: totalCustomerCount, task: task)
            customerQueue.enqueue(newElement: customer)
            delegate?.sendAddedCustomer(customer: customer)
        }
    }
    
    private mutating func sendCustomerToClerk() {
        while !customerQueue.isEmpty {
            guard let customer = customerQueue.dequeue() else {
                return
            }
            matchToClerk(customer: customer)
        }
        depositQueue.addBarrierBlock { [self] in
            delegate?.sendFinishWork()
        }
        loanQueue.addBarrierBlock { [self] in
            delegate?.sendFinishWork()
        }
    }
    
    private func matchToClerk(customer: Customer) {
        switch customer.task {
        case .deposit:
            depositQueue.maxConcurrentOperationCount = Task.deposit.clerkCount
            depositQueue.addOperation {
                delegate?.sendTaskingCustomer(customer: customer)
                BankClerk.startDepositWork(customer: customer)
                delegate?.sendEndCustomer(customer: customer)
            }
        case .loan:
            loanQueue.maxConcurrentOperationCount = Task.loan.clerkCount
            loanQueue.addOperation {
                delegate?.sendTaskingCustomer(customer: customer)
                BankClerk.startLoanWork(customer: customer)
                delegate?.sendEndCustomer(customer: customer)
            }
        }
    }
    
    mutating func openBank() {
        receiveCustomer()
        sendCustomerToClerk()
    }
}
