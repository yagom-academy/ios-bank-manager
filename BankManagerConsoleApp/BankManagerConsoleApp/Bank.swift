//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 레옹아범, 혜모리 on 2023/03/07.
//

import Foundation

struct Bank {
    private var customers: Queue<Customer> = Queue()
    private var managers: [BankManager] = []
    
    mutating func run() {
        print("1 : 은행개점\n2 : 종료")
        
        guard let input = readLine() else {
            return
        }
        
        switch input {
        case BankOption.openValue:
            addManager()
            open()
        case BankOption.closeValue:
            return
        default:
            run()
        }
    }
    
    mutating private func open() {
        let numberOfCustomer = receiveNumberOfCustomers()
        let startDate = Date()
        
        while customers.isEmpty == false {
            guard let customer = customers.dequeue() else {
                break
            }
            
            work(for: customer)
        }
        
        let finishDate = Date().timeIntervalSince(startDate)
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfCustomer)명이며, 총 업무시간은 \(finishDate.applyNumberFormatter())초입니다.")
        run()
    }
    
    mutating private func receiveNumberOfCustomers() -> Int {
        let numberOfCustomer = Int.random(in: BankOption.rangeOfCustomer)
        
        for count in 1...numberOfCustomer {
            guard let randomBanking = Banking.allCases.randomElement() else { return count - 1 }
            
            customers.enqueue(Customer(waitingNumber: count, banking: randomBanking))
        }
        
        return numberOfCustomer
    }
    
    mutating private func work(for customer: Customer) {
        managers[0].customer = customer
        
        managers[0].work()
    }
    
    mutating private func addManager() {
        for _ in 1...BankOption.numberOfDepositManager {
            self.managers.append(BankManager(duty: .deposit))
        }
        
        for _ in 1...BankOption.numberOfLoanManager {
            self.managers.append(BankManager(duty: .loan))
        }
    }
}
