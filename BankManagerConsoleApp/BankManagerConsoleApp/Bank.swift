//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 예톤, 웡빙 on 2022/07/01.
//

import Foundation

struct Bank {
    var bankManager: BankManager
    var queue: CustomerQueue
    
    func displayMenu() {
        print(
"""
1 : 은행 개점
2 : 종료
입력 :
""", terminator: "")
    }
    
    mutating func selectMenu() {
        let input = readLine() ?? ""
        
        if input == "1" {
            updateCustomerQueue()
            handleCustomer()
        } else if input == "2" {
            return
        } else { print("입력이 잘못되었습니다") }
    }
    
    mutating func updateCustomerQueue() {
        let randomNumber = TotalCustomer.generateCustomerNumber()
        let numberList = Array<Int>(1...randomNumber)
        
        for i in numberList {
            let customer = Customer(number: i)
            
            queue.enqueue(data: customer)
        }
    }
    
    mutating func handleCustomer() {
        for _ in 0..<queue.count {
            guard let customer = queue.dequeue() else {
                return
            }
            
            bankManager.handle(customer: customer)
        }
    }
}
