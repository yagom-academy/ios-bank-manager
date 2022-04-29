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
        static let numberOne = 1
        static let twoDecimalPlaces = "%.2f"
        static let endWork = "업무가 마감되었습니다. "
        static let totalWorkDoneCustomer = "오늘 업무를 처리한 고객은 총 "
        static let numberOfPeople = "명이며, "
        static let totalWorkTime = "총 업무시간은 "
        static let minutes = "초입니다."
    }
    let bankClerk = BankClerk()
    var customerQueue = Queue<Customer>()
    var totalCustomerCount = Int.zero
    var workingTime = Constant.empty
    
    mutating func receiveCustomer() {
        for number in Constant.customerRange {
            customerQueue.enqueue(newElement: Customer(number: number))
        }
    }
    
    func printCloseMessage() {
        print("\(Constant.endWork+Constant.totalWorkTime)\(totalCustomerCount)\(Constant.numberOfPeople+Constant.totalWorkTime)\(workingTime)\(Constant.minutes)")
    }
    
    mutating func sendCustomerToClerk() {
        while customerQueue.isEmpty == false {
            guard let customer = customerQueue.dequeue() else {
                return
            }
            
            bankClerk.work(customer: customer)
            totalCustomerCount += Constant.numberOne
        }
    }
    
    mutating func start() {
        receiveCustomer()
        let startTime = CFAbsoluteTimeGetCurrent()
        sendCustomerToClerk()
        let durationTime = CFAbsoluteTimeGetCurrent() - startTime
        workingTime = String(format: Constant.twoDecimalPlaces, durationTime)
        printCloseMessage()
    }
}
