//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by idinaloq, EtialMoon on 2023/07/13.
//

import Foundation

struct Bank {
    private let bankManager: BankManager = BankManager()
    private var customerNumber: Int = 0
    private var customerQueue: SingleLinkedList<Customer> = SingleLinkedList<Customer>()
    private let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 2
        return numberFormatter
    }()
    
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
        while let customer = customerQueue.dequeue() {
            bankManager.work(for: customer)
        }
    }
    
    private func finishBusiness() {
        guard let totalTime = numberFormatter.string(for: Double(customerNumber) * 0.7) else { return }
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerNumber)명이며, 총 업무시간은 \(totalTime)초입니다.")
    }
}
