//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BankManager {
    
    func openBank() {
        var bankState: Bool = choiceBankState()
        
        if bankState {
            let customerManager: CustomerManager = CustomerManager()
            let todayTotalVisitCustomers: Int = customerManager.countCustomers()
            
            while bankState {
                let customer: Int = customerManager.matchBankerAndCustomer()
                
                workProgress(customerNumber: customer)
                
                if customerManager.countCustomers() == 0 {
                    print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(todayTotalVisitCustomers)명이며, 총 업무 시간은 \(Double(todayTotalVisitCustomers) * 0.7)초 입니다.")
                    
                    bankState = false
                }
                
            }
            
            bankState = choiceBankState()
            
            if bankState {
                openBank()
            }
        }
    }
    
    func choiceBankState() -> Bool {
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
    
    func workProgress(customerNumber: Int) {
        print("\(customerNumber)번 고객 업무 시작")
        usleep(700000)
        print("\(customerNumber)번 고객 업무 완료")
    }

}
