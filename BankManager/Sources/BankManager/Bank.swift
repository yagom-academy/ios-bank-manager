//
//  Bank.swift
//  BankManagerUIApp
//
//  Created by hyunMac on 11/15/23.
//

import Foundation

struct Bank {
    private var customerCount: Int?
    private var depositTaskLine = BankQueue<Customer>()
    private var loanTaskLine = BankQueue<Customer>()
    
    mutating func setUpBank(customerCount: Int) {
        self.customerCount = customerCount
    }
    
    func bankStart() {
        lineUp()
        tellerProcessing()
    }
    
    func lineUp() {
        guard let lastCustomerCount = customerCount else { return }
        let bankTask = ["예금","대출"]
        
        for tiketNumber in 1...lastCustomerCount {
            guard let customerTask = bankTask.randomElement() else {
                return
            }
            if customerTask == "예금" {
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
        let depositSemaphore = DispatchSemaphore(value: 2)
        let loanSemaphore = DispatchSemaphore(value: 1)
        
        var totalDepositTaskTime = 0.0
        var totalLoneTaskTime = 0.0
        
        
        DispatchQueue.global().async(group: group) {
            depositSemaphore.wait()
            while !depositTaskLine.isEmpty() {
                guard let depositCustomer = depositTaskLine.dequeue() else { break }
                totalDepositTaskTime += depositTeller.tellerProcessing(depositCustomer.waitingNumber)
            }
            depositSemaphore.signal()
        }
        
        DispatchQueue.global().async(group: group) {
            loanSemaphore.wait()
            while !loanTaskLine.isEmpty() {
                guard let loanCustomer = loanTaskLine.dequeue() else { break }
                totalLoneTaskTime += loanTeller.tellerProcessing(loanCustomer.waitingNumber)
            }
            loanSemaphore.signal()
        }

        group.notify(queue: .main) {
            bankClosing(timeChecker: totalDepositTaskTime + totalLoneTaskTime, customerChecker: 30)
        }
    }
    
    private func bankClosing(timeChecker: Double, customerChecker: Int) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerChecker)명 이며, 총 업무시간은 \(String(format:"%.2f",timeChecker))초입니다.")
    }
}
