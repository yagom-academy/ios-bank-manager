//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Siwon Kim on 2021/12/23.
//

import Foundation

class Bank {
    var customerQueue: Queue<Customer> = Queue<Customer>()
    var bankClerk: BankClerk
    
    init(bankClerk: BankClerk) {
        self.bankClerk = bankClerk
        self.bankClerk.bank = self
    }
    
    func open() {
        bankClerk.work()
    }
    
    func close(totalCustomers: Int, totalProcessingTime: Double) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomers)명이며, 총 업무시간은 \(totalProcessingTime.formatted)초입니다.")
    }
}
