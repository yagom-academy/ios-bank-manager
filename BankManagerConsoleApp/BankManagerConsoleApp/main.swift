//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
import BankManager

enum BankOperation: String {
    case bankOpen = "1"
    case exit = "2"
    case invalidInput = ""
}

private func main() {
    var bankOpeningStatus = true
    let customerCount = Int.random(in: 10...30)
    let bank = Bank(tellerCount: 1, customerCount: customerCount, bankQueue: BankQueue<Customer>())
    
    while bankOpeningStatus {
        let bankOperationSwitch = presentMenu()
        bankOpeningStatus = bankProcessing(
            bank: bank,
            bankOperationSwitch: bankOperationSwitch
        )
    }
}

private func bankProcessing(bank: Bank, bankOperationSwitch: BankOperation) -> Bool {
    switch bankOperationSwitch {
    case .bankOpen:
        bank.lineUp()
        bank.tellerProcessing()
        return true
    case .exit:
        return false
    default:
        return true
    }
}

private func presentMenu() -> BankOperation {
    print("""
          1 : 은행개점
          2 : 종료
          입력 :
          """, terminator: " ")
    
    if let userInput = readLine(), let bankOperation = BankOperation(rawValue: userInput) {
        return bankOperation
    }
    return BankOperation.invalidInput
}

main()


