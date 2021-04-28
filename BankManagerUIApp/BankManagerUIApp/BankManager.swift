//
//  BankTeller.swift
//  BankManagerUIApp
//
//  Created by James on 2021/04/27.
//

import Foundation

final class BankManager: BankManageable {
    lazy var waitingLine = manageWaitingLine()
    private var windowsNumber: Int
    
    init(windowsNumber: Int) {
        self.windowsNumber = windowsNumber
    }
    
    func assignBankTeller(numberOfTellers: Int) {
        waitingLine.maxConcurrentOperationCount = numberOfTellers
    }
}
