//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 예톤, 웡빙 on 2022/07/01.
//

import Foundation

struct Bank {
    private var bankManager: BankManager
    private var queue: CustomerQueue
    private var randomNumber: Int = 0
    
    init(employee bankManager: BankManager, customer queue: CustomerQueue) {
        self.bankManager = bankManager
        self.queue = queue
    }
    
    mutating func start() {
        while true {
            displayMenu()
            let selectedMenu = selectMenu()
            
            if selectedMenu == NameSpace.one.print {
                updateCustomerQueue()
                handleCustomer()
                displayEndMessage()
            } else if selectedMenu == NameSpace.two.print {
                break
            } else {
                print("잘못 입력했습니다.")
            }
        }
    }
    
    private func displayMenu() {
        print(NameSpace.startMessage.print, terminator: " ")
    }
    
    mutating private func selectMenu() -> String {
        guard let input = readLine() else {
            return ""
        }
    
       return input
    }
    
    mutating private func updateCustomerQueue() {
        randomNumber = Int.random(in: 10...30)
        let numberList = Array<Int>(1...randomNumber)
        
        numberList.forEach {
            let customer = Customer(number: $0)
            queue.enqueue(data: customer)
        }
    }
    
    mutating private func handleCustomer() {
        for _ in 0..<queue.count {
            guard let customer = queue.dequeue() else {
                return
            }
            
            bankManager.handle(customer: customer)
        }
    }
    
    private func displayEndMessage() {
        let totalHandlingTime = String(format: "%.2f",
                                       bankManager.handlingTime * Double(randomNumber))
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(randomNumber)명이며, 총 업무시간은 \(totalHandlingTime)초입니다.")
    }
}
