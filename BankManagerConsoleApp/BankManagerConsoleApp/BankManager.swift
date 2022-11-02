//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by Mangdi, Mene on 2022/11/02.
//

import Foundation

struct BankManager {
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
            processTask()
            selectMenu()
        case "2":
            break
        default:
            print("입력이 잘못되었습니다. \n")
            selectMenu()
        }
    }
    
    private mutating func addCustomer() {
        for number in 1...numberOfCustomer {
            let customer: Customer = Customer(waitingNumber: number)
            customerQueue.enqueue(data: customer)
        }
    }
    
    private mutating func processTask() {
        DispatchQueue.global().sync {
            while customerQueue.isEmpty == false {
                guard let customer = customerQueue.peek() else { return }
                print("\(customer.waitingNumber)번 고객 업무 시작")
                usleep(700000)
                print("\(customer.waitingNumber)번 고객 업무 완료")
                customerQueue.dequeue()
            }
        }
        
        let totalProcessTime = String(format: "%.2f", Double(numberOfCustomer) * 0.7)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfCustomer)명이며, " +
              "총 업무시간은 \(totalProcessTime)초 입니다. \n")
    }
}
