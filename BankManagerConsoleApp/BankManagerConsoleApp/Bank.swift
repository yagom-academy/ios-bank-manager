//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Mene, Mangdi on 2022/11/02.
//

import Foundation

struct Bank {
    let numberOfCustomer: Int
    private let group = DispatchGroup()
    private let depositSemaphore = DispatchSemaphore(value: 2)
    private let loanSemaphore = DispatchSemaphore(value: 1)
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
            checkTime {
            while let customer = customerQueue.dequeue() {
                if customer.requestingTask == .deposit {
                    processTask(to: depositSemaphore, for: customer)
                } else {
                    processTask(to: loanSemaphore, for: customer)
                }
            }
            group.wait()
        }
    }
    
    private func processTask(to banker: DispatchSemaphore,
                             for customer: Customer) {
        DispatchQueue.global().async(group: group) {
            banker.wait()
            DispatchQueue.global().sync {
                processCustomerRequest(customer)
            }
            banker.signal()
        }
    }
    
    private func processCustomerRequest(_ customer: Customer) {
        print("\(customer.waitingNumber)번 고객 \(customer.requestingTask.name) 업무 시작")
        if customer.requestingTask == .deposit {
            usleep(700000)
        } else {
            usleep(1100000)
        }
        print("\(customer.waitingNumber)번 고객 \(customer.requestingTask.name) 업무 완료")
    }
    
    private func checkTime(process: () -> ()) {
        let startTime = CFAbsoluteTimeGetCurrent()
        process()
        let processTime = String(format: "%.2f", CFAbsoluteTimeGetCurrent() - startTime)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfCustomer)명이며, " +
              "총 업무시간은 \(processTime)초 입니다. \n")
    }
}
