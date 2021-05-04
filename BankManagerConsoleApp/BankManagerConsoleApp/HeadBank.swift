//
//  HeadBank.swift
//  BankManagerConsoleApp
//
//  Created by 윤재웅 on 2021/05/04.
//

import Foundation

final class HeadBank {
    static let shared = HeadBank()
    var bankWindow = OperationQueue()
    
    private init() { }
    
    func serveClient(_ data: HeadBankTask) {
        bankWindow.maxConcurrentOperationCount = 1
        let headBankTask = HeadBankTask()
        headBankTask.waitingNumber = data.waitingNumber
        headBankTask.creditRate = data.creditRate
        headBankTask.workType = data.workType
        bankWindow.addOperation(headBankTask)
        headBankTask.waitUntilFinished()
    }
}

