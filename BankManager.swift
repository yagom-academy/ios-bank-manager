//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BankManager {
    
    func openBank() {
        var bankOpenMenuState: Bool = BankOpenMenu()
        
        if bankOpenMenuState {
            bankWorkProgress()
            
            openBank()
        }
    }
    
    private func BankOpenMenu() -> Bool {
        
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
        let customerManager: CustomerManager = CustomerManager()
        let TotalCustomersCount: Int = customerManager.countCustomers()
        
        while true {
            let remainingCustomer: Int = customerManager.countCustomers()
        
            if remainingCustomer == 0 {
                finishBank(todayTotalVisitCustomers: TotalCustomersCount)
                break
            } else {
                let customer: Int = customerManager.matchBankerAndCustomer()
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

}
