//
//  Bank.swift
//  BankManagerConsoleApp

import Foundation

final class Bank: Bankable {
    var waitingLine: Queue<Customer> = Queue()
    var finishedCustomerCount: Int = 0
    var depositQueue: DispatchQueue = DispatchQueue(label: "deposit", attributes: .concurrent)
    var loanQueue: DispatchQueue = DispatchQueue(label: "loan")
    var depositSemaphore: DispatchSemaphore
    var loanSemaphore: DispatchSemaphore
    var customerCountSemaphore: DispatchSemaphore = DispatchSemaphore(value: 1)
    var bankingServiceGroup: DispatchGroup = DispatchGroup()
    
    init(depositBooth: Int, loanBooth: Int) {
        self.depositSemaphore = DispatchSemaphore(value: depositBooth)
        self.loanSemaphore = DispatchSemaphore(value: loanBooth)
    }
    
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
                self.loanSemaphore.wait()
                self.handleBankingService(customer)
                self.loanSemaphore.signal()
            }
        }
    }
    
    func handleBankingService(_ customer: Customer) {
        print("\(customer.waitingNumber)번 고객 \(customer.banking.serviceName)업무 시작")
        
        Thread.sleep(forTimeInterval: customer.banking.timePerService)
        
        print("\(customer.waitingNumber)번 고객 \(customer.banking.serviceName)업무 완료")
        
        customerCountSemaphore.wait()
        finishedCustomerCount += 1
        customerCountSemaphore.signal()
    }
}
