//
//  ErrorHandling.swift
//  BankManagerConsoleApp
//
//  Created by Wonhee on 2021/01/05.
//

import Foundation

class ErrorHandling {
    func showError(_ error: Error) {
        let errorMessage: String
        if let bankError = error as? BankError {
            errorMessage = bankError.localizedDescription
        } else {
            errorMessage = BankError.unknow.localizedDescription
        }
        print(errorMessage)
        exitApp()
    }
    
    private func exitApp() {
        exit(1)
    }
}
