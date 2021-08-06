//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BankManager {
    
    private enum Selector {
        case openBank
        case closeBank
        var option: String {
            switch self {
            case .openBank:
                return "1"
            case .closeBank:
                return "2"
            }
        }
    }
    
    func runManager() {
        printOptions()
        try? recieveOption()
    }
    
    private func printOptions() {
        print("1: 은행 개점\n2: 종료\n입력: ",terminator: "")
    }
    
    private func recieveOption() throws {
        
        guard let stringOption = readLine() else {
            throw BankError.invalidOption
        }
        
        switch stringOption {
        case BankManager.Selector.openBank.option:
            runBank()
        case BankManager.Selector.closeBank.option:
            return
        default:
            return
        }
    }
    
    private func runBank() {
        let bank = Bank()
        bank.openBank()
        runManager()
    }
}
