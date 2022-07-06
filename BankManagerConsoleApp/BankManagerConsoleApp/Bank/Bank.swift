//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by Kiwi, Kay on 2022/07/01.
//
import Foundation

final class Bank {
    private var lineOfCustomers = BankManagerQueue<Customer>()
    private var numberOfCustomers: Int = 0
    private var banker = Banker()
    
    private func inputMenu() {
        print("1 : 은행 개점")
        print("2 : 종료")
        print("입력 : ", terminator: "")
    }
    
    private func generateRandomNumberOfCustomers() {
        numberOfCustomers = Int.random(in: 10...30)
    }
    
    private func insertCustomersIntoQueue() {
        for element in 1...self.numberOfCustomers {
            let random = Int.random(in: 0...1)
            let customer = Customer(customerNumber: element, business: BankWorkType.allCases[random])
            self.lineOfCustomers.enqueue(data: customer)
        }
    }
    
    private func orderBankerToWork() {
        let start = CFAbsoluteTimeGetCurrent()
        let group = DispatchGroup()
        group.enter()
        while !self.lineOfCustomers.isEmpty {
            guard let customer = self.lineOfCustomers.dequeue() else { return }
            if customer.business == .deposit {
                banker.handleDepositCustomers(customer: customer, group: group)
            } else {
                banker.handleLoanCustomers(customer: customer, group: group)
            }
        }
        group.leave()
        group.notify(queue: .global()) {
            let diff = CFAbsoluteTimeGetCurrent() - start
            print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(self.numberOfCustomers)명이며, 총 업무시간은 \(String(format: "%.2f", diff))초 입니다.")
            self.inputMenu()
        }
    }
    
    func openBank() {
        var userInput: String?
        self.inputMenu()
        repeat {
            userInput = readLine()
            if let input = userInput {
                if input == "1" {
                    self.generateRandomNumberOfCustomers()
                    self.insertCustomersIntoQueue()
                    self.orderBankerToWork()
                }
            }
        } while userInput != "2"
    }
}
