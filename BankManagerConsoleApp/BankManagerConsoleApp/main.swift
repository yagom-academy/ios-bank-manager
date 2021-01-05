//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

private let startMessage = "1 : 은행개점\n2 : 종료\n입력 : "
private let terminateCode = 2
private var isTerminate = false

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
    while !isTerminate {
        print(startMessage, terminator: "")
        guard let inputText = readLine() else {
            throw BankError.input
        }
        guard let inputCode = Int(inputText) else {
            throw BankError.number
        }
        if inputCode == terminateCode {
            isTerminate = true
            break
        }
    }
}

do {
    try startManage()
} catch {
    showError(error)
}

