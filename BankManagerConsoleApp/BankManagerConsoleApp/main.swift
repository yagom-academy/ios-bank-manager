//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
import BankManager

private func main(){
    var bankOpeningStatus = true
    let customerCount = Int.random(in: 10...30)
    let bank = Bank(teller: 1, customerCount: customerCount, bankQueue: BankQueue<Customer>())
    
    while bankOpeningStatus {
        bankProcessing(
            bank: bank,
            bankOperationSwitch: presentMenu(),
            bankOpeningStatus: &bankOpeningStatus
        )
    }
}

private func bankProcessing(bank: Bank, bankOperationSwitch: String, bankOpeningStatus: inout Bool) {
    switch bankOperationSwitch {
    case "1":
        bank.lineUp()
        bank.tellerProcessing()
    case "2":
        bankOpeningStatus = false
    default:
        return
    }
}

private func presentMenu() -> String {
    print("""
          1 : 은행개점
          2 : 종료
          입력 :
          """, terminator: " ")
    
    guard let exitSwitch = readLine() else { return .empty }
    
    return exitSwitch
}

main()


