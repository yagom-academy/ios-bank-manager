//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 레옹아범, 혜모리 on 2023/03/07.
//

import Foundation

struct Bank {
    private var customers: Queue<Customer> = Queue()
    private var numberOfCustomer = 0
    static let workingGroup = DispatchGroup()

    mutating func addCustomer() -> Customer? {
        numberOfCustomer += 1
        
        guard let randomBanking = Banking.allCases.randomElement() else { return nil }
        
        let customer = Customer(waitingNumber: numberOfCustomer, desiredBanking: randomBanking)
        
        customers.enqueue(customer)
        
        return customer
    }
    
    mutating func open() {
        let startDate = Date()
        
        while customers.isEmpty == false {
            guard let customer = customers.dequeue() else {
                break
            }
            
            NotificationCenter.default.post(name: .waitWork, object: customer)
            BankManager.divideWork(accordingTo: customer)
        }
        
        Bank.workingGroup.wait()
        
        let finishDate = Date().timeIntervalSince(startDate)
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfCustomer)명이며, 총 업무시간은 \(finishDate.applyNumberFormatter())초입니다.")
    }
}
