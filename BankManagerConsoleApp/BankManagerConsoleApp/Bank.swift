//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Mene, Mangdi on 2022/11/02.
//

import Foundation

struct Bank {
    let manager: BankManager
    let numberOfCustomer: Int
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
            let customer: Customer = Customer(
                waitingNumber: number,
                requestingTask: .init(rawValue: Int.random(in: 1...2)) ?? .deposit
            )
            customerQueue.enqueue(data: customer)
        }
    }
    
    private mutating func allocateCustomer() {
        let group = DispatchGroup()
        let depositSemaphore = DispatchSemaphore(value: 2)
        let loanSemaphore = DispatchSemaphore(value: 1)
        
        while customerQueue.isEmpty == false {
                guard let customer = customerQueue.dequeue() else { return }
                if customer.requestingTask == .deposit {
                    DispatchQueue.global().async(group: group) { [self] in
                        depositSemaphore.wait()
                        DispatchQueue.global().sync {
                            manager.processTask(customer)
                        }
                        depositSemaphore.signal()
                    }
                    
                } else {
                    DispatchQueue.global().async(group: group) { [self] in
                        loanSemaphore.wait()
                        DispatchQueue.global().sync {
                            manager.processTask(customer)
                        }
                        loanSemaphore.signal()
                    }
                }
        }
        
        group.wait()
        let totalProcessTime = String(format: "%.2f", 20)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfCustomer)명이며, " +
              "총 업무시간은 \(totalProcessTime)초 입니다. \n")
    }
}
