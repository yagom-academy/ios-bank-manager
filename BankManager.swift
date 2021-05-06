//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class BankManager {
    private var customers: [Customer] = []
    private var banker: Banker = Banker()
    private let operationQueue = OperationQueue()
    
    func openBank() {
        let bankOpenMenuState: Bool = bankOpenMenu()
        
        if bankOpenMenuState {
            visitCustomers()
            bankWorkProgress()
            openBank()
        }
    }
    
    private func bankOpenMenu() -> Bool {
        
        while true {
            print("1 : 은행개점")
            print("2 : 종료")
            print("입력 : ", terminator : "")
            
            guard let inputNumber = readLine() else {
                return false
            }
            
            if inputNumber == "1" {
                return true
            } else if inputNumber == "2" {
                return false
            } else {
                print("잘못된 입력입니다, 다시 입력해주세요.")
            }
        }
    }
    
    private func bankWorkProgress() {
        let totalCustomersCount: Int = self.customers.count
        
        let bankerTak = BlockOperation {
            self.banker.bankerWorkProgress(customers: &self.customers)
        }
        let bankerWody = BlockOperation {
            self.banker.bankerWorkProgress(customers: &self.customers)
        }
        let bankerDelma = BlockOperation {
            self.banker.bankerWorkProgress(customers: &self.customers)
        }
        
        operationQueue.addOperations([bankerTak, bankerWody, bankerDelma], waitUntilFinished: true)
        
        if self.customers.count == 0 {
            self.finishBank(totalCustomerCount: totalCustomersCount, bankersWorkTime: self.banker.workTime)
        }
    }
    
    private func finishBank(totalCustomerCount: Int, bankersWorkTime: Double) {
        let workTime: Double = round(bankersWorkTime * 100) / 100
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomerCount)명이며, 총 업무 시간은 \(workTime)초 입니다.")
        
        self.banker.workTime = 0
    }
    
    private func visitCustomers() {
        let waitNumbers: [Int] = Array(1...Int.random(in: 10...30))
        
        for number in waitNumbers {
            guard let tier = Tier.allCases.randomElement() else {
                return
            }
            guard let business = Business.allCases.randomElement() else {
                return
            }
            
            let customer: Customer = Customer(waitNumber: number, tier: tier, business: business)
            
            self.customers.append(customer)
        }
        
        self.customers.sort(by: {$0.tier.rawValue < $1.tier.rawValue})
    }
    
}
