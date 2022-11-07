//
//  Bank.swift
//  BankManagerConsoleApp

import Foundation

final class Bank {
    private var waitingLine: Queue<Customer> = Queue()
    private(set) var finishedCustomerCount: Int = 0
    private let depositQueue: DispatchQueue = DispatchQueue(label: "deposit", attributes: .concurrent)
    private let loanQueue: DispatchQueue = DispatchQueue(label: "loan")
    private let depositSemaphore: DispatchSemaphore = DispatchSemaphore(value: 2)
    private let customerCountSemaphore: DispatchSemaphore = DispatchSemaphore(value: 1)
    let bankingServiceGroup: DispatchGroup = DispatchGroup()
    
    func allocateCustomer() {
        guard let customer = waitingLine.dequeue() else {
            return
        }
        
        switch customer.banking {
        case .deposit:
            depositQueue.async(group: bankingServiceGroup) {
                self.depositSemaphore.wait()
                self.handleBankingService(customer)
                self.depositSemaphore.signal()
            }
        case .loan:
            loanQueue.async(group: bankingServiceGroup) {
                self.handleBankingService(customer)
            }
        }
    }
    
    private func handleBankingService(_ customer: Customer) {
        print("\(customer.waitingNumber)번 고객 \(customer.banking)업무 시작")
        
        Thread.sleep(forTimeInterval: customer.banking.timePerTask)
        
        print("\(customer.waitingNumber)번 고객 \(customer.banking)업무 완료")
        
        customerCountSemaphore.wait()
        finishedCustomerCount += 1
        customerCountSemaphore.signal()
    }
    
    func addCustomer(_ customer: Customer) {
        waitingLine.enqueue(customer)
    }
    
    func resetFinishedCustomerCount() {
        finishedCustomerCount = 0
    }
}
