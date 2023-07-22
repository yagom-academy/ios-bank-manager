//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by karen on 2023/07/14.
//

import Foundation

struct Bank {
    private var customersQueue: Queue<Customer> = Queue<Customer>()
    private let depositSemaphore = DispatchSemaphore(value: TaskType.deposit.tellerCount)
    private let loanSemaphore = DispatchSemaphore(value: TaskType.loan.tellerCount)
    private let depositProcessingTime: TimeInterval = 0.7
    private let loanProcessingTime: TimeInterval = 1.1
    private var totalProcessingTime = ""
    private var customerCount = UInt.zero
    var state: State = .working
    
    mutating func open() {
        lineUpCustomers()
        totalProcessingTime = timeCheck {
            dailyWork()
        }
        finish()
    }
    
    private mutating func lineUpCustomers() {
        let customerCount = UInt.random(in: 10...30)
        let customers = (1...customerCount)
        customers.map(createCustomerTask).forEach { customersQueue.enqueue($0) }
    }
    
    private func createCustomerTask(number: UInt) -> Customer {
        let taskType: TaskType = Bool.random() ? .deposit : .loan
        return Customer(waitingNumber: number, taskType: taskType)
    }
    
    private mutating func dailyWork() {
        let group = DispatchGroup()
        
        while !customersQueue.isEmpty {
            guard let customer = customersQueue.dequeue() else { return }

            process(customer: customer, group: group)
            customerCount += 1
        }
        group.wait()
    }
    
    private func process(customer: Customer, group: DispatchGroup) {
        switch customer.taskType {
        case .deposit:
            DispatchQueue.global().async(group: group) {
                depositSemaphore.wait()
                processDeposit(customer: customer)
                depositSemaphore.signal()
            }
        case .loan:
            DispatchQueue.global().async(group: group) {
                loanSemaphore.wait()
                processLoan(customer: customer)
                loanSemaphore.signal()
            }
        }
    }
    
    private func processDeposit(customer: Customer) {
        print("\(customer.waitingNumber)번 고객 예금업무 시작")
        Thread.sleep(forTimeInterval: depositProcessingTime)
        print("\(customer.waitingNumber)번 고객 예금업무 완료")
    }

    private func processLoan(customer: Customer) {
        print("\(customer.waitingNumber)번 고객 대출업무 시작")
        Thread.sleep(forTimeInterval: loanProcessingTime)
        print("\(customer.waitingNumber)번 고객 대출업무 완료")
    }
    
    private func timeCheck(_ block: () -> Void) -> String {
        let startTime = CFAbsoluteTimeGetCurrent()
        block()
        let durationTime = CFAbsoluteTimeGetCurrent() - startTime
        let time = String(format: "%.2f", durationTime)
        return time
    }
    
    private mutating func finish() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(totalProcessingTime)초입니다.")
        reset()
    }
    
    mutating func close() {
        state = .notWorking
    }
    
    private mutating func reset() {
        customersQueue.clear()
        customerCount = .zero
        totalProcessingTime = ""
    }
}

extension Bank {
    enum State {
        case working
        case notWorking
    }
    
    enum TaskType {
        case deposit
        case loan

        var tellerCount: Int {
            switch self {
            case .deposit:
                return 2
            case .loan:
                return 1
            }
        }
    }
}
