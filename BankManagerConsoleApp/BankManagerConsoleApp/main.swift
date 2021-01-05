//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

private let startMessage = "1 : 은행개점\n2 : 종료\n입력 : "
private let openCode = 1
private let terminateCode = 2
private var isTerminate = false

enum BankInformation {
    static let windowNumber = 1
    static let bankersNumber = 1
    static let bankersProcessingTime = 0.7
}

// MARK: - Error Handling
private func showError(_ error: Error) {
    let errorMessage: String
    if let bankError = error as? BankError {
        errorMessage = bankError.localizedDescription
    } else {
        errorMessage = BankError.unknow.localizedDescription
    }
    print(errorMessage)
}

private func startManage() throws {
    BankManager.shared.initBank(windowNumber: BankInformation.windowNumber, bankersNumber: BankInformation.bankersNumber, bankersProcessingTime: BankInformation.bankersProcessingTime)
    while !isTerminate {
        print(startMessage, terminator: "")
        guard let inputText = readLine() else {
            throw BankError.input
        }
        guard let inputCode = Int(inputText) else {
            showError(BankError.number)
            continue
        }
        guard inputCode == terminateCode || inputCode == openCode else {
            showError(BankError.mismatchNumber)
            continue
        }
        
        if inputCode == terminateCode {
            isTerminate = true
            break
        }
        if inputCode == openCode {
            try BankManager.shared.openBank(customersNumber: Int.random(in: 10...30))
        }
    }
}

do {
    try startManage()
} catch {
    showError(error)
}

