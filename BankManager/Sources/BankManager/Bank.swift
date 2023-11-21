//
//  Bank.swift
//  BankManagerUIApp
//
//  Created by hyunMac on 11/15/23.
//

import Foundation

struct Bank {
    private var tellerCount: Int?
    private var customerCount: Int?
    private var bankLine = BankQueue<Customer>()
    
    mutating func setUpBank(tellerCount: Int, customerCount: Int) {
        self.tellerCount = tellerCount
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
            let customer = Customer(waitingNumber: tiketNumber, customerTask: customerTask)
            bankLine.enqueue(data: customer)
        }
    }
    
    func tellerProcessing() {
        let firstDepositTeller = Teller(processingTime: 0.7, tellerTask: "예금")
        let secondDepositTeller = Teller(processingTime: 0.7, tellerTask: "예금")
        let firstLoanTeller = Teller(processingTime: 1.1, tellerTask: "대출")

        var timeChecker = 0.0
        var customerChecker = 0
        
        while !bankLine.isEmpty() {
            DispatchQueue.global().async {
                guard let customer = bankLine.dequeue() else { return }
                
                customerChecker += 1
                
                timeChecker += firstDepositTeller.tellerProcessing(customer.waitingNumber)
            }
            DispatchQueue.global().async {
                guard let customer = bankLine.dequeue() else { return }
                
                customerChecker += 1
                
                timeChecker += secondDepositTeller.tellerProcessing(customer.waitingNumber)
            }
            DispatchQueue.global().async {
                guard let customer = bankLine.dequeue() else { return }
                
                customerChecker += 1
                
                timeChecker += firstLoanTeller.tellerProcessing(customer.waitingNumber)
            }
        }
        bankClosing(timeChecker: timeChecker, customerChecker: customerChecker)
    }
    
    private func bankClosing(timeChecker: Double, customerChecker: Int) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerChecker)이며, 총 업무시간은 \(String(format:"%.2f",timeChecker))초입니다.")
    }
}
