//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Gundy, jpush on 2022/11/04.
//

import Foundation
import BankCustomerQueue

struct Bank: BankProtocol {var bankerList: [Banker] = [Banker()]
    var bankCustomerQueue: BankCustomerQueue<BankCustomer>
    private var completedCustomerCount: Int = 0
    private var totalWorkedTime: TimeInterval = 0
    
    init() {
        self.bankCustomerQueue = .init()
        let randomNumber = Int.random(in: 10...30)
        
        for _ in 1...randomNumber {
            let bankCustomer: BankCustomer = .init()
            bankCustomerQueue.enqueue(bankCustomer)
        }
    }
    
    mutating func work() {
        let banker: Banker = bankerList.removeFirst()
        while let customer = bankCustomerQueue.dequeue() {
            banker.work(customer)
            completedCustomerCount += 1
        }
    }
    
    mutating func open() {
        while true {
            floatingMenu()
            print("입력 :", terminator: " ")
            
            guard let menu = readLine() else {
                return
            }
            
            switch menu {
            case "1":
                let startPoint = Date()
                work()
                let endPoint = Date()
                totalWorkedTime = endPoint.timeIntervalSince(startPoint)
                close()
            case "2":
                return
            default:
                print("잘못된 입력입니다.")
            }
        }
    }
    
    func close() {
        let wasteTime = String(format: "%.2f", totalWorkedTime)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(completedCustomerCount)명이며, 총 업무시간은 \(wasteTime)초입니다.")
    }
}
