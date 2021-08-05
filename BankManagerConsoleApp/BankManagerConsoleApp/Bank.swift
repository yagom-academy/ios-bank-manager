//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 이윤주 on 2021/08/03.
//

import Foundation

struct Bank {
    private var bankClerk = BankClerk()
    private var waitingLine = Queue<Customer>()
}

extension Bank {
    mutating func makeWaitingLine(from totalCustomerNumber: Int) {
        for i in 1...totalCustomerNumber {
            waitingLine.enqueue(Customer(ticketNumber: i))
        }
    }
    
    private func handleLoan(_ customer: Customer, _ loanWorkTime: Double) {
        let loanQueue = DispatchQueue(label: "loanQueue")
        loanQueue.async {
            bankClerk.work(for: customer, during: loanWorkTime)
        }
    }
    
    private func handleDeposit(_ semaphoreValue: Int, _ customer: Customer, _ depositWorkTime: Double) {
        let semaphore = DispatchSemaphore(value: semaphoreValue)
        semaphore.wait()
        DispatchQueue.global().async {
            bankClerk.work(for: customer, during: depositWorkTime)
            semaphore.signal()
        }
    }
    
    mutating func letClerkWork(_ customer: Customer) {
        let loanWorkTime = 1.1
        let depositWorkTime = 0.7

        guard let customerBusiness = customer.business else {
            return
        }
                
        switch customerBusiness {
        case "대출":
            handleLoan(customer, loanWorkTime)
        case "예금":
            handleDeposit(2, customer, depositWorkTime)
        default:
            print("unknown")
        }
    }
    
    mutating func notifyClosing(totalCustomer: Int, totalTime: String) {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.roundingMode = .halfUp
        let convertedTotalTime = numberFormatter.string(for: Double(totalTime)) ?? "0"
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 \(convertedTotalTime)초입니다.")
    }
}
