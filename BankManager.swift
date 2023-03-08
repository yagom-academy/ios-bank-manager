//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by Andrew.goat on 2023/03/07.
//

import Foundation

class BankManager {
    var bankClerk: Int = 1
    var bankCustomer = BankQueue<Int>()
    var bankCustomers: Int = 0
    
    func doBanking() {
        for i in 1...bankCustomers {
            
            let workItem = DispatchWorkItem {
                self.bankCustomer.enqueue(data: i)
                guard let customer = self.bankCustomer.peek() else { return }
                
                print("\(customer)번 시작")
                usleep(700000)
                self.bankCustomer.dequeue()
                print("\(customer)번 종료")
                usleep(700000)
            }
            DispatchQueue.global().sync(execute: workItem)
        }
        print("모두끝")
    }
}
