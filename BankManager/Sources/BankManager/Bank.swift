//
//  Bank.swift
//  BankManagerUIApp
//
//  Created by hyunMac on 11/15/23.
//

import Foundation

struct Bank {
    private var depositTaskLine = BankQueue<Customer>()
    private var loanTaskLine = BankQueue<Customer>()
        
    func bankStart() {
        lineUp()
        tellerProcessing()
    }
    
    func lineUp() {
        let customerCount = Int.random(in: 10...30)
        let bankTask = ["예금","대출"]
        
        for tiketNumber in 1...customerCount {
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
        
        var timeChecker = 0.0
        var customerChecker = 0
        
        DispatchQueue.global().async(group: group) {
            depositSemaphore.wait()
            while !depositTaskLine.isEmpty() {
                guard let depositCustomer = depositTaskLine.dequeue() else { break }
                customerChecker += 1
                timeChecker += depositTeller.tellerProcessing(depositCustomer.waitingNumber)
            }
            depositSemaphore.signal()
        }
        
        DispatchQueue.global().async(group: group) {
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
