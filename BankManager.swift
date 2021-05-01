//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class BankManager {
    
    func openBank() {
        let bankOpenMenuState: Bool = bankOpenMenu()
        var customers: [Customer] = visitCustomers()
        
        if bankOpenMenuState {
            bankWorkProgress(customers: &customers)
            
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
   
    private func bankWorkProgress(customers: inout [Customer]) {
        let TotalCustomersCount: Int = countCustomers(customers: customers)
        
        while true {
            let remainingCustomer: Int = countCustomers(customers: customers)
        
            if remainingCustomer == 0 {
                finishBank(todayTotalVisitCustomers: TotalCustomersCount)
                break
            } else {
                let customer: Int = matchBankerAndCustomer(customers: &customers)
                bankerWorkProgress(customerNumber: customer)
            }
        }
    }
    
    private func bankerWorkProgress(customerNumber: Int) {
        print("\(customerNumber)번 고객 업무 시작")
        usleep(700000)
        print("\(customerNumber)번 고객 업무 완료")
    }

    private func finishBank(todayTotalVisitCustomers: Int) {
        var workTime = Double(todayTotalVisitCustomers) * 0.7
        workTime = round(workTime * 100) / 100
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(todayTotalVisitCustomers)명이며, 총 업무 시간은 \(workTime)초 입니다.")
    }
    
    
    
    private func visitCustomers() -> [Customer] {
        var result: [Customer] = []
        let waitNumbers: [Int] = Array(1...Int.random(in: 10...30))

        for number in waitNumbers {
            let customer: Customer = Customer(waitNumber: number)
            result.append(customer)
        }

        return result
    }
    
    private func matchBankerAndCustomer(customers: inout [Customer]) -> Int {
        let customer: Customer = customers.removeFirst()
        
        return customer.waitNumber
    }
    
    private func countCustomers(customers: [Customer]) -> Int {
        return customers.count
    }
}
