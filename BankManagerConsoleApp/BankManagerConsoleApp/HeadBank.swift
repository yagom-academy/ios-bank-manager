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
        let semaphore = DispatchSemaphore(value: 1)
        bankWindow.maxConcurrentOperationCount = 1
        let headBankTask = acceptClientDocument(data)
        semaphore.wait()
        bankWindow.addOperation(headBankTask)
        semaphore.signal()
        headBankTask.waitUntilFinished()
    }
    
    private func acceptClientDocument(_ data: HeadBankTask) -> HeadBankTask {
        let headBankTask = HeadBankTask()
        headBankTask.waitingNumber = data.waitingNumber
        headBankTask.creditRate = data.creditRate
        headBankTask.workType = data.workType
        return headBankTask
    }
}
