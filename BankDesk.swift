//
//  BankDesk.swift
//  BankManagerConsoleApp
//
//  Created by goat, Andrew on 2023/03/09.
//

import Foundation

struct BankDesk {
    
    var bankManager = BankManager()
    
    func showMenuMessage(){
        print("1 :\(menuMessage.bankOpen)")
        print("2 : \(menuMessage.bankClose)")
        print(menuMessage.input, terminator: "")
    }
    
    func inputBankingMenu() {
        showMenuMessage()
        let customerCount = Int.random(in: 10...30)
        bankManager.customerCount = customerCount
        
        while let inputNumber = readLine() {
            if inputNumber == "2" {
                print(menuMessage.bankClose)
                return
            } else if inputNumber == "1" {
                bankManager.manageBanking()
                showMenuMessage()
            } else {
                print(menuMessage.inputErrorMessage)
                showMenuMessage()
            }
        }
    }
}
