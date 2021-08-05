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
    
    mutating func dequeueCustomer() -> Customer? {
        return waitingLine.dequeue()
    }
    
    private func handleLoan(_ customer: Customer, _ loanWorkTime: Double) {
        let loanQueue = DispatchQueue(label: "loanQueue")
        loanQueue.async {
            bankClerk.work(for: customer, during: loanWorkTime)
        }
    }
    
    private func handleDeposit(_ semaphoreValue: Int, _ customer: Customer, _ depositWorkTime: Double) {
        let semaphore = DispatchSemaphore(value: semaphoreValue)
        let depositGroup = DispatchGroup()
        depositGroup.enter()
        semaphore.wait()
        DispatchQueue.global().async(group: depositGroup) {
            bankClerk.work(for: customer, during: depositWorkTime)
            semaphore.signal()
            depositGroup.leave()
        }
    }
    
    mutating func letClerkWork(_ loanWorkTime: Double, _ depositWorkTime: Double) {
        guard let currentCustomer = dequeueCustomer(),
              let customerBusiness = currentCustomer.business else {
            return
        }
        
        switch customerBusiness {
        case "대출":
            handleLoan(currentCustomer, loanWorkTime)
        case "예금":
            handleDeposit(2, currentCustomer, depositWorkTime)
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
