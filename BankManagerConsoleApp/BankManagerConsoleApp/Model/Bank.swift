//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 쿼카, 두기 on 2022/04/28.

struct Bank {
    var customerQueue = Queue<Customer>()
    var totalCustomerCount = 0
    
    mutating func receiveCustomer() {
        for number in 1...Int.random(in: 10...30) {
            customerQueue.enqueue(newElement: Customer(number: number))
        }
    }
    
    func printCloseMessage() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomerCount)명이며, 총 업무시간은 XX초입니다.")
    }
}
