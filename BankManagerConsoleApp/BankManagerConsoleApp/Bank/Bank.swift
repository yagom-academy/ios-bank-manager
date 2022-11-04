//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Gundy, jpush on 2022/11/04.
//

import Foundation
import BankCustomerQueue

struct Bank: BankProtocol {
    var bankCustomerQueue: BankCustomerQueue<BankCustomer>
    
    init() {
        self.bankCustomerQueue = .init()
        let randomNumber = Int.random(in: 10...30)
        
        for _ in 1...randomNumber {
            let bankCustomer: BankCustomer = .init()
            bankCustomerQueue.enqueue(bankCustomer)
        }
    }
    
    func work(customer: BankCustomer) {
        
    }
    
    var bankerList: [Banker] = [Banker()]
    
    func work() {
        print("일하는 중")
    }
    
    func open() {
        while true {
            floatingMenu()
            print("입력 :", terminator: " ")
            
            guard let menu = readLine() else {
                return
            }
            
            switch menu {
            case "1":
                work()
            case "2":
                return
            default:
                print("잘못된 입력입니다.")
            }
        }
    }
    
    func close() {
        
    }
    
    
}
