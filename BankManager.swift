//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by mmim, malrang.
//

import Foundation

struct BankManager {
    private enum Text {
        static let open = "1 : 은행개점"
        static let close = "2 : 종료"
        static let input = "입력 : "
        static let empty = ""
    }
    
    private var bank: Bank
    
    init(of bank: Bank) {
        self.bank = bank
    }
        printOption()
        guard let selectedOption = SelectOptionType(rawValue: inputNumber()) else {
            return start()
        }
        
        switch selectedOption {
        case .open:
            return bank.executeBankWork()
        case .close:
            return
        }
    }
    
    private func printOption() {
        print(Text.open)
        print(Text.close)
        print(Text.input, terminator: Text.empty)
    }
    
    private func inputNumber() -> String {
        let selectedNumber = readLine() ?? Text.empty
        return selectedNumber
    }
}
