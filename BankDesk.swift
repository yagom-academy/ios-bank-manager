//
//  BankDesk.swift
//  BankManagerConsoleApp
//
//  Created by goat, Andrew on 2023/03/09.
//

import Foundation

struct BankDesk {
    
    var bankManager = BankManager()
    
    private func showMenuMessage() {
        print("1 : \(MenuMessage.bankOpen)\n2 : \(MenuMessage.bankClose)\n\(MenuMessage.input)", terminator: "")
    }
    
    private mutating func createCustomerCount() {
        let customerCount = Int.random(in: 10...30)
        bankManager.customerCount = customerCount
    }
    
    mutating func openBanking() {

        while true {
            showMenuMessage()
            if let inputNumber = readLine() {
                if inputNumber == "1" {
                    createCustomerCount()
                    bankManager.manageBanking()
                } else if inputNumber == "2" {
                    print(MenuMessage.bankClose)
                    break
                } else {
                    print(MenuMessage.inputErrorMessage)
                }
            }
        }
    }
}
