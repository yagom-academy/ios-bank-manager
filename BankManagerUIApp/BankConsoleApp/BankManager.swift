//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by OneTool, Red on 2022/04/28.
//

import Foundation

protocol Manageable {
    func manageBanker()
    func reportOfDay() -> String
}

final class BankManager {
    var bank: Manageable = Bank()
    
    func openBank() {
        bank.manageBanker()
    }
}
