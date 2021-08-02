//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private let bank = Bank()
    
    private func choiceMenuWithGuide() -> Bank.BankStatus? {
        print("1 : 은행개점")
        print("2 : 종료")
        print("입력 : ", terminator: "")
        guard let userInput = readLine(), let filterdInput = Int(userInput) else {
            return nil
        }
        return Bank.BankStatus(rawValue: filterdInput)
    }
    
    func runProcess() {
        while true {
            let bankStatus = choiceMenuWithGuide()
            switch bankStatus {
            case .open:
                bank.receiveCustomer()
                bank.doTask()
            case .close:
                return
            default:
                print("잘못 입력했습니다. 다시 입력해주세요.")
            }
        }
    }
    
}
