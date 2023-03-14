//
//  BankManager.swift
//  Created by 리지, 무리.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private var bank = Bank()
    
    mutating func startBankApp() {
        let noticeMenu = "1 : 은행 개점 \n2 : 종료 \n입력 : "
        let inputError = "입력이 잘못되었습니다."
        
        print(noticeMenu, terminator: "")
        
        guard let input = readLine() else { return }
        
        switch input {
        case BankState.open:
            bank.manageTodayTask()
            startBankApp()
        case BankState.close:
            return
        default:
            print(inputError)
            startBankApp()
        }
    }
    
    private enum BankState {
        static let open = "1"
        static let close = "2"
    }
}
