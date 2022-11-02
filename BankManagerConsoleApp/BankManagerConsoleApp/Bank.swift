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
    
    func showManual() {
        print("""
        1 : 은행 개점
        2 : 종료
        입력 :
        """, terminator: " ")
        
        receiveUserInput()
    }
    
    func receiveUserInput() {
        guard let input = readLine() else {
            return
        }
        
        switch input {
        case "1":
            receiveCustomer()
            startBanking()
        case "2":
            return
        default:
            return
        }
    }
    
    func receiveCustomer() {
        
    }
    
    func startBanking() {
        
    }
    
    func closeBanking() {
        
    }
}
