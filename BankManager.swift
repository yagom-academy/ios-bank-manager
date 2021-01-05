//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private var bankState: Int = 0
    
    mutating func startTask() {
        repeat {
            let initializationText: String = """
            1 : 은행개점
            2 : 종료
            입력 : 
            """
            print(initializationText, terminator: "")
            
            guard let userInput: String = readLine(), let userInputNumber: Int = Int(userInput), (userInputNumber == 1 || userInputNumber == 2) else {
                print("올바른 입력을 부탁드립니다. 개점은 숫자 1을, 종료는 숫자 2를 입력해주세요!")
                return
            }
            self.bankState = userInputNumber
            let customers = Array(1...Int.random(in: 10...30))
            
            if self.bankState == 1 {
                let taskedTime = BankClerk().serveCustomers(customers: customers)
                print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customers.count)명이며, 총 업무시간은 \(Double(taskedTime) / 1000000)초 입니다.")
            }
        } while self.bankState == 1
    }
}


    
