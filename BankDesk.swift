//
//  BankDesk.swift
//  BankManagerConsoleApp
//
//  Created by goat, Andrew on 2023/03/09.
//

import Foundation

struct BankDesk {
    private var bankManager = BankManager()
    
    private func showMenuMessage() {
        print("1 : \(MenuMessage.bankOpen)\n2 : \(MenuMessage.bankClose)\n\(MenuMessage.input)", terminator: "")
    }
    
    private func createCustomerCount() {
        let customerCount = Int.random(in: 10...30)
        bankManager.customerCount = customerCount
    }
    
    func startBanking() {
        showMenuMessage()
        while let inputNumber = readLine() {
            if inputNumber == "1" {
                createCustomerCount()
                bankManager.insertCustomerCountToQueue()
                bankManager.manageBanking()
            } else if inputNumber == "2" {
                print(MenuMessage.bankClose)
                break
            } else {
                print(MenuMessage.inputErrorMessage)
            }
            showMenuMessage()
        }
    }
}
