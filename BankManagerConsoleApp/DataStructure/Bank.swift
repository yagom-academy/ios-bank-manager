//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by kjs on 2021/07/28.
//

import Foundation

struct Bank {
    var queue = Queue<Customer>()
    
    func receiveCustomer() {
        let randomNumber = Int.random(in: 10...30)
        
        for order in 1...randomNumber {
            queue.enqueue(value: Customer(id: order))
        }
    }
    
    func doTask() {
        var count = 0.0
        while !queue.isEmpty {
            let customer = queue.dequeue()
            print("\(customer?.id)번 고객 업무 시작")
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.7) {
                print("\(customer?.id)번 고객 업무 종료")
            }
            count += 1
        }
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(count)명이며, 총 업무시간은 \(count * 0.7) 입니다.")
    }
}
