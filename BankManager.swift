//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by Andrew.goat on 2023/03/07.
//

import Foundation

class BankManager {
    private var customerCountQueue: BankQueue<Int> = BankQueue<Int>()
    var bankCustomer: Int = 0
    
    func manageBanking() {
        for i in 1...bankCustomer {
            
            let bankClerk = DispatchWorkItem {
                self.customerCountQueue.enqueue(data: i)
                guard let customer = self.customerCountQueue.peek() else { return }
                
                print("\(customer)번 고객 업무 시작")
                usleep(700000)
                self.customerCountQueue.dequeue()
                print("\(customer)번 고객 업무 완료")
                usleep(700000)
            }
            DispatchQueue.global().sync(execute: bankClerk)
        }
        let time: Double = 0.7 * Double(bankCustomer)
        let formattedTime: String = digitFormatter(input: time)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(bankCustomer)명이며, 총 업무시간은 \(formattedTime)초입니다 ")
    }
    
    func digitFormatter(input: Double) -> String {
        let decimal: Double = input
        let result: String = String(format: "%.2f", decimal)
        
        return result
    }
}
