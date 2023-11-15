//
//  Bank.swift
//  BankManagerUIApp
//
//  Created by hyunMac on 11/15/23.
//
import BankManager
import Dispatch

struct Bank {
    private var teller: Int
    private var customerCount: Int
    private var bankQueue: BankQueue<Customer>
    
    init(teller: Int, customerCount: Int, bankQueue: BankQueue<Customer>) {
        self.teller = teller
        self.customerCount = customerCount
        self.bankQueue = bankQueue
    }
    
    func lineUp() {
        for tiketNumber in 1...customerCount {
            let customer = Customer(waitingNumber: tiketNumber)
            bankQueue.enqueue(data: customer)
        }
    }
    
    func tellerProcessing() {
        var timeChecker = 0.0
        var customerChecker = 0
        
        while !bankQueue.isEmpty() {
            guard let customer = bankQueue.dequeue() else { return }
            
            print("\(customer.waitingNumber)번 고객 업무 시작")
            
            usleep(700000)
            timeChecker += 0.7
            customerChecker += 1
            
            print("\(customer.waitingNumber)번 고객 업무 완료")
        }
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerChecker)이며, 총 업무시간은 \(String(format:"%.2f",timeChecker))초입니다.")
    }
}
