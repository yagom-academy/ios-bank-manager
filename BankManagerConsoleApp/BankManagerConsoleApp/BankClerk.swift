//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by unchain,BaekGom on 2022/06/30.
//

import Foundation

struct BankClerk {
    var customerList: BankItemQueue<Customer>
    
    mutating func handleBanking() {
        while let completeCuntomer = customerList.deQueue() {
            print("\(completeCuntomer)번 고객 업무 시작")
            usleep(700000)
            print("\(completeCuntomer)번 고객 업무 완료")
        }
    }
}
