//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 쿼카, 두기 on 2022/04/28.
import Foundation

struct Bank {
    private enum Constant {
        static let customerRange = 1...Int.random(in: 10...30)
        static let empty = ""
    }
    
    private let bankClerk = BankClerk()
    private var customerQueue = Queue<Customer>()
    private var totalCustomerCount = Int.zero
    private var workingTime = Constant.empty
    
    private mutating func receiveCustomer() {
        for number in Constant.customerRange {
            customerQueue.enqueue(newElement: Customer(number: number))
        }
    }
    
    private mutating func sendCustomerToClerk() {
        while customerQueue.isEmpty == false {
            guard let customer = customerQueue.dequeue() else {
                return
            }
            
            bankClerk.work(customer: customer)
            totalCustomerCount += 1
        }
    }
    
    private func printCloseMessage() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomerCount)명이며, 총 업무시간은 \(workingTime)초입니다.")
    }
    
    mutating func start() {
        receiveCustomer()
        let startTime = CFAbsoluteTimeGetCurrent()
        sendCustomerToClerk()
        let durationTime = CFAbsoluteTimeGetCurrent() - startTime
        workingTime = String(format: Constant.twoDecimalPlaces, durationTime)
        workingTime = String(format: "%.2f", durationTime)
        printCloseMessage()
    }
}
