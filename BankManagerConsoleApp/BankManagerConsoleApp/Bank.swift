//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Mangdi on 2022/11/02.
//

import Foundation

struct Bank {
    let manager: [BankManager]
    var numberOfCustomer: Int
    var customerQueue: CustomerQueue<Customer>
    
    mutating func openUp() {
        selectMenu()
    }
    
    private mutating func selectMenu() {
        print("""
              1 : 은행개점
              2 : 종료
              입력 :
              """, terminator: " ")
        guard let userInput = readLine()?.replacingOccurrences(of: " ", with: "") else { return }
        
        switch userInput {
        case "1":
            addCustomer()
            allocateCustomer()
            selectMenu()
        case "2":
            break
        default:
            print("입력이 잘못되었습니다. \n")
            selectMenu()
        }
    }
    
    private mutating func addCustomer() {
        let numbers = Array(1...numberOfCustomer)

        numbers.forEach { number in
            let customer: Customer = Customer(waitingNumber: number)
            customerQueue.enqueue(data: customer)
        }
    }
    
    private mutating func allocateCustomer() {
        DispatchQueue.global().sync {
            while customerQueue.isEmpty == false {
                self.manager.forEach { manager in
                    guard let customer = customerQueue.peek() else { return }
                    manager.processTask(customer: customer)
                    customerQueue.dequeue()
                }
            }
        }

        let totalProcessTime = String(format: "%.2f", Double(numberOfCustomer) * 0.7)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfCustomer)명이며, " +
              "총 업무시간은 \(totalProcessTime)초 입니다. \n")
    }
}
