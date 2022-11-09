//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Aaron, tottale on 11/3/22.
//
import Foundation

struct Bank {
    let clerks: [BankClerk]
    let customerQueue = Queue<Customer>()
    let loanQueue = Queue<Customer>()
    let depositQueue = Queue<Customer>()
    var customerCount: Int = 0
    
    init(clerkCount: Int) {
        self.clerks = Array(repeating: BankClerk(), count: clerkCount)
    }
    
    func open() {
        startBankJob()
    }
    
    func startBankJob() {
        let startTime = CFAbsoluteTimeGetCurrent()
        manageCustomerQueue()
        serve()
        let endTime = CFAbsoluteTimeGetCurrent()
        let timeInterval = endTime - startTime
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(timeInterval.formattedNumber)초입니다.")
    }
    
    func manageCustomerQueue() {
        while let customer = customerQueue.dequeue() {
            switch customer.serviceType {
            case .deposit:
                depositQueue.enqueue(customer)
                
            case .loan:
                loanQueue.enqueue(customer)
                
            }
        }
    }
    
    func serve() {
        let serialQueue = DispatchQueue(label: "serial")
        
        DispatchQueue.global().async {
            while depositQueue.isEmpty == false {
                serialQueue.sync {
                    guard let customer = depositQueue.dequeue() else {
                        return
                    }
                    clerks.first?.work(for: customer)
                }
            }
        }
        
        DispatchQueue.global().async {
            while depositQueue.isEmpty == false {
                serialQueue.sync {
                    guard let customer = depositQueue.dequeue() else {
                        return
                    }
                    clerks.first?.work(for: customer)
                }
            }
        }
        
        DispatchQueue.global().async {
            while let customer = loanQueue.dequeue() {
                clerks.first?.work(for: customer)
            }
        }
    }
    
    func close() {}
}
