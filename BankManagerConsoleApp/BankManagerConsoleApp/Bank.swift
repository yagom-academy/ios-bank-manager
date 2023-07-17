//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by idinaloq, EtialMoon on 2023/07/13.
//

import Foundation

struct Bank {
    private let bankManagers: [BankManager]
    private var customerNumber: Int = 0
    private var customerQueue: SingleLinkedList<Customer> = SingleLinkedList<Customer>()
    private let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 2
        return numberFormatter
    }()
    var totalTime: TimeInterval = 0
    
    init(numberOfBankManager: Int) {
        var bankManagers: [BankManager] = []
        for _ in 1...numberOfBankManager {
            bankManagers.append(BankManager())
        }
        
        self.bankManagers = bankManagers
    }
    
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
    
    private mutating func processBusiness() {
        var depositBankManagerNumber = 0
        let group = DispatchGroup()
        let semaphore = DispatchSemaphore(value: 3)
        let startDate = Date()
        
        while let customer = customerQueue.dequeue() {
            if depositBankManagerNumber == 2 {
                depositBankManagerNumber = 0
            }
            
            switch customer.getBankingType() {
            case .deposit:
                bankManagers[depositBankManagerNumber].work(for: customer, group: group, semaphore: semaphore)
                depositBankManagerNumber += 1
            case .loans:
                bankManagers[2].work(for: customer, group: group, semaphore: semaphore)
            case .none:
                print("asdf")
            }
        }
        
        group.wait()
        totalTime = Date().timeIntervalSince(startDate)
    }
    
    private func finishBusiness() {
        guard let totalProcessTime = numberFormatter.string(for: totalTime) else { return }
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerNumber)명이며, 총 업무시간은 \(totalProcessTime)초입니다.")
    }
}
