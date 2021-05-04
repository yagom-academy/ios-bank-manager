//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class BankManager {
    private var customers: [Customer] = []
    private let tak: Banker = Banker()
    
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
        var remainingCustomerCount: Int = totalCustomersCount
        
        while remainingCustomerCount > 0 {
            remainingCustomerCount = self.customers.count
            
            if remainingCustomerCount == 0 {
                finishBank(totalCustomerCount: totalCustomersCount)
                break
            } else {
                let customer: Int = tak.matchBankerAndCustomer(customers: &customers)
                tak.bankerWorkProgress(customerNumber: customer)
            }
        }
    }
    
    private func finishBank(totalCustomerCount: Int) {
        var workTime = Double(totalCustomerCount) * 0.7
        workTime = round(workTime * 100) / 100
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomerCount)명이며, 총 업무 시간은 \(workTime)초 입니다.")
    }
    
    private func visitCustomers(){
        let waitNumbers: [Int] = Array(1...Int.random(in: 10...30))
        
        for number in waitNumbers {
            let customer: Customer = Customer(waitNumber: number)
            self.customers.append(customer)
        }
    }
    
}
