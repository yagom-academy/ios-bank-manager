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
    let semaphore = DispatchSemaphore(value: 1)
    
    private init() {
        self.bankWindow.maxConcurrentOperationCount = 1
    }
    
    func serveClient(_ clientData: HeadBankTask) {
        semaphore.wait()
        bankWindow.addOperation(clientData)
        semaphore.signal()
        clientData.waitUntilFinished()
    }
}
