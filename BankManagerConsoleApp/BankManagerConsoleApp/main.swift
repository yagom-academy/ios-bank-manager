//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

final class main {
    func openBank() {
        displayMenu()
        switch inputMenuNumber() {
        case 1:
            let bankTeller = 3
            LocalBank().serveClient(bankTeller)
        case 2:
            exit(0)
        default:
            print("오류 발생")
            exit(1)
        }
    }
    
    private func displayMenu() {
        print("1 : 은행개점")
        print("2 : 종료")
        print("입력", terminator: " : " )
    }

    private func inputMenuNumber() -> Int {
        guard let optionalInput = readLine(), let inputNumber = Int(optionalInput) else {
            return 0
        }
        return inputNumber
    }
}

main().openBank()

