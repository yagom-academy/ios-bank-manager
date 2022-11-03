//
//  BankManager.swift
//  Created by sunnycookie, inho
//

import Foundation

struct BankManager {
    mutating func showManual() {
        print("""
        1 : 은행 개점
        2 : 종료
        입력 :
        """, terminator: " ")
    }
    
    mutating func receiveUserInput() {
        guard let input = readLine() else {
            return
        }
        
        switch input {
        case "1":
            setupBank()
        case "2":
            return
        default:
            return
        }
    }
    
    mutating func receiveCustomer() -> Queue<Customer> {
        var customers: Queue<Customer> = Queue()
        let customerCount = Int.random(in: 10...30)
        
        for count in 1...customerCount {
            customers.enqueue(Customer.init(waitingNumber: count))
        }
        
        return customers
    }
    
    mutating func setupBank() {
        let customers = receiveCustomer()
        var bank = Bank(customers: customers)
        bank.startBanking()
    }
}
