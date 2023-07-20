//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by idinaloq, EtialMoon on 2023/07/13.
//

import Foundation

struct Bank {
    private let depositBankManagers: BankManager = BankManager(people: 2)
    private let loansBankManagers: BankManager = BankManager(people: 1)
    private var customerNumber: Int = 0
    private var customerQueue: SingleLinkedList<Customer> = SingleLinkedList<Customer>()
    
    private var totalTime: TimeInterval = 0
    
    mutating func selectMenu() {
        while true {
            print("1 : 은행개점\n2 : 종료\n입력 : ", terminator: "")
            
            let selectedMenu = readLine()
            
            switch selectedMenu {
            case "1":
                startBusiness()
            case "2":
                return
            default:
                print("잘못된 입력입니다.")
            }
        }
    }
    
    private mutating func startBusiness() {
        createCustomerRandomNumber()
        receiveCustomers()
        processBusiness()
        finishBusiness()
    }
    
    private mutating func createCustomerRandomNumber() {
         customerNumber = Int.random(in: 10...30)
    }
    
    private mutating func receiveCustomers() {
        for number in 1...customerNumber {
            let customer: Customer = Customer(waitingNumber: number)
            customerQueue.enqueue(customer)
        }
    }
    
    private mutating func measureStartTime() -> Date {
        return Date()
    }
    
    private mutating func measureTotalTime(_ startTime: Date) -> TimeInterval {
        return Date().timeIntervalSince(startTime)
    }
    
    private mutating func processBusiness() {
        let startTime: Date = measureStartTime()
        
        while let customer = customerQueue.dequeue() {
            switch customer.getBankingServiceType() {
            case .deposit:
                depositBankManagers.work(for: customer)
            case .loans:
                loansBankManagers.work(for: customer)
            case .none:
                print("BankingTypeIsNil")
            }
        }
        
        depositBankManagers.finishWork()
        loansBankManagers.finishWork()
        totalTime = measureTotalTime(startTime)
    }
    
    private func finishBusiness() {
        let totalProcessTime: String = TotalTimeFormatter.string(for: totalTime)
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerNumber)명이며, 총 업무시간은 \(totalProcessTime)초입니다.")
    }
}
