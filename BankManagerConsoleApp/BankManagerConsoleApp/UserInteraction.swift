//
//  UserInteraction.swift
//  BankManagerConsoleApp
//
//  Created by 김준건 on 2021/08/02.
//

import Foundation

struct UserInteraction {
    func selectMode() {
        print(BankMessage.showSelectMessage, terminator: " ")
    }
    
    func isBankOpen() -> Bool {
        if let input = readLine(), let inputNumber = Int(input), inputNumber == SelectMode.bankOpen {
            return true
        }
        return false
    }
    
    func showSettlementResult(customers: Int) {
        let totalWorkTime = 0.7 * Double(customers)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customers)명이며, 총 업무시간은 \(totalWorkTime)초 입니다.")
    }
}
