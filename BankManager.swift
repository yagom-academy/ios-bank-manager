//
//  BankManager.swift
//  Created by 리지, 무리.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private var bank = Bank()
    
    mutating private func openBank() {
        bank.lineUpClient()
        bank.doTask()
        startBankApp()
    }
    
    mutating func startBankApp() {
        let open = "1"
        let close = "2"
        let noticeMenu = "1 : 은행 개점 \n2 : 종료 \n입력 : "
        let inputError = "입력이 잘못되었습니다."
        
        print(noticeMenu, terminator: "")
        
        guard let input = readLine() else { return }
        
        switch input {
        case open:
            openBank()
        case close:
            return
        default:
            print(inputError)
            startBankApp()
        }
    }
}
