//
//  Bank.swift
//  BankManagerUIApp
//
//  Created by hyunMac on 11/15/23.
//

import Foundation

enum BankTask: String, CaseIterable {
    case deposit = "예금"
    case loan = "대출"
}

struct Bank {
    private var depositTaskLine = BankQueue<Customer>()
    private var loanTaskLine = BankQueue<Customer>()
    private let depositTellerCount: Int
    private let loanTellerCount: Int
    
    init(depositTellerCount: Int, loanTellerCount: Int) {
        self.depositTellerCount = depositTellerCount
        self.loanTellerCount = loanTellerCount
    }
        
    func start() {
        lineUp()
        tellerProcessing()
    }
    
    func lineUp() {
        let customerCount = Int.random(in: 10...30)
        
        for tiketNumber in 1...customerCount {
            guard let customerTask = BankTask.allCases.randomElement() else {
                return
            }
            if customerTask == BankTask.deposit {
                let customer = Customer(waitingNumber: tiketNumber)
                depositTaskLine.enqueue(data: customer)
            } else {
                let customer = Customer(waitingNumber: tiketNumber)
                loanTaskLine.enqueue(data: customer)
            }
        }
    }
    
    func tellerProcessing() {
        let depositTeller = Teller(processingTime: 0.7, tellerTask: "예금")
        let loanTeller = Teller(processingTime: 1.1, tellerTask: "대출")
        
        let group = DispatchGroup()
        let depositSemaphore = DispatchSemaphore(value: depositTellerCount)
        let loanSemaphore = DispatchSemaphore(value: loanTellerCount)
        
        var timeChecker = 0.0
        var customerChecker = 0
        
        let depositQueue = DispatchQueue(label: "deposit")
        let loanQueue = DispatchQueue(label: "loan")
        
        depositQueue.async(group: group) {
            depositSemaphore.wait()
            while !depositTaskLine.isEmpty() {
                guard let depositCustomer = depositTaskLine.dequeue() else { break }
                customerChecker += 1
                timeChecker += depositTeller.tellerProcessing(depositCustomer.waitingNumber)
            }
            depositSemaphore.signal()
        }
        
        loanQueue.async(group: group) {
            loanSemaphore.wait()
            while !loanTaskLine.isEmpty() {
                guard let loanCustomer = loanTaskLine.dequeue() else { break }
                customerChecker += 1
                timeChecker += loanTeller.tellerProcessing(loanCustomer.waitingNumber)
            }
            loanSemaphore.signal()
        }
        
        group.wait()
        bankClosing(timeChecker: timeChecker, customerChecker: customerChecker)
    }
    
    private func bankClosing(timeChecker: Double, customerChecker: Int) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerChecker)명 이며, 총 업무시간은 \(String(format:"%.2f",timeChecker))초입니다.")
    }
}
