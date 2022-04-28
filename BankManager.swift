//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by mmim, malrang.
//

import Foundation

struct BankManager {
    private enum Constant {
        static let open = "1 : 은행개점"
        static let close = "2 : 종료"
        static let input = "입력 : "
        static let empty = ""
    }
    private var bank = Bank()
    
    mutating func start() {
        printOption()
        guard let selectedOption = SelectOption(rawValue: inputNumber()) else {
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
        print(Constant.open)
        print(Constant.close)
        print(Constant.input, terminator: Constant.empty)
    }
    
    private func inputNumber() -> String {
        let selectedNumber = readLine() ?? Constant.empty
        return selectedNumber
    }
}
