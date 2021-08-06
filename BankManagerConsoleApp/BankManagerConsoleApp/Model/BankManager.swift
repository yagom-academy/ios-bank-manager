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
        recieveOption()
    }
    
    private func printOptions() {
        print("1: 은행 개점\n2: 종료\n입력: ",terminator: "")
    }
    
    private func recieveOption() {
        
        guard let stringOption = readLine() else {
            return
        }
        
        switch stringOption {
        case Selector.openBank.option:
            runBank()
        case Selector.closeBank.option:
            return
        default:
            return
        }
    }
    
    private func runBank() {
        
        let minimumClients: UInt = 3
        let maximumClients: UInt = 5
        let randomNumber = UInt.random(in: minimumClients...maximumClients)
        
        let bank = Bank(numberOfClients: randomNumber)
        bank.openBank()
        runManager()
    }
}
