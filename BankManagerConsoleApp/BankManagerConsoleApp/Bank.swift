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
    
    mutating func run() {
        print("1 : 은행개점\n2 : 종료")
        
        guard let input = readLine() else {
            return
        }
        
        switch input {
        case BankOption.openValue:
            numberOfCustomer = Int.random(in: BankOption.rangeOfCustomer)
            open()
        case BankOption.closeValue:
            return
        default:
            run()
        }
    }
    
    mutating func addCustomer() -> Customer? {
        numberOfCustomer += 1
        
        guard let randomBanking = Banking.allCases.randomElement() else { return nil }
        
        let customer = Customer(waitingNumber: numberOfCustomer, desiredBanking: randomBanking)
        
        customers.enqueue(customer)
        
        return customer
    }
    
    private mutating func open() {
        let startDate = Date()
        
        receiveCustomers()
        
        while customers.isEmpty == false {
            guard let customer = customers.dequeue() else {
                break
            }
            
            BankManager.divideWork(accordingTo: customer)
        }
        
        Bank.workingGroup.wait()
        
        let finishDate = Date().timeIntervalSince(startDate)
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfCustomer)명이며, 총 업무시간은 \(finishDate.applyNumberFormatter())초입니다.")
        run()
    }
    
    private mutating func receiveCustomers() {
        for count in 1...numberOfCustomer {
            guard let randomBanking = Banking.allCases.randomElement() else { return }
            
            customers.enqueue(Customer(waitingNumber: count, desiredBanking: randomBanking))
        }
    }
}
