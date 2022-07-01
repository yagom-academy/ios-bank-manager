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
    var randomNumber: Int = 0
    
    mutating func start() {
        while true {
            displayMenu()
            let selectedMenu = selectMenu()
            
            if selectedMenu == "1" {
                updateCustomerQueue()
                handleCustomer()
                displayEndMessage()
            } else if selectedMenu == "2" {
                break
            } else {
                print("잘못 입력했습니다.")
            }
        }
    }
    
    func displayMenu() {
        print(
"""
1 : 은행 개점
2 : 종료
입력 :
""", terminator: " ")
    }
    
    mutating func selectMenu() -> String {
        guard let input = readLine() else {
            return ""
        }
    
       return input
    }
    
    mutating func updateCustomerQueue() {
        randomNumber = TotalCustomer.generateCustomerNumber()
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
    
    func displayEndMessage() {
        let totalHandlingTime = String(format: "%.2f", bankManager.handlingTime * Double(randomNumber))
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(randomNumber)명이며, 총 업무시간은 \(totalHandlingTime)초입니다.")
    }
}
