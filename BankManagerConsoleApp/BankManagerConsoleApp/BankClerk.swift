//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by unchain,BaekGom on 2022/06/30.
//

import Foundation

struct BankClerk {
    mutating func handleBanking(customerList: BankItemQueue<Customer>) {
        var customerList = customerList
        
        while let completeCuntomer = customerList.deQueue() {
            print("\(completeCuntomer.bankNumberTicket)번 고객 업무 시작")
            usleep(700000)
            print("\(completeCuntomer.bankNumberTicket)번 고객 업무 완료")
        }
    }
}
