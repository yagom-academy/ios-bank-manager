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
    
    func lineUp() {
        let processingTime: Double = 0.7
        
        guard let lastCustomerCount = customerCount else { return }
        
        for tiketNumber in 1...lastCustomerCount {
            let customer = Customer(waitingNumber: tiketNumber, processingTime: processingTime)
            bankLine.enqueue(data: customer)
        }
    }
    
    func tellerProcessing() {
        let firstDepositTeller = Teller(processingTime: 0.7, tellerTask: "예금")
        let secondDepositTeller = Teller(processingTime: 0.7, tellerTask: "예금")
        let firstLoanTeller = Teller(processingTime: 1.1, tellerTask: "대출")
        let dispatchGroup = DispatchGroup()
        
        
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
