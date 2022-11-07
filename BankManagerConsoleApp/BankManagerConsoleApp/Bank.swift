//
//  Bank.swift
//  BankManagerConsoleApp

import Foundation

final class Bank {
    private var waitingLine: Queue<Customer> = Queue()
    private(set) var finishedCustomerCount: Int = 0
    let timePerTask: UInt32 = 700000
    let depositQueue: DispatchQueue = DispatchQueue(label: "deposit", attributes: .concurrent)
    let loanQueue: DispatchQueue = DispatchQueue(label: "loan")
    let depositSemaphore: DispatchSemaphore = DispatchSemaphore(value: 2)
    let customerCountSemaphore: DispatchSemaphore = DispatchSemaphore(value: 1)
    let dispatchGroup: DispatchGroup = DispatchGroup()
    
    func allocateCustomer() {
        guard let customer = waitingLine.dequeue() else {
            return
        }
        
        switch customer.banking {
        case .deposit:
            depositQueue.async(group: dispatchGroup) {
                self.depositSemaphore.wait()
                self.handleBankingService(customer)
                self.depositSemaphore.signal()
            }
        case .loan:
            loanQueue.async(group: dispatchGroup) {
                self.handleBankingService(customer)
            }
        }
    }
    
    func handleBankingService(_ customer: Customer) {
        print("\(customer.waitingNumber)번 고객 \(customer.banking)업무 시작")
        
        usleep(customer.banking.timePerTask)
        
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
