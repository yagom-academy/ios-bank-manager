//
//  Bank.swift
//  Created by sunnycookie, inho
//

import Foundation

struct Bank {
    var customers: Queue<Customer>
    var customerCount: Int
    var processingTime: Double {
        return 0
    }
    
    mutating func showManual() {
        print("""
        1 : 은행 개점
        2 : 종료
        입력 :
        """, terminator: " ")
        
        receiveUserInput()
    }
    
    mutating func receiveUserInput() {
        guard let input = readLine() else {
            return
        }
        
        switch input {
        case "1":
            startBanking()
        case "2":
            return
        default:
            return
        }
    }

    mutating func startBanking() {
        while !customers.isEmpty {
            guard let customer = customers.dequeue() else {
                return
            }
            
            serveCustomer(number: customer.waitingNumber)
        }
        
        closeBanking()
    }
    
    func serveCustomer(number: Int) {
        print("\(number)번 고객 업무 시작")
        sleep(1)
        print("\(number)번 고객 업무 완료")
    }
    
    func closeBanking() {
        
    }
}
