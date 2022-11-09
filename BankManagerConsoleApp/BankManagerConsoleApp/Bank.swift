//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Mene, Mangdi on 2022/11/02.
//

import Foundation

struct Bank {
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
        
        checkTime {
            while customerQueue.isEmpty == false {
                guard let customer = customerQueue.dequeue() else { return }
                if customer.requestingTask == .deposit {
                    prepareTask(to: depositSemaphore, for: customer, group)
                } else {
                    prepareTask(to: loanSemaphore, for: customer, group)
                }
            }
            group.wait()
        }
    }
    
    private func prepareTask(to banker: DispatchSemaphore,
                             for customer: Customer,
                             _ group: DispatchGroup) {
        DispatchQueue.global().async(group: group) {
            banker.wait()
            DispatchQueue.global().sync {
                processTask(customer)
            }
            banker.signal()
        }
    }
    
    private func processTask(_ customer: Customer) {
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
